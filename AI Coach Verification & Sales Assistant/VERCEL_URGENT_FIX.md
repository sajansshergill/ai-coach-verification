# 🚨 URGENT: Vercel Using Wrong Commit

## The Problem
Vercel is deploying commit `16c4756` (OLD)  
**Latest commit is:** `5bb5c34` (NEW - has `api.js` fix)

## ⚠️ CRITICAL: You MUST Delete and Recreate Project

Vercel is stuck on the old commit. You need to start fresh.

---

## Step-by-Step Fix

### 1. DELETE Current Project
1. Go to: https://vercel.com/dashboard
2. Click: `ai-coach-verification` project
3. Go to: **Settings** (top menu)
4. Scroll to bottom
5. Click: **"Delete Project"**
6. Type project name to confirm
7. Click: **"Delete"**

### 2. CREATE NEW Project
1. Click: **"Add New..."** → **"Project"**
2. Find: `sajansshergill/ai-coach-verification`
3. Click: **"Import"**

### 3. Configure (DO THIS EXACTLY)
1. **Root Directory:**
   - Click **"Edit"** next to Root Directory
   - Change from `/` to: **`web-app`**
   - ⚠️ THIS IS CRITICAL

2. **Framework Preset:** Other

3. **Build Settings:**
   - Build Command: **LEAVE EMPTY**
   - Output Directory: **LEAVE EMPTY**
   - Install Command: `npm install`

4. **Environment Variables:**
   - Click **"Add"**
   - Key: `OPENAI_API_KEY`
   - Value: Your API key
   - Environment: Check all (Production, Preview, Development)
   - Click **"Add"**

5. **Click "Deploy"**

---

## What Should Happen

✅ Build should complete successfully  
✅ Function name will be `api.js` (no spaces)  
✅ No errors about invalid function names  

---

## Current File Structure (Correct)

```
web-app/
├── api.js          ← Serverless function (NO FOLDER!)
├── server.js       ← Express app
├── vercel.json     ← Routes to api.js
├── package.json
└── public/         ← Static files
```

**NO `api/` folder exists anymore!**

---

## Why Delete and Recreate?

Vercel has cached the old project configuration. Even if you push new code, it's still using the old setup. Starting fresh ensures it uses the latest code with `api.js`.

---

## After Deployment

Your site will be live at:
```
https://ai-coach-verification.vercel.app
```

---

**DELETE THE PROJECT AND CREATE A NEW ONE. This is the only way to fix it now.**
