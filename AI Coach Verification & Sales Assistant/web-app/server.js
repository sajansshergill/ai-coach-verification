const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');
const fs = require('fs').promises;
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(express.static('public'));

// Data storage (using JSON file - replace with database in production)
const DATA_FILE = path.join(__dirname, 'data', 'coaches.json');

// Ensure data directory exists
async function ensureDataDir() {
  const dataDir = path.join(__dirname, 'data');
  try {
    await fs.mkdir(dataDir, { recursive: true });
  } catch (error) {
    // Directory might already exist
  }
  
  // Initialize coaches.json if it doesn't exist
  try {
    await fs.access(DATA_FILE);
  } catch {
    await fs.writeFile(DATA_FILE, JSON.stringify([], null, 2));
  }
}

// Read coaches data
async function readCoaches() {
  try {
    const data = await fs.readFile(DATA_FILE, 'utf8');
    return JSON.parse(data);
  } catch (error) {
    return [];
  }
}

// Write coaches data
async function writeCoaches(coaches) {
  await fs.writeFile(DATA_FILE, JSON.stringify(coaches, null, 2));
}

// Initialize OpenAI client
const OpenAI = require('openai');
let openai;

if (process.env.OPENAI_API_KEY) {
  openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY,
  });
}

// Helper function to get AI response
async function getAIResponse(messages, systemPrompt) {
  if (!openai) {
    return {
      error: 'OpenAI API key not configured. Please set OPENAI_API_KEY in .env file'
    };
  }

  try {
    const response = await openai.chat.completions.create({
      model: process.env.OPENAI_MODEL || 'gpt-3.5-turbo',
      messages: [
        { role: 'system', content: systemPrompt },
        ...messages
      ],
      temperature: 0.7,
      max_tokens: 1000
    });

    return {
      message: response.choices[0].message.content
    };
  } catch (error) {
    console.error('OpenAI API Error:', error);
    return {
      error: error.message || 'Error communicating with AI'
    };
  }
}

// Load AI prompts
async function loadPrompt(filename) {
  const promptPath = path.join(__dirname, '..', 'ai-onboarding', filename);
  try {
    return await fs.readFile(promptPath, 'utf8');
  } catch (error) {
    // Fallback to built-in prompts
    return getFallbackPrompt(filename);
  }
}

function getFallbackPrompt(filename) {
  if (filename === 'coach-onboarding-prompt.txt') {
    return `You are a friendly, professional onboarding assistant for a coaching marketplace. 
    Guide coaches through verification conversationally. Be warm, helpful, and clear. 
    Collect credentials step by step: certifications, experience, website, testimonials, payment proof.`;
  }
  return '';
}

// API Routes

// Health check
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', message: 'Server is running' });
});

