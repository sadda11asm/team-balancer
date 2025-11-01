#!/bin/bash

echo "🚀 GitHub Repository Setup for Team Balancer"
echo "=============================================="
echo ""
echo "Step 1: Create a new repository on GitHub"
echo "------------------------------------------"
echo "1. Go to: https://github.com/new"
echo "2. Repository name: team-balancer"
echo "3. Description: Team Balancer web app - balances players into 3 teams"
echo "4. Make it PUBLIC (so Netlify can access it)"
echo "5. DO NOT initialize with README, .gitignore, or license"
echo "6. Click 'Create repository'"
echo ""
echo "Step 2: Once created, copy the repository URL"
echo "----------------------------------------------"
echo "It will look like: https://github.com/YOUR_USERNAME/team-balancer.git"
echo ""
read -p "Paste your GitHub repository URL here: " repo_url

if [ -z "$repo_url" ]; then
    echo "❌ No URL provided. Exiting."
    exit 1
fi

echo ""
echo "Step 3: Adding remote and pushing code..."
echo "------------------------------------------"

git remote add origin "$repo_url" 2>/dev/null || git remote set-url origin "$repo_url"
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Your code is now on GitHub!"
    echo ""
    echo "📋 Next Steps for Netlify Continuous Deployment:"
    echo "1. Go to: https://app.netlify.com"
    echo "2. Click 'Add new site' → 'Import an existing project'"
    echo "3. Choose 'GitHub' and authorize Netlify"
    echo "4. Select your 'team-balancer' repository"
    echo "5. Build settings:"
    echo "   - Build command: (leave empty)"
    echo "   - Publish directory: / (or leave empty)"
    echo "6. Click 'Deploy site'"
    echo ""
    echo "Your site will automatically redeploy whenever you push to GitHub! 🎉"
else
    echo ""
    echo "❌ Push failed. Please check:"
    echo "1. Your GitHub repository URL is correct"
    echo "2. You have push access to the repository"
    echo "3. Your Git credentials are configured"
fi

