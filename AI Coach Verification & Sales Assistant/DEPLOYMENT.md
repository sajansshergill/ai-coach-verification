# Deployment Guide

This application requires a Node.js backend server. GitHub Pages only serves static files, so you'll need to deploy to a platform that supports Node.js.

## Quick Deploy Options

### Option 1: Vercel (Recommended - Easiest)

1. **Install Vercel CLI:**
   ```bash
   npm i -g vercel
   ```

2. **Deploy:**
   ```bash
   cd web-app
   vercel
   ```

3. **Set environment variables:**
   - Go to your Vercel dashboard
   - Add `OPENAI_API_KEY` in Settings → Environment Variables
   - Add `OPENAI_MODEL` (optional, defaults to gpt-3.5-turbo)
   - Add `PORT` (optional, Vercel handles this)

4. **Done!** Your app will be live at `https://your-project.vercel.app`

**Or use the Vercel web interface:**
- Push your code to GitHub
- Go to [vercel.com](https://vercel.com)
- Import your GitHub repository
- Set root directory to `web-app`
- Add environment variables
- Deploy!

---

### Option 2: Netlify

1. **Install Netlify CLI:**
   ```bash
   npm i -g netlify-cli
   ```

2. **Deploy:**
   ```bash
   cd web-app
   netlify deploy --prod
   ```

3. **Set environment variables:**
   - Go to Site settings → Environment variables
   - Add `OPENAI_API_KEY`
   - Add `OPENAI_MODEL` (optional)

**Or use Netlify web interface:**
- Push to GitHub
- Go to [netlify.com](https://netlify.com)
- New site from Git → Select repository
- Build command: `cd web-app && npm install`
- Publish directory: `web-app/public`
- Add environment variables
- Deploy!

---

### Option 3: Railway

1. **Go to [railway.app](https://railway.app)**

2. **New Project → Deploy from GitHub**

3. **Select your repository**

4. **Configure:**
   - Root directory: `web-app`
   - Build command: `npm install`
   - Start command: `npm start`

5. **Add environment variables:**
   - `OPENAI_API_KEY`
   - `OPENAI_MODEL` (optional)
   - `PORT` (Railway sets this automatically)

6. **Deploy!**

---

### Option 4: Render

1. **Go to [render.com](https://render.com)**

2. **New → Web Service**

3. **Connect GitHub repository**

4. **Configure:**
   - Name: `ai-coach-verification`
   - Environment: `Node`
   - Build command: `cd web-app && npm install`
   - Start command: `cd web-app && npm start`
   - Root directory: `web-app`

5. **Add environment variables:**
   - `OPENAI_API_KEY`
   - `OPENAI_MODEL` (optional)

6. **Deploy!**

---

### Option 5: Heroku

1. **Install Heroku CLI:**
   ```bash
   npm i -g heroku
   ```

2. **Create Heroku app:**
   ```bash
   cd web-app
   heroku create your-app-name
   ```

3. **Set environment variables:**
   ```bash
   heroku config:set OPENAI_API_KEY=your_key_here
   heroku config:set OPENAI_MODEL=gpt-3.5-turbo
   ```

4. **Deploy:**
   ```bash
   git push heroku main
   ```

---

## GitHub Pages (Static Preview Only)

GitHub Pages is set up to show a static preview of the frontend, but **full functionality requires the backend server**.

The static preview is available at:
`https://[your-username].github.io/ai-coach-verification/`

**Note:** The static preview will show the UI but API calls won't work. Use one of the options above for full functionality.

---

## Environment Variables

All deployment options require these environment variables:

```env
OPENAI_API_KEY=your_openai_api_key_here
OPENAI_MODEL=gpt-3.5-turbo  # Optional, defaults to gpt-3.5-turbo
PORT=3000  # Optional, most platforms set this automatically
```

---

## File Uploads

For file uploads to work in production:

1. **Vercel:** Uses serverless functions - file uploads work automatically
2. **Netlify:** May need serverless functions setup
3. **Railway/Render:** File uploads work with persistent storage
4. **Heroku:** File uploads work with ephemeral storage (consider S3 for production)

---

## Recommended for Production

**Best option:** **Vercel** or **Railway**
- Easy setup
- Free tier available
- Automatic HTTPS
- Good performance
- Easy environment variable management

---

## Troubleshooting

### API calls not working
- Make sure you deployed the backend, not just static files
- Check environment variables are set correctly
- Verify the API endpoints are accessible

### File uploads not working
- Check file size limits (default is 10MB)
- Verify multer configuration
- Check server logs for errors

### OpenAI API errors
- Verify `OPENAI_API_KEY` is set correctly
- Check API key has credits/quota
- Verify model name is correct

---

## Need Help?

Check the main `README.md` or `web-app/README.md` for more details.
