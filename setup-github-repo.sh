#!/bin/bash

# Claude Skills Repository - GitHub Setup Script
# ===============================================
#
# This script helps set up the Claude Skills Repository on GitHub
#
# Prerequisites:
# - GitHub CLI installed (`brew install gh`)
# - Authenticated with GitHub (`gh auth login`)
#
# Usage:
# ./setup-github-repo.sh "repository-name" ["description"]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if GitHub CLI is installed
if ! command -p gh --version >/dev/null 2>&1; then
    echo -e "${RED}❌ GitHub CLI (gh) is not installed${NC}"
    echo "Install with: brew install gh"
    echo "Then authenticate: gh auth login"
    exit 1
fi

# Check if authenticated
if ! gh auth status >/dev/null 2>&1; then
    echo -e "${RED}❌ Not authenticated with GitHub${NC}"
    echo "Run: gh auth login"
    exit 1
fi

# Get repository name from argument or prompt
REPO_NAME="${1:-claude-skills-organization}"
DESCRIPTION="${2:-Complete Claude.ai skills collection with factory, examples, and cross-platform deployment}"

echo -e "${BLUE}🚀 Setting up Claude Skills Repository${NC}"
echo "Repository: $REPO_NAME"
echo "Description: $DESCRIPTION"
echo

# Get current user
GITHUB_USER=$(gh api user --jq '.login')
if [ -z "$GITHUB_USER" ]; then
    echo -e "${RED}❌ Could not determine GitHub username${NC}"
    exit 1
fi

echo -e "${GREEN}✓ GitHub user: $GITHUB_USER${NC}"

# Check if repository already exists
if gh repo view "$GITHUB_USER/$REPO_NAME" >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  Repository $GITHUB_USER/$REPO_NAME already exists${NC}"

    read -p "Use existing repository? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting..."
        exit 0
    fi
else
    # Create new repository
    echo -e "${BLUE}📝 Creating repository: $REPO_NAME${NC}"

    if gh repo create "$REPO_NAME" \
        --description "$DESCRIPTION" \
        --public \
        --add-readme \
        --disable-wiki \
        --disable-projects; then

        echo -e "${GREEN}✓ Repository created successfully${NC}"
    else
        echo -e "${RED}❌ Failed to create repository${NC}"
        exit 1
    fi
fi

# Set up remote if not already configured
if ! git remote get-url origin >/dev/null 2>&1; then
    echo -e "${BLUE}🔗 Setting up git remote${NC}"
    git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo -e "${GREEN}✓ Remote configured${NC}"
fi

# Add all files to git
echo -e "${BLUE}📦 Adding files to git${NC}"

# First, let git ignore large binary files that shouldn't be in the repo
cat > .gitignore << 'EOF'
# Ignore large font files and binaries
*.ttf
*.woff
*.woff2
*.pdf
*.jpg
*.jpeg
*.png
*.gif
*.mp4
*.mov

# Python
__pycache__/
*.pyc
*.pyo
*.pyd
.Python
*.so
.pytest_cache/
.coverage

# Node.js
node_modules/
npm-debug.log*

# macOS
.DS_Store
.AppleDouble
EOF

git add .
echo -e "${GREEN}✓ Files staged${NC}"

# Commit changes
echo -e "${BLUE}💾 Committing changes${NC}"
git commit -m "Initial commit: Complete Claude Skills Organization

- Claude Skills Factory with generation tools
- Organized examples (6 SKILL.md + 9 Python scripts)
- Complete skills directory (14 technical + 2 factory skills)
- Cross-platform deployment guides
- Notion template processor with email integration

Features:
• Skill creation with /init command
• Git repository import functionality
• ZIP file generation for Claude Desktop
• Comprehensive documentation and examples
• Marketplace indexing with clear labeling"

echo -e "${GREEN}✓ Changes committed${NC}"

# Push to GitHub
echo -e "${BLUE}⬆️  Pushing to GitHub${NC}"
if git push -u origin main 2>/dev/null || git push -u origin master 2>/dev/null; then
    echo -e "${GREEN}✅ Successfully pushed to GitHub!${NC}"
    echo
    echo -e "${BLUE}🌐 Repository URL:${NC}"
    echo "https://github.com/$GITHUB_USER/$REPO_NAME"
    echo
    echo -e "${BLUE}📖 Quick Setup for Users:${NC}"
    echo "git clone https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo "cd $REPO_NAME"
    echo "# Skills in skills/ directory are automatically available in Claude Code"
    echo "# Import ZIP files via Claude Desktop Profile → Skills → Import"

    # Open in browser if possible
    if command -p open >/dev/null 2>&1; then
        open "https://github.com/$GITHUB_USER/$REPO_NAME"
    fi

else
    echo -e "${RED}❌ Push failed - you may need to resolve conflicts or set up the remote manually${NC}"
    echo
    echo "Manual setup commands:"
    echo "git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo "git branch -M main"
    echo "git push -u origin main"
    exit 1
fi

echo
echo -e "${GREEN}🎉 Claude Skills Repository is now live on GitHub!${NC}"
echo "Share the repository with the Claude community! 🚀"
