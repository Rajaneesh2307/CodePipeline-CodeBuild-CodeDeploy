#!/bin/bash

# Stop execution on any error
set -e  

echo "🚀 Running ApplicationStart script for React Vite app..."

# Navigate to the application directory
cd /var/www/react-app

# Ensure correct ownership
sudo chown -R ec2-user:ec2-user /var/www/react-app

# Install serve if not installed
if ! command -v serve &> /dev/null
then
    echo "⚡ Installing serve..."
    npm install -g serve
fi

# Stop any existing instance of the app
echo "🛑 Stopping existing Vite app (if running)..."
pm2 stop vite-app || true
pm2 delete vite-app || true

# Start the app with serve
echo "🚀 Starting Vite app..."
pm2 start serve --name "vite-app" -- -s -l 3000

# Save the PM2 process list
pm2 save

# Ensure PM2 starts on system reboot
pm2 startup

echo "✅ ApplicationStart script completed."
