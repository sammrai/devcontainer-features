#!/bin/bash
set -e

# Configuration
NODE_VERSION=${NODEVERSION:-"22"}
INSTALL_GLOBALLY=${INSTALLGLOBALLY:-"true"}

echo "Installing OpenAI Codex CLI..."

# Speed up installation by skipping unnecessary docs and man pages
export DEBIAN_FRONTEND=noninteractive
mkdir -p /etc/dpkg/dpkg.cfg.d
cat > /etc/dpkg/dpkg.cfg.d/01_nodoc <<EOF
path-exclude /usr/share/doc/*
path-exclude /usr/share/man/*
path-exclude /usr/share/groff/*
path-exclude /usr/share/info/*
path-exclude /usr/share/lintian/*
path-exclude /usr/share/linda/*
EOF

# Update package list and install basic dependencies
apt-get update
apt-get install -y --no-install-recommends curl ca-certificates gnupg

# Detect and load nvm from common locations
if [ -d "/usr/local/share/nvm" ]; then
    export NVM_DIR="/usr/local/share/nvm"
elif [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
fi

# Check if nvm is already installed and loadable
if [ -n "$NVM_DIR" ] && [ -s "$NVM_DIR/nvm.sh" ]; then
    echo "nvm is already installed at $NVM_DIR"
else
    echo "Installing nvm (Node Version Manager)..."
    export NVM_DIR="$HOME/.nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

# Load nvm (must be done after installation/detection)
if [ -s "$NVM_DIR/nvm.sh" ]; then
    \. "$NVM_DIR/nvm.sh"
else
    echo "ERROR: Could not find nvm.sh at $NVM_DIR/nvm.sh"
    exit 1
fi

# Install Node.js LTS version
echo "Installing Node.js $NODE_VERSION LTS..."
nvm install "$NODE_VERSION"
nvm use "$NODE_VERSION"
nvm alias default "$NODE_VERSION"

# Verify Node.js and npm installation
echo "Node.js version: $(node --version)"
echo "npm version: $(npm --version)"

# Install Codex CLI
if [ "$INSTALL_GLOBALLY" = "true" ]; then
    echo "Installing @openai/codex globally..."
    npm install -g @openai/codex
else
    echo "Installing @openai/codex locally..."
    npm install @openai/codex
fi

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "OpenAI Codex CLI installation complete!"
echo ""
echo "To start using Codex CLI, run: codex"
echo "Note: You will need an OpenAI account with a paid plan (Plus/Pro/Team) or an API key."
