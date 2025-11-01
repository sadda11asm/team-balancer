#!/bin/bash

GITHUB_USERNAME="sadda11asm"

# Get token from environment variable or first argument
GITHUB_TOKEN="${GITHUB_TOKEN:-$1}"

if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ Error: GitHub Personal Access Token required!"
    echo ""
    echo "Usage:"
    echo "  GITHUB_TOKEN=your_token bash push-to-github-with-token.sh"
    echo "  OR"
    echo "  bash push-to-github-with-token.sh your_token"
    echo ""
    echo "To create a token: https://github.com/settings/tokens/new"
    echo "Select 'repo' scope"
    exit 1
fi

echo "🚀 Pushing to GitHub..."

# Remove existing remote if any
git remote remove origin 2>/dev/null

# Use HTTPS URL with token embedded
git remote add origin "https://${GITHUB_TOKEN}@github.com/$GITHUB_USERNAME/team-balancer.git"

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
    echo "❌ Failed to push. Options:"
    echo ""
    echo "Option A: Use Personal Access Token (Recommended):"
    echo "1. Create token: https://github.com/settings/tokens/new"
    echo "2. Select 'repo' scope"
    echo "3. Copy the token"
    echo "4. When prompted for password, paste the token"
    echo ""
    echo "Option B: Set up SSH:"
    echo "Run: ssh-keygen -t ed25519 -C 'your_email@example.com'"
    echo "Then add key to: https://github.com/settings/keys"
fi