// Get all coaches
app.get('/api/coaches', async (req, res) => {
  try {
    const coaches = await readCoaches();
    res.json(coaches);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get single coach
app.get('/api/coaches/:id', async (req, res) => {
  try {
    const coaches = await readCoaches();
    const coach = coaches.find(c => c.id === req.params.id);
    
    if (!coach) {
      return res.status(404).json({ error: 'Coach not found' });
    }
    
    res.json(coach);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create new coach session
app.post('/api/coaches', async (req, res) => {
  try {
    const { name, email } = req.body;
    
    if (!name || !email) {
      return res.status(400).json({ error: 'Name and email are required' });
    }

    const coaches = await readCoaches();
    
    const newCoach = {
      id: uuidv4(),
      name,
      email,
      tier: null,
      status: 'pending',
      credentials: {},
      conversation: [],
      trustSummary: null,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString()
    };

    coaches.push(newCoach);
    await writeCoaches(coaches);

    res.json(newCoach);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update coach
app.put('/api/coaches/:id', async (req, res) => {
  try {
    const coaches = await readCoaches();
    const index = coaches.findIndex(c => c.id === req.params.id);
    
    if (index === -1) {
      return res.status(404).json({ error: 'Coach not found' });
    }

    coaches[index] = {
      ...coaches[index],
      ...req.body,
      updatedAt: new Date().toISOString()
    };

    await writeCoaches(coaches);
    res.json(coaches[index]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// AI Chat endpoint - Continue conversation
app.post('/api/coaches/:id/chat', async (req, res) => {
  try {
    const { message } = req.body;
    
    if (!message) {
      return res.status(400).json({ error: 'Message is required' });
    }

    const coaches = await readCoaches();
    const coach = coaches.find(c => c.id === req.params.id);
    
    if (!coach) {
      return res.status(404).json({ error: 'Coach not found' });
    }

    // Load onboarding prompt
    const systemPrompt = await loadPrompt('coach-onboarding-prompt.txt');
    
    // Build conversation history
    const conversationMessages = coach.conversation.map(msg => ({
      role: msg.role,
      content: msg.content
    }));

    // Add current message
    conversationMessages.push({
      role: 'user',
      content: message
    });

    // Get AI response
    const aiResponse = await getAIResponse(conversationMessages, systemPrompt);

    if (aiResponse.error) {
      return res.status(500).json(aiResponse);
    }

    // Update coach conversation
    coach.conversation.push(
      { role: 'user', content: message, timestamp: new Date().toISOString() },
      { role: 'assistant', content: aiResponse.message, timestamp: new Date().toISOString() }
    );

    // Try to extract credentials from conversation
    coach.credentials = extractCredentials(coach.conversation);

    const coachIndex = coaches.findIndex(c => c.id === req.params.id);
    coaches[coachIndex] = coach;
    await writeCoaches(coaches);

    res.json({
      message: aiResponse.message,
      coach: coach
    });
  } catch (error) {
    console.error('Chat error:', error);
    res.status(500).json({ error: error.message });
  }
});

// AI Chat endpoint - Start conversation
app.post('/api/coaches/:id/start', async (req, res) => {
  try {
    const coaches = await readCoaches();
    const coach = coaches.find(c => c.id === req.params.id);
    
    if (!coach) {
      return res.status(404).json({ error: 'Coach not found' });
    }

    // Load onboarding prompt
    const systemPrompt = await loadPrompt('coach-onboarding-prompt.txt');
    
    // Generate initial greeting
    const initialMessage = `Hi ${coach.name}! 👋 Welcome to CoachMarket. I'm here to help you get verified and set up your profile so you can start receiving qualified leads.

**Why verification matters:**
Verified coaches get:
- Higher visibility in search results
- Better quality leads
- Increased trust from potential clients
- Access to premium features

**Verification Tiers:**
- **Basic** (Minimum requirements) - Quick approval, basic visibility
- **Pro** (Enhanced verification) - Higher visibility, featured listings, priority support
- **Premium** (Full verification) - Maximum visibility, premium leads, dedicated support

Let's get started! Which tier interests you? Or would you like me to explain the differences first?`;

    // Update coach conversation
    coach.conversation.push({
      role: 'assistant',
      content: initialMessage,
      timestamp: new Date().toISOString()
    });

    const coachIndex = coaches.findIndex(c => c.id === req.params.id);
    coaches[coachIndex] = coach;
    await writeCoaches(coaches);

    res.json({
      message: initialMessage,
      coach: coach
    });
  } catch (error) {
    console.error('Start conversation error:', error);
    res.status(500).json({ error: error.message });
  }
});

// Generate trust summary
app.post('/api/coaches/:id/generate-summary', async (req, res) => {
  try {
    const coaches = await readCoaches();
    const coach = coaches.find(c => c.id === req.params.id);
    
    if (!coach) {
      return res.status(404).json({ error: 'Coach not found' });
    }

    // Load trust summary prompt
    const systemPrompt = await loadPrompt('trust-summary-prompt.txt');
    
    // Build coach data for summary
    const coachData = `
Coach Name: ${coach.name}
Years of Experience: ${coach.credentials.experience?.years || 'N/A'}
Specialization: ${coach.credentials.specialization || 'N/A'}
Certifications: ${coach.credentials.certifications?.join(', ') || 'N/A'}
Website: ${coach.credentials.website || 'N/A'}
LinkedIn: ${coach.credentials.linkedin || 'N/A'}
Testimonials: ${coach.credentials.testimonials?.length || 0}
Payment Verified: ${coach.credentials.paymentVerified ? 'Yes' : 'No'}
`;

    const messages = [
      {
        role: 'user',
        content: `Generate a trust profile summary for this coach:\n\n${coachData}`
      }
    ];

    const aiResponse = await getAIResponse(messages, systemPrompt);

    if (aiResponse.error) {
      return res.status(500).json(aiResponse);
    }

    // Update coach
    coach.trustSummary = aiResponse.message;
    const coachIndex = coaches.findIndex(c => c.id === req.params.id);
    coaches[coachIndex] = coach;
    await writeCoaches(coaches);

    res.json({
      summary: aiResponse.message,
      coach: coach
    });
  } catch (error) {
    console.error('Generate summary error:', error);
    res.status(500).json({ error: error.message });
  }
});

// Generate lead response
app.post('/api/leads/response', async (req, res) => {
  try {
    const { leadMessage, coachProfile } = req.body;
    
    if (!leadMessage || !coachProfile) {
      return res.status(400).json({ error: 'Lead message and coach profile are required' });
    }

    // Load lead response prompt
    const systemPrompt = `You are an AI assistant that helps coaches write professional, effective responses to inbound leads.
    Generate warm, helpful responses that acknowledge the lead's inquiry, show understanding, provide value, and suggest a call booking with specific times.`;

    const messages = [
      {
        role: 'user',
        content: `Lead inquiry: "${leadMessage}"\n\nCoach profile: ${coachProfile}\n\nGenerate a professional response to this lead inquiry.`
      }
    ];

    const aiResponse = await getAIResponse(messages, systemPrompt);

    if (aiResponse.error) {
      return res.status(500).json(aiResponse);
    }

    res.json({
      response: aiResponse.message
    });
  } catch (error) {
    console.error('Generate lead response error:', error);
    res.status(500).json({ error: error.message });
  }
});

// Helper function to extract credentials from conversation
function extractCredentials(conversation) {
  const credentials = {
    certifications: [],
    experience: {},
    website: null,
    linkedin: null,
    testimonials: [],
    paymentVerified: false
  };

  // Simple extraction logic (can be enhanced)
  const conversationText = conversation.map(c => c.content).join(' ').toLowerCase();
  
  // Extract website
  const websiteMatch = conversationText.match(/(?:website|site):\s*([^\s]+\.(com|net|org|io))/i);
  if (websiteMatch) {
    credentials.website = websiteMatch[1];
  }

  // Extract LinkedIn
  const linkedinMatch = conversationText.match(/(?:linkedin|linkedin\.com[\/]in[\/])([^\s]+)/i);
  if (linkedinMatch) {
    credentials.linkedin = linkedinMatch[1];
  }

  return credentials;
}

// Initialize server
async function startServer() {
  await ensureDataDir();
  
  app.listen(PORT, () => {
    console.log(`🚀 Server running on http://localhost:${PORT}`);
    console.log(`📝 Coach Onboarding: http://localhost:${PORT}/onboarding.html`);
    console.log(`👤 Admin Dashboard: http://localhost:${PORT}/admin.html`);
    console.log(`💬 Lead Response: http://localhost:${PORT}/leads.html`);
    
    if (!process.env.OPENAI_API_KEY) {
      console.warn('⚠️  WARNING: OPENAI_API_KEY not set. AI features will not work.');
      console.warn('   Create a .env file with: OPENAI_API_KEY=your_key_here');
    }
  });
}

startServer();
