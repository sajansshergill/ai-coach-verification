# Deploy to Vercel - Step by Step Guide

## Quick Deploy (5 minutes)

### Method 1: Using Vercel Web Interface (Easiest)

1. **Go to Vercel:**
   - Visit: https://vercel.com
   - Sign in with your GitHub account

2. **Import Your Repository:**
   - Click "Add New..." → "Project"
   - Find and select: `sajansshergill/ai-coach-verification`
   - Click "Import"

3. **Configure Project:**
   - **Framework Preset:** Other
   - **Root Directory:** `web-app` (IMPORTANT - change from default!)
   - **Build Command:** Leave empty (or `npm install`)
   - **Output Directory:** Leave empty
   - **Install Command:** `npm install`

4. **Add Environment Variables:**
   Click "Environment Variables" and add:
   - **Name:** `OPENAI_API_KEY`
   - **Value:** Your OpenAI API key (starts with `sk-...`)
   - Click "Add"
   
   Optional:
   - **Name:** `OPENAI_MODEL`
   - **Value:** `gpt-3.5-turbo` (or `gpt-4` if you have access)

5. **Deploy:**
   - Click "Deploy"
   - Wait 2-3 minutes for deployment
   - Your site will be live at: `https://ai-coach-verification.vercel.app` (or similar)

6. **Access Your Site:**
   - Vercel will show you the deployment URL
   - It will look like: `https://ai-coach-verification-xyz.vercel.app`
   - Click the URL to view your live site!

---

### Method 2: Using Vercel CLI (For Developers)

1. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

2. **Navigate to web-app directory:**
   ```bash
   cd web-app
   ```

3. **Login to Vercel:**
   ```bash
   vercel login
   ```

4. **Deploy:**
   ```bash
   vercel
   ```
   
   Follow the prompts:
   - Link to existing project? No
   - Project name: `ai-coach-verification`
   - Directory: `./`
   - Override settings? No

5. **Set Environment Variables:**
   ```bash
   vercel env add OPENAI_API_KEY
   # Paste your API key when prompted
   
   vercel env add OPENAI_MODEL
   # Enter: gpt-3.5-turbo
   ```

6. **Deploy to Production:**
   ```bash
   vercel --prod
   ```

---

## After Deployment

### Your Live URLs:
- **Production:** `https://your-project-name.vercel.app`
- **Preview:** Each commit gets a preview URL

### Test Your Deployment:
1. Visit your Vercel URL
2. Try the onboarding flow
3. Test the admin dashboard
4. Verify AI features work

---

## Troubleshooting

### Issue: "Cannot find module"
**Solution:** Make sure Root Directory is set to `web-app` in Vercel settings

### Issue: API calls not working
**Solution:** 
- Check environment variables are set correctly
- Verify `OPENAI_API_KEY` is added
- Check Vercel function logs for errors

### Issue: File uploads not working
**Solution:** Vercel serverless functions have a 4.5MB limit. For larger files, consider:
- Using Vercel Blob storage
- Or deploying to Railway/Render instead

### Issue: "Function timeout"
**Solution:** 
- OpenAI API calls can be slow
- Increase function timeout in Vercel settings (Settings → Functions)
- Default is 10 seconds, increase to 30-60 seconds

---

## Environment Variables Reference

Required:
- `OPENAI_API_KEY` - Your OpenAI API key

Optional:
- `OPENAI_MODEL` - Model to use (default: `gpt-3.5-turbo`)
- `PORT` - Port number (Vercel sets this automatically)

---

## Updating Your Deployment

Every time you push to GitHub:
1. Vercel automatically detects changes
2. Creates a new preview deployment
3. You can promote previews to production

Or manually deploy:
```bash
cd web-app
vercel --prod
```

---

## Vercel Dashboard

Access your dashboard at: https://vercel.com/dashboard

From here you can:
- View all deployments
- Check logs
- Manage environment variables
- View analytics
- Configure domains

---

## Next Steps

1. ✅ Deploy to Vercel (follow steps above)
2. ✅ Test all features
3. ✅ Set up custom domain (optional)
4. ✅ Configure environment variables
5. ✅ Monitor usage and logs

**Your site will be live and fully functional!**
