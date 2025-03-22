#!/bin/bash

# Stop execution on any error
set -e  

echo "🚀 Running AfterInstall script for React Vite app..."

# Navigate to the application directory
cd /var/www/react-app

# Ensure correct ownership
sudo chown -R ec2-user:ec2-user /var/www/react-app

# Install project dependencies
echo "📦 Installing dependencies..."
npm install --production  

# Ensure correct permissions
echo "🔧 Setting permissions..."
sudo chmod -R 755 /var/www/react-app

echo "✅ AfterInstall script completed."
