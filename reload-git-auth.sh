#!/bin/bash

#eval "$(ssh-agent -s)"
#ssh-add.exe  /c/Users/sysadmin/.ssh/id_rsa_thaicode

#!/bin/bash

set -x  # Enable debugging

git config --global core.autocrlf true

# Set local user config for this repo only
git config user.name "thaicodeorg"
git config user.email "sawangpongm@email.com"

# Use credential helper
git config credential.helper store

LOG_FILE="/tmp/ssh_agent_debug.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "=== SSH Agent Setup Debug Log ==="
echo "Start time: $(date)"
echo "User: $USER"
echo "Working directory: $(pwd)"
echo ""

echo "Step 1: Starting SSH agent..."
eval "$(ssh-agent -s)"
echo "SSH agent PID: $SSH_AGENT_PID"
echo "SSH agent socket: $SSH_AUTH_SOCK"
echo ""

echo "Step 2: Listing current SSH keys (before add)..."
ssh-add.exe -l
echo ""

echo "Step 3: Adding SSH key..."
ssh-add.exe /c/Users/sysadmin/.ssh/id_rsa_thaicode
ADD_RESULT=$?
echo "SSH-add exit code: $ADD_RESULT"
echo ""

echo "Step 4: Listing SSH keys (after add)..."
ssh-add.exe -l
echo ""

echo "Step 5: Testing SSH connection (if applicable)..."
# Uncomment the next line if you want to test connection to a specific host
ssh -T git@github.com 2>&1 | head -5

echo "=== Process completed at $(date) ==="