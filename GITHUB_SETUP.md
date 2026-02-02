# GitHub Setup Guide

## Quick Setup (2 minutes)

### Step 1: Create GitHub Repo
1. Go to https://github.com/new
2. Repository name: `base-gas-tracker`
3. Make it **Public**
4. Click **Create repository**

### Step 2: Push Your Code

Run these commands in your terminal:

```bash
cd projects/base-gas-tracker

# Rename branch to main (optional)
git branch -m main

# Add your GitHub repo
git remote add origin https://github.com/fitiwins/base-gas-tracker.git

# Push to GitHub
git push -u origin main
```

### Step 3: Deploy to Vercel

1. Go to https://vercel.com/new
2. Click **Import Git Repository**
3. Select `fitiwins/base-gas-tracker`
4. Click **Deploy**

**Done! Your site will be live in ~30 seconds.**

---

## Alternative: Manual Upload

If you don't want to use Git:

1. Go to https://vercel.com/new
2. Click **Upload** instead of Import
3. Select the `base-gas-tracker` folder
4. Click **Deploy**

---

## Custom Domain (Optional)

After deploying:
1. Go to your Vercel dashboard
2. Select the project
3. Go to **Settings** → **Domains**
4. Add your domain (e.g., `basegas.fitiwins.com`)
5. Follow DNS instructions

---

## Automatic Deploys

Once connected to GitHub:
- Every push to `main` branch = automatic deploy
- Preview deployments for pull requests
- Rollback to any previous version

Your project is ready to go! 🚀
