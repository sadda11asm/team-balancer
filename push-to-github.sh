#!/bin/bash

# Replace YOUR_USERNAME with your actual GitHub username
GITHUB_USERNAME="sadda11asm"

echo "🚀 Pushing to GitHub..."
echo "Make sure you've created the repository at: https://github.com/$GITHUB_USERNAME/team-balancer"
echo ""

# Remove existing remote if any
git remote remove origin 2>/dev/null

# Add your GitHub repository as remote
git remote add origin "https://github.com/$GITHUB_USERNAME/team-balancer.git"

# Push to GitHub
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Code pushed to GitHub!"
    echo "Repository URL: https://github.com/$GITHUB_USERNAME/team-balancer"
    echo ""
    echo "📋 Next: Set up Netlify Continuous Deployment:"
    echo "1. Go to: https://app.netlify.com"
    echo "2. Click 'Add new site' → 'Import an existing project'"
    echo "3. Choose 'GitHub' and authorize Netlify"
    echo "4. Select 'team-balancer' repository"
    echo "5. Build settings:"
    echo "   - Build command: (leave empty)"
    echo "   - Publish directory: /"
    echo "6. Click 'Deploy site'"
else
    echo ""
    echo "❌ Failed to push. Please:"
    echo "1. Edit this script and replace YOUR_USERNAME with your GitHub username"
    echo "2. Make sure the repository exists on GitHub"
    echo "3. Check your Git credentials"
fi

