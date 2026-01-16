# How to Zip Your GitHub Repository

## Method 1: Download from GitHub (Easiest)

1. **Go to your repository:**
   - Visit: https://github.com/sajansshergill/ai-coach-verification

2. **Click the green "Code" button** (top right)

3. **Click "Download ZIP"**

4. **The ZIP file will download** to your Downloads folder

**Done!** The ZIP file will be named `ai-coach-verification-main.zip`

---

## Method 2: Using Git Archive (Command Line)

If you have the repository cloned locally:

```bash
cd "/Users/sajanshergill/AI Coach Verification & Sales Assistant"
git archive --format=zip --output=ai-coach-verification.zip main
```

This creates `ai-coach-verification.zip` in the current directory.

---

## Method 3: Using Zip Command (Local Files)

If you want to zip your current local files:

```bash
cd "/Users/sajanshergill"
zip -r "AI Coach Verification & Sales Assistant.zip" "AI Coach Verification & Sales Assistant" -x "*.git*" -x "*node_modules*" -x "*.DS_Store"
```

This creates a ZIP file excluding git files, node_modules, and system files.

---

## Recommended: Method 1 (GitHub Download)

**Easiest way:** Just download from GitHub's web interface. It automatically excludes `.git` folder and gives you a clean ZIP file.

---

## What Gets Included

- ✅ All source code
- ✅ All documentation files
- ✅ Configuration files
- ✅ Public assets

## What Gets Excluded

- ❌ `.git` folder (version control)
- ❌ `node_modules/` (dependencies - can be reinstalled)
- ❌ `.env` files (environment variables - excluded by .gitignore)
- ❌ Uploaded files in `web-app/uploads/` (excluded by .gitignore)

---

**Use Method 1 for the easiest option!**
