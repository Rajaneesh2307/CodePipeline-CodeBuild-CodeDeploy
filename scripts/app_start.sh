#!/bin/bash
echo "🚀 Running ApplicationStart script for React Vite app..."

echo "⚡ Installing serve..."
npm install -g serve

echo "⚡ Installing PM2..."
npm install -g pm2

# Find PM2 path dynamically
PM2_PATH=$(command -v pm2)
if [ -z "$PM2_PATH" ]; then
    echo "❌ PM2 not found! Exiting."
    exit 1
fi

echo "🛑 Stopping existing Vite app (if running)..."
$PM2_PATH stop react-vite-app || echo "⚠️ No existing PM2 process found to stop."

echo "🚀 Starting Vite app..."
$PM2_PATH start "serve -s dist -l 3000" --name react-vite-app || {
    echo "❌ Failed to start Vite app with PM2! Exiting."
    exit 1
}
