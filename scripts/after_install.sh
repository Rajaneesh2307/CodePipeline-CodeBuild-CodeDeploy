#!/bin/bash
echo "🚀 Running AfterInstall script for React Vite app..."

# Navigate to the app directory
cd /var/www/react-app || {
    echo "❌ Failed to navigate to /var/www/react-app. Exiting."
    exit 1
}

# Ensure the dist directory exists
if [ ! -d "dist" ]; then
    echo "❌ dist directory not found. Deployment failed."
    exit 1
fi

echo "🔄 Restarting the server..."
pm2 restart all || pm2 start npm --name "react-app" -- start

echo "✅ Deployment successful!"
