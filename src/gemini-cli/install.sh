#!/bin/bash
set -e

# Configuration
NODE_VERSION=${NODEVERSION:-"22"}
INSTALL_GLOBALLY=${INSTALLGLOBALLY:-"true"}

echo "Installing Google Gemini CLI..."

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

# Detect nvm from common locations
if [ -d "/usr/local/share/nvm" ]; then
    export NVM_DIR="/usr/local/share/nvm"
elif [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
else
    export NVM_DIR="$HOME/.nvm"
fi

# Check if nvm is already installed
if [ -s "$NVM_DIR/nvm.sh" ]; then
    echo "nvm is already installed at $NVM_DIR"
    \. "$NVM_DIR/nvm.sh"
else
    echo "Installing nvm (Node Version Manager)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    \. "$NVM_DIR/nvm.sh"
fi

# Verify nvm is loaded
if ! command -v nvm &> /dev/null; then
    echo "ERROR: nvm command not found after installation"
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

# Install Gemini CLI
if [ "$INSTALL_GLOBALLY" = "true" ]; then
    echo "Installing @google/gemini-cli globally..."
    npm install -g @google/gemini-cli
else
    echo "Installing @google/gemini-cli locally..."
    npm install @google/gemini-cli
fi

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "Google Gemini CLI installation complete!"
echo ""
echo "To start using Gemini CLI, run: gemini"
echo "Note: You will need to authenticate with your Google account on first use."
echo "To exit Gemini CLI, press Ctrl+C twice."
