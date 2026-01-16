# Fresh Vercel Deployment - Step by Step

## Complete Guide to Deploy from Scratch

### Step 1: Go to Vercel
1. Open: https://vercel.com
2. Sign in with your GitHub account (use the same account that has your repository)

---

### Step 2: Create New Project
1. Click **"Add New..."** button (top right)
2. Select **"Project"**

---

### Step 3: Import Your Repository
1. You'll see a list of your GitHub repositories
2. Find and click on: **`sajansshergill/ai-coach-verification`**
3. Click **"Import"**

---

### Step 4: Configure Project Settings

**IMPORTANT - These settings are critical:**

1. **Framework Preset:**
   - Select: **"Other"** (or leave as default)

2. **Root Directory:**
   - Click **"Edit"** next to Root Directory
   - Change from `/` to: **`web-app`**
   - This is CRITICAL - your server.js is in the web-app folder

3. **Build and Output Settings:**
   - **Build Command:** Leave empty (or `npm install`)
   - **Output Directory:** Leave empty
   - **Install Command:** `npm install` (should be auto-filled)

4. **Click "Deploy"** (don't add environment variables yet - we'll do that after)

---

### Step 5: Wait for Initial Deployment
- Vercel will start building
- This will fail initially (expected - we need to add environment variables)
- Wait for it to complete (about 2-3 minutes)

---

### Step 6: Add Environment Variables

Once deployment starts (even if it fails):

1. Go to your project dashboard
2. Click **"Settings"** (top menu)
3. Click **"Environment Variables"** (left sidebar)

4. Add these variables:

   **Variable 1:**
   - **Name:** `OPENAI_API_KEY`
   - **Value:** Your OpenAI API key (starts with `sk-...`)
   - **Environment:** Select all (Production, Preview, Development)
   - Click **"Save"**

   **Variable 2 (Optional):**
   - **Name:** `OPENAI_MODEL`
   - **Value:** `gpt-3.5-turbo`
   - **Environment:** Select all
   - Click **"Save"**

---

### Step 7: Redeploy with Environment Variables

1. Go to **"Deployments"** tab
2. Find the latest deployment
3. Click the **three dots (⋯)** menu
4. Click **"Redeploy"**
5. Make sure **"Use existing Build Cache"** is checked
6. Click **"Redeploy"**

---

### Step 8: Wait for Deployment

- Build will take 2-3 minutes
- Watch the build logs for any errors
- Once complete, you'll see "Ready" status

---

### Step 9: Access Your Site

Your site will be live at:
```
https://ai-coach-verification.vercel.app
```

Or check the deployment page for the exact URL.

---

## Quick Checklist

- [ ] Signed in to Vercel with GitHub
- [ ] Imported repository: `sajansshergill/ai-coach-verification`
- [ ] Set Root Directory to: `web-app` ⚠️ CRITICAL
- [ ] Added environment variable: `OPENAI_API_KEY`
- [ ] Redeployed after adding environment variables
- [ ] Site is live and working

---

## Troubleshooting

### Issue: Still seeing 404
**Solution:** 
- Verify Root Directory is set to `web-app`
- Check deployment logs for errors
- Make sure all files are committed to GitHub

### Issue: Build fails
**Solution:**
- Check build logs in Vercel
- Make sure `package.json` is in `web-app` folder
- Verify all dependencies are listed in `package.json`

### Issue: API calls not working
**Solution:**
- Verify `OPENAI_API_KEY` environment variable is set
- Check it's enabled for Production environment
- Check function logs in Vercel dashboard

### Issue: Can't find repository
**Solution:**
- Make sure you're signed in with the correct GitHub account
- Check repository is public (or grant Vercel access to private repos)
- Try refreshing the repository list

---

## Your Site URLs

After successful deployment:
- **Production:** `https://ai-coach-verification.vercel.app`
- **Preview URLs:** Each commit gets a unique preview URL

---

## Need Help?

If you get stuck:
1. Check the build logs in Vercel
2. Verify Root Directory is `web-app`
3. Make sure environment variables are set
4. Check that all code is pushed to GitHub

**You're all set! Follow these steps and your site will be live in about 5 minutes.**
