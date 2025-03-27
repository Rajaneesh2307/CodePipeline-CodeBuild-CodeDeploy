#!/bin/bash

# Stop execution on any error
set -e  

echo "🚀 Running BeforeInstall script for React Vite app..."

# Update system packages
sudo yum update -y

# Install Node.js & npm (if not installed)
if ! command -v node &> /dev/null
then
    echo "⚡ Installing Node.js..."
    curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
    sudo yum install -y nodejs
fi

# Install PM2 globally using sudo to avoid permission issues
if ! command -v pm2 &> /dev/null
then
    echo "⚡ Installing PM2..."
    sudo npm install -g pm2
fi

# Remove old application files
if [ -d "/var/www/react-app" ]; then
    echo "🗑️ Removing old application files..."
    sudo rm -rf /var/www/react-app
fi

# Create the application directory
echo "📁 Creating application directory..."
sudo mkdir -p /var/www/react-app
sudo chown ec2-user:ec2-user /var/www/react-app

echo "✅ BeforeInstall script completed."
