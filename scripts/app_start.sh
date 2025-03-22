#!/bin/bash
echo "🚀 Running ApplicationStart script for React Vite app..."

echo "⚡ Installing serve..."
npm install -g serve || {
    echo "❌ Failed to install serve! Exiting."
    exit 1
}

echo "⚡ Installing PM2..."
npm install -g pm2 || {
    echo "❌ Failed to install PM2! Exiting."
    exit 1
}

echo "🛑 Stopping existing Vite app (if running)..."
pm2 stop all || echo "⚠️ No existing PM2 process found to stop."

echo "🚀 Starting Vite app..."
pm2 start "serve -s dist" --name "vite-app" || {
    echo "❌ Failed to start Vite app with PM2! Exiting."
    exit 1
}

echo "✅ Application started successfully!"
