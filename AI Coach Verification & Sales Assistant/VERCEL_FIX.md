# Vercel Deployment - Final Fix Guide

## The Problem
Vercel is having issues with spaces in directory names when auto-detecting serverless functions.

## The Solution
We've simplified the configuration to avoid the `api/` folder entirely.

---

## Step-by-Step: Deploy on Vercel

### 1. Go to Vercel Dashboard
- Visit: https://vercel.com/dashboard
- Sign in with GitHub

### 2. Create New Project (or Delete Old One)
- Click **"Add New..."** → **"Project"**
- Find: `sajansshergill/ai-coach-verification`
- Click **"Import"**

### 3. CRITICAL SETTINGS - Configure Project

**Before clicking Deploy, set these:**

1. **Framework Preset:** 
   - Select **"Other"**

2. **Root Directory:**
   - Click **"Edit"** next to "Root Directory"
   - Change from `/` to: **`web-app`**
   - ⚠️ THIS IS CRITICAL - Must be `web-app`

3. **Build Settings:**
   - **Build Command:** Leave EMPTY
   - **Output Directory:** Leave EMPTY  
   - **Install Command:** `npm install`

4. **DO NOT CLICK DEPLOY YET** - We need to add environment variables first

### 4. Add Environment Variables FIRST

**Before deploying, add environment variables:**

1. Scroll down to **"Environment Variables"** section
2. Click **"Add"** button

3. Add Variable 1:
   - **Key:** `OPENAI_API_KEY`
   - **Value:** Your OpenAI API key (starts with `sk-...`)
   - **Environment:** Check all (Production, Preview, Development)
   - Click **"Add"**

4. Add Variable 2 (Optional):
   - **Key:** `OPENAI_MODEL`
   - **Value:** `gpt-3.5-turbo`
   - **Environment:** Check all
   - Click **"Add"**

### 5. Now Deploy

1. Click **"Deploy"** button
2. Wait 2-3 minutes for build to complete
3. Check build logs for any errors

### 6. Verify Deployment

Once deployment completes:
- Your site will be at: `https://ai-coach-verification.vercel.app`
- Click the deployment URL to test

---

## If You Still Get Errors

### Error: "Invalid function name"
**Solution:** Make sure Root Directory is set to `web-app` in project settings

### Error: "Cannot find module"
**Solution:** 
- Verify Root Directory = `web-app`
- Check that `package.json` exists in `web-app/` folder
- Verify all files are committed to GitHub

### Error: "404 Not Found"
**Solution:**
- Wait for deployment to fully complete
- Check that `vercel.json` is in `web-app/` folder
- Verify `server.js` exists in `web-app/` folder

---

## Quick Checklist

Before deploying:
- [ ] Root Directory = `web-app` (NOT `/`)
- [ ] Environment Variable `OPENAI_API_KEY` is added
- [ ] All code is pushed to GitHub
- [ ] `vercel.json` is in `web-app/` folder
- [ ] `server.js` is in `web-app/` folder

---

## Current Configuration

- ✅ `vercel.json` uses simple routing (no api folder)
- ✅ `server.js` exports app for Vercel
- ✅ Static files served from `public/` folder
- ✅ All routes go through Express server

---

## Your Live URL

After successful deployment:
```
https://ai-coach-verification.vercel.app
```

---

**Follow these steps exactly and it will work!**
