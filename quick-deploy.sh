#!/bin/bash

echo "🚀 Base Gas Tracker - Quick Deploy"
echo "=================================="
echo ""

# Check which CLI tools are available
check_command() {
    command -v "$1" &> /dev/null
}

echo "Checking available deployment options..."
echo ""

# Priority order: Vercel > Netlify > Surge > Manual
if check_command vercel; then
    echo "✅ Vercel CLI found!"
    echo "🚀 Deploying to Vercel..."
    echo ""
    vercel --prod
    
elif check_command netlify; then
    echo "✅ Netlify CLI found!"
    echo "🚀 Deploying to Netlify..."
    echo ""
    netlify deploy --prod --dir=.
    
elif check_command surge; then
    echo "✅ Surge.sh found!"
    echo "🚀 Deploying to Surge..."
    echo ""
    read -p "Enter domain (default: base-gas-tracker.surge.sh): " domain
    domain=${domain:-base-gas-tracker.surge.sh}
    surge . "$domain"
    
elif check_command wrangler; then
    echo "✅ Wrangler (Cloudflare) found!"
    echo "🚀 Deploying to Cloudflare Pages..."
    echo ""
    wrangler pages deploy . --project-name=base-gas-tracker

else
    echo "❌ No deployment CLI found."
    echo ""
    echo "Choose an option to install:"
    echo ""
    echo "1) Vercel (Recommended - fastest global CDN)"
    echo "2) Netlify (Easiest - drag & drop also available)"
    echo "3) Cloudflare Pages (Best DDoS protection)"
    echo "4) Manual upload (GitHub Pages, etc.)"
    echo ""
    read -p "Enter choice (1-4): " choice
    
    case $choice in
        1)
            echo "Installing Vercel CLI..."
            npm install -g vercel
            echo ""
            echo "🚀 Deploying..."
            vercel --prod
            ;;
        2)
            echo "Installing Netlify CLI..."
            npm install -g netlify-cli
            echo ""
            echo "🚀 Deploying..."
            netlify deploy --prod --dir=.
            ;;
        3)
            echo "Installing Wrangler..."
            npm install -g wrangler
            echo ""
            echo "🚀 Deploying..."
            wrangler pages deploy . --project-name=base-gas-tracker
            ;;
        4)
            echo ""
            echo "📦 Manual Deploy Options:"
            echo ""
            echo "1. GitHub Pages:"
            echo "   - Push to GitHub repo"
            echo "   - Settings → Pages → Deploy from branch"
            echo ""
            echo "2. Netlify Drop (Easiest):"
            echo "   - Go to https://netlify.com/drop"
            echo "   - Drag this folder onto the page"
            echo ""
            echo "3. Cloudflare Pages:"
            echo "   - Go to https://dash.cloudflare.com"
            echo "   - Pages → Create project → Upload"
            ;;
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac
fi

echo ""
echo "✅ Done!"
echo ""
echo "Security tip: Enable HTTPS and consider adding a custom domain for credibility."
