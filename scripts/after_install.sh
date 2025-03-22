#!/bin/bash
echo "🚀 Running AfterInstall script for React Vite app..."

# Navigate to the app directory
cd /var/www/react-app || exit

echo "📦 Installing dependencies..."
npm install --omit=dev --prefer-offline --no-audit --no-fund --no-progress

echo "✅ Dependencies installed. Ready to serve the app!"
