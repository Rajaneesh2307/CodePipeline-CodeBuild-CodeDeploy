#!/bin/bash
echo "🚀 Running AfterInstall script for React Vite app..."

# Navigate to the correct directory where your app is deployed
cd /var/www/react-app || exit

# Check if package.json exists
if [ ! -f package.json ]; then
    echo "❌ package.json not found! Deployment failed."
    exit 1
fi

echo "📦 Installing dependencies..."
npm install --omit=dev --prefer-offline --no-audit --no-fund --no-progress

echo "⚡ Building the application..."
npm run build

echo "✅ Deployment successful!"
