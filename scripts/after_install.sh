#!/bin/bash
echo "🚀 Running AfterInstall script for React Vite app..."

# Navigate to the app directory
cd /var/www/react-app || {
    echo "❌ Failed to navigate to /var/www/react-app. Exiting."
    exit 1
}

# Check for package.json
if [ ! -f "package.json" ]; then
    echo "❌ package.json not found! Deployment failed."
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install --omit=dev --prefer-offline --no-audit --no-fund --no-progress || {
    echo "❌ npm install failed! Exiting."
    exit 1
}

# Build the app
echo "⚡ Building the application..."
npm run build || {
    echo "❌ Build process failed! Exiting."
    exit 1
}

# Ensure the dist directory exists
if [ ! -d "dist" ]; then
    echo "❌ dist directory not found after build. Exiting."
    exit 1
fi

echo "✅ Deployment successful!"
