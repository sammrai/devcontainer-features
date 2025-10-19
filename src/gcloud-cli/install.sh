#!/bin/bash
set -e

# Import the specified key
VERSION=${VERSION:-"latest"}
INSTALL_COMPONENTS=${INSTALLCOMPONENTS:-""}

echo "Installing Google Cloud CLI..."

# Install required dependencies
apt-get update
apt-get install -y apt-transport-https ca-certificates gnupg curl

# Add Google Cloud SDK GPG key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add Google Cloud SDK repository
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Update package list
apt-get update

# Install Google Cloud CLI
if [ "$VERSION" = "latest" ]; then
    apt-get install -y google-cloud-cli
else
    apt-get install -y google-cloud-cli=$VERSION
fi

# Install additional components if specified
if [ -n "$INSTALL_COMPONENTS" ]; then
    echo "Installing additional components: $INSTALL_COMPONENTS"
    IFS=',' read -ra COMPONENTS <<< "$INSTALL_COMPONENTS"
    for component in "${COMPONENTS[@]}"; do
        component=$(echo "$component" | xargs)  # trim whitespace
        if [ -n "$component" ]; then
            echo "Installing component: $component"
            apt-get install -y "google-cloud-cli-$component" || echo "Warning: Could not install $component"
        fi
    done
fi

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "Google Cloud CLI installation complete!"
gcloud version
