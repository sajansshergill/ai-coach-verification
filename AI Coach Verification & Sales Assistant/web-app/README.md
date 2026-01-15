# AI Coach Verification Web Application

Complete web application implementing all features from the AI Coach Verification & Sales Assistant package.

---

## 🚀 Quick Start

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- OpenAI API key (get from https://platform.openai.com/api-keys)

**Note:** The web app is optional. You can test the core system in 15 minutes using just ChatGPT or Claude—see `START_HERE.md` for the no-code test.

### Installation

1. **Navigate to web-app directory:**
   ```bash
   cd web-app
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Set up environment variables:**
   ```bash
   cp .env.example .env
   ```
   
   Edit `.env` and add your OpenAI API key:
   ```
   OPENAI_API_KEY=your_actual_api_key_here
   ```

4. **Start the server:**
   ```bash
   npm start
   ```

5. **Open in browser:**
   - Main page: http://localhost:3000
   - Coach Onboarding: http://localhost:3000/onboarding.html
   - Admin Dashboard: http://localhost:3000/admin.html
   - Lead Response: http://localhost:3000/leads.html

---

## 📁 Project Structure

```
web-app/
├── server.js              # Express server with API endpoints
├── package.json           # Dependencies
├── .env.example          # Environment variables template
├── data/                 # JSON data storage (auto-created)
│   └── coaches.json      # Coach data (auto-created)
└── public/               # Frontend files
    ├── index.html        # Homepage
    ├── onboarding.html   # Coach onboarding interface
    ├── admin.html        # Admin dashboard
    ├── leads.html        # Lead response assistant
    ├── styles.css        # All styles
    └── app.js            # Client-side JavaScript
```

---

## ✨ Features

### 1. Coach Onboarding
- AI-guided conversational credential collection
- Real-time verification progress
- Automatic trust summary generation

### 2. Admin Dashboard
- View all coaches
- Filter by status
- Review coach profiles
- Approve/Reject coaches
- Generate trust summaries

### 3. Lead Response Assistant
- Generate professional lead responses
- Handle objections
- Include call booking
- Multiple example templates

---

## 🔧 Configuration

### Environment Variables

Create a `.env` file with:

```env
OPENAI_API_KEY=your_key_here
OPENAI_MODEL=gpt-4
PORT=3000
```

### Using Different AI Models

You can use different OpenAI models:
- `gpt-4` (default, best quality)
- `gpt-4-turbo-preview` (faster, good quality)
- `gpt-3.5-turbo` (faster, lower cost)

Just change `OPENAI_MODEL` in your `.env` file.

---

## 📡 API Endpoints

### Health Check
```
GET /api/health
```

### Coaches
```
GET    /api/coaches           # Get all coaches
GET    /api/coaches/:id       # Get single coach
POST   /api/coaches           # Create new coach
PUT    /api/coaches/:id       # Update coach
```

### AI Features
```
POST   /api/coaches/:id/start          # Start onboarding conversation
POST   /api/coaches/:id/chat           # Send message in conversation
POST   /api/coaches/:id/generate-summary  # Generate trust summary
POST   /api/leads/response             # Generate lead response
```

---

## 🗄️ Data Storage

Currently uses JSON file storage (`data/coaches.json`). For production, you should:

1. **Replace with database** (MongoDB, PostgreSQL, etc.)
2. **Add authentication** (JWT, OAuth, etc.)
3. **Add file upload handling** for certificates/screenshots
4. **Add email notifications** (SendGrid, Mailgun, etc.)

See `automations/` directory for email templates.

---

## 🎨 Customization

### Change Branding

1. Edit `public/styles.css` - Update colors in CSS variables
2. Edit HTML files - Replace "CoachMarket" with your platform name
3. Edit `server.js` - Update welcome messages

### Customize Prompts

The server automatically loads prompts from:
- `../ai-onboarding/coach-onboarding-prompt.txt`
- `../ai-onboarding/trust-summary-prompt.txt`

If these files don't exist, it uses fallback prompts. You can customize these files or modify `server.js` to use custom prompts.

---

## 🚀 Deployment

### Option 1: Simple Hosting (Heroku, Railway, Render)

1. Add your `.env` variables to the hosting platform
2. Push code to Git
3. Deploy

### Option 2: VPS (DigitalOcean, AWS, etc.)

1. Install Node.js on server
2. Clone repository
3. Install dependencies: `npm install`
4. Set environment variables
5. Use PM2 to run: `pm2 start server.js`

### Option 3: Docker

Create `Dockerfile`:
```dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

---

## 🔒 Production Checklist

Before deploying to production:

- [ ] Replace JSON storage with database
- [ ] Add authentication/authorization
- [ ] Set up environment variables securely
- [ ] Add rate limiting
- [ ] Add input validation
- [ ] Add error logging
- [ ] Set up SSL/HTTPS
- [ ] Add file upload handling
- [ ] Set up email notifications
- [ ] Add backup system

---

## 🐛 Troubleshooting

### Server won't start
- Check if port 3000 is available
- Make sure all dependencies are installed: `npm install`
- Check Node.js version: `node --version` (need v16+)

### AI features not working
- Verify OpenAI API key is set in `.env`
- Check API key is valid and has credits
- Check console for error messages

### Data not saving
- Check `data/` directory exists and is writable
- Check file permissions

---

## 📚 Next Steps

1. **Review the prompts** in `../ai-onboarding/` directory
2. **Customize for your platform** - Update branding and requirements
3. **Add database** - Replace JSON storage with proper database
4. **Add authentication** - Secure admin dashboard
5. **Deploy** - Get it live!

---

## 🆘 Support

- Review main `README.md` for package overview
- Check `START_HERE.md` for setup guide
- See `TEST_NOW.md` for testing instructions
- Check `examples/` directory for sample outputs

---

**Ready to transform your coach onboarding process! 🚀**
