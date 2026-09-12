```bash
#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}GitHub Auto-Push${NC}"
echo

# Fix NVM/npm prefix conflict
if command -v nvm &>/dev/null; then
    nvm use --delete-prefix "$(nvm version)" --silent &>/dev/null || true
fi

# Commit message
if [ -z "$1" ]; then
    echo -e "${RED}ERROR:${NC} Commit message required"
    echo "Usage: ./push_github.sh \"message\""
    exit 1
fi

COMMIT_MESSAGE="$1"

# Git repository
if [ ! -d ".git" ]; then
    echo -e "${RED}ERROR:${NC} Not a Git repository"
    exit 1
fi

# .gitignore
echo -e "${BLUE}CONFIG:${NC} Updating .gitignore"

cat > .gitignore << 'EOF'
.env
.env.*
*.key
*.pem
*.crt

__pycache__/
*.py[cod]
*.so
*.egg-info/
dist/
build/
*.egg
venv/
.venv/
env/
ENV/

.vscode/
.idea/
*.swp
*.swo
.DS_Store
Thumbs.db

node_modules/
package-lock.json
yarn.lock

*.log
*.tmp
*.temp
*.cache
*.pid

*.db
*.sqlite
*.sqlite3

desktop.ini
EOF

echo -e "${GREEN}OK:${NC} .gitignore updated"

# Remote
if ! git remote get-url origin &>/dev/null; then
    echo -e "${RED}ERROR:${NC} Remote 'origin' not found"
    exit 1
fi

# Status
echo -e "${BLUE}STATUS:${NC}"
git status --short

# Stage
echo -e "${BLUE}STAGE:${NC} Adding changes"
git add .

# Commit
echo -e "${BLUE}COMMIT:${NC} $COMMIT_MESSAGE"

if ! git diff --cached --quiet; then
    git commit -m "$COMMIT_MESSAGE" || exit 1
else
    echo -e "${YELLOW}SKIP:${NC} Nothing to commit"
fi

# Pull
echo -e "${BLUE}PULL:${NC} Fetching latest changes"

if ! git pull origin main --allow-unrelated-histories --no-edit; then
    echo -e "${YELLOW}RETRY:${NC} Using master"
    git pull origin master --allow-unrelated-histories --no-edit || exit 1
fi

# Push
echo -e "${BLUE}PUSH:${NC} Sending changes"

if ! git push origin main; then
    echo -e "${YELLOW}RETRY:${NC} Using master"
    git push origin master || exit 1
fi

echo
echo -e "${GREEN}DONE:${NC} Changes pushed successfully"
git log -1 --oneline
```
