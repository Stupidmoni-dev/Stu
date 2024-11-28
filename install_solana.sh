#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install required dependencies for Solana
echo "Installing required dependencies..."
sudo apt install -y curl build-essential libssl-dev

# Install Solana CLI
echo "Installing Solana CLI..."
curl -sSf https://release.solana.com/stable/install/solana-release-x86_64-unknown-linux-gnu.tar.bz2 | sh

# Add Solana CLI to PATH permanently (for bash shell)
echo "Adding Solana CLI to PATH..."
echo 'export PATH="/home/$(whoami)/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc

# Apply the changes to the current shell session
source ~/.bashrc

# Verify Solana installation
echo "Verifying Solana CLI installation..."
solana --version

# Print final message
echo "Solana CLI installed successfully and added to PATH."
echo "You can now use Solana commands such as 'solana --version', 'solana balance', etc."
