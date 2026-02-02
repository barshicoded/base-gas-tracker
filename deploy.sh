#!/bin/bash

echo "🚀 Base Gas Tracker - Quick Deploy"
echo "===================================="
echo ""

# Check for deployment method
if command -v vercel &> /dev/null; then
    echo "✅ Vercel CLI found! Deploying to Vercel..."
    vercel --prod
elif command -v netlify &> /dev/null; then
    echo "✅ Netlify CLI found! Deploying to Netlify..."
    netlify deploy --prod --dir=.
elif command -v surge &> /dev/null; then
    echo "✅ Surge found! Deploying to Surge..."
    surge . base-gas-tracker.surge.sh
else
    echo "⚠️  No deployment CLI found."
    echo ""
    echo "Quick options:"
    echo ""
    echo "1️⃣  Vercel (Recommended):"
    echo "   npm i -g vercel"
    echo "   vercel --prod"
    echo ""
    echo "2️⃣  Netlify:"
    echo "   npm i -g netlify-cli"
    echo "   netlify deploy --prod --dir=."
    echo ""
    echo "3️⃣  Surge (Simplest):"
    echo "   npm i -g surge"
    echo "   surge . base-gas-tracker.surge.sh"
    echo ""
    echo "4️⃣  Manual:"
    echo "   Upload this folder to any static host"
    echo "   (GitHub Pages, Cloudflare Pages, etc.)"
fi
