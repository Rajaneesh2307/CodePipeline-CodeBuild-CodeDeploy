#!/bin/bash
echo "🚀 Running AfterInstall script for React Vite app..."

# Navigate to the correct directory
cd /var/www/react-app/dist || exit

# Check if package.json exists inside dist
if [ ! -f package.json ]; then
    echo "❌ package.json not found in dist! Deployment failed."
    exit 1
fi

echo "✅ Deployment successful!"
