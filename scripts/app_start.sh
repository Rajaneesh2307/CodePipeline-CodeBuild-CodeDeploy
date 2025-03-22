#!/bin/bash
echo "🚀 Running ApplicationStart script for React Vite app..."

echo "⚡ Installing serve..."
npm install -g serve

echo "⚡ Installing PM2..."
sudo npm install -g pm2

echo "🛑 Stopping existing Vite app (if running)..."
/usr/local/bin/pm2 stop all || echo "⚠️ No existing PM2 process found to stop."

echo "🚀 Starting Vite app..."
/usr/local/bin/pm2 start "serve -s dist -l 3000" --name react-vite-app || {
    echo "❌ Failed to start Vite app with PM2! Exiting."
    exit 1
}
