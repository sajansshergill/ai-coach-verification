# How to Start the Server

## Quick Start

1. **Navigate to the web-app directory:**
   ```bash
   cd web-app
   ```

2. **Install dependencies (if not already installed):**
   ```bash
   npm install
   ```

3. **Set up your environment variables:**
   Create a `.env` file in the `web-app` directory:
   ```
   OPENAI_API_KEY=your_api_key_here
   PORT=3000
   OPENAI_MODEL=gpt-3.5-turbo
   ```

4. **Start the server:**
   ```bash
   npm start
   ```
   
   Or for development with auto-restart:
   ```bash
   npm run dev
   ```

5. **Access the application:**
   - Home: http://localhost:3000
   - Onboarding: http://localhost:3000/onboarding.html
   - Admin: http://localhost:3000/admin.html
   - Leads: http://localhost:3000/leads.html

## Troubleshooting

### Port Already in Use
If you get "port 3000 already in use" error:
```bash
# Kill the process using port 3000
lsof -ti:3000 | xargs kill -9

# Or use a different port in .env
PORT=3001
```

### Server Won't Start
1. Check if all dependencies are installed: `npm install`
2. Check Node.js version: `node --version` (should be 14+)
3. Check for errors in the console output

### Connection Refused
1. Make sure the server is actually running (check console for startup messages)
2. Check if the port matches (default is 3000)
3. Try accessing http://127.0.0.1:3000 instead of localhost

## What the Server Does

- Serves static files from the `public` directory
- Handles API requests for coach management
- Processes file uploads for certifications and testimonials
- Connects to OpenAI for AI-powered features
- Stores data in `data/coaches.json` (for development)
