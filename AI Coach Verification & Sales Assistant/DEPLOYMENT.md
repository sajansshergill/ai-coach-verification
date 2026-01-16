# Deployment Guide

This application requires a Node.js backend server. GitHub Pages only serves static files, so you'll need to deploy to a platform that supports Node.js.

---

## 🚀 Quick Deploy: Vercel (Recommended)

### Step 1: Create New Project on Vercel

1. Go to: https://vercel.com
2. Sign in with GitHub
3. Click **"Add New..."** → **"Project"**
4. Import: `sajansshergill/ai-coach-verification`

### Step 2: Configure Project

**CRITICAL SETTINGS:**

1. **Root Directory:**
   - Click **"Edit"** next to Root Directory
   - Change from `/` to: **`web-app`** ⚠️ REQUIRED

2. **Framework Preset:** Other

3. **Build Settings:**
   - Build Command: Leave empty
   - Output Directory: Leave empty
   - Install Command: `npm install`

4. **Environment Variables:**
   - Add `OPENAI_API_KEY` = your OpenAI API key
   - Optional: `OPENAI_MODEL` = `gpt-3.5-turbo`

5. **Click "Deploy"**

### Step 3: Access Your Site

After deployment (2-3 minutes), your site will be live at:
```
https://ai-coach-verification.vercel.app
```

---

## Alternative Deployment Options

### Option 2: Netlify

1. Go to [netlify.com](https://netlify.com)
2. New site from Git → Select repository
3. Build command: `cd web-app && npm install`
4. Publish directory: `web-app/public`
5. Add environment variables: `OPENAI_API_KEY`
6. Deploy!

### Option 3: Railway

1. Go to [railway.app](https://railway.app)
2. New Project → Deploy from GitHub
3. Root directory: `web-app`
4. Build command: `npm install`
5. Start command: `npm start`
6. Add environment variables
7. Deploy!

### Option 4: Render

1. Go to [render.com](https://render.com)
2. New → Web Service
3. Connect GitHub repository
4. Root directory: `web-app`
5. Build: `npm install`
6. Start: `npm start`
7. Add environment variables
8. Deploy!

---

## GitHub Pages (Static Preview Only)

GitHub Pages is configured but only shows the UI. Backend features won't work.

To enable:
1. Go to repository Settings → Pages
2. Source: GitHub Actions
3. Site will be at: `https://sajansshergill.github.io/ai-coach-verification/`

**Note:** Full functionality requires backend deployment (use Vercel/Netlify/etc.)

---

## Environment Variables

All platforms require:

```env
OPENAI_API_KEY=your_openai_api_key_here
OPENAI_MODEL=gpt-3.5-turbo  # Optional
```

---

## Troubleshooting

### Vercel: "Invalid function name"
- Make sure Root Directory is set to `web-app`
- Delete and recreate project if needed

### Build fails
- Check Root Directory = `web-app`
- Verify `package.json` exists in `web-app/`
- Check build logs for specific errors

### API calls not working
- Verify `OPENAI_API_KEY` environment variable is set
- Check function logs in deployment dashboard
- Verify API endpoints are accessible

---

## Current Configuration

- **Entry Point:** `web-app/api.js`
- **Server:** `web-app/server.js`
- **Static Files:** `web-app/public/`
- **Config:** `web-app/vercel.json`

---

**Recommended:** Use Vercel for easiest deployment with full functionality.
