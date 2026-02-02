# ⛽ Base Gas Tracker

A real-time gas price tracker and alert system for the Base L2 blockchain. Save money on every transaction by timing your trades during low gas periods.

![Base Gas Tracker](https://i.imgur.com/placeholder.png)

## 🎯 Features

- **Real-time Gas Monitoring** - Live gas prices updating every 15 seconds
- **Smart Alerts** - Browser notifications & sound alerts when gas drops below your target
- **Visual Charts** - 24-hour gas price history with trend visualization
- **Cost Calculator** - Instant cost estimates for common transactions (swaps, mints, transfers)
- **Savings Tracker** - Compare Base gas costs vs Ethereum L1
- **Quick Links** - Direct access to Base Bridge, Uniswap, BaseScan

## 🚀 Deploy in 30 Seconds

### Option 1: Vercel (Recommended)
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
cd projects/base-gas-tracker
vercel --prod
```

### Option 2: Netlify Drop
1. Go to [netlify.com/drop](https://netlify.com/drop)
2. Drag & drop the `base-gas-tracker` folder
3. Get your live URL instantly

### Option 3: GitHub Pages
1. Push to a GitHub repository
2. Go to Settings → Pages
3. Select "Deploy from Branch" → `main` / `root`
4. Your site is live at `https://yourusername.github.io/base-gas-tracker`

### Option 4: IPFS (Decentralized)
```bash
# Install IPFS CLI
ipfs add -r projects/base-gas-tracker
ipfs pin add <hash>
```

## 💡 Why This Tool?

**Problem:** Base gas prices fluctuate. Users often transact during high congestion, paying more than necessary.

**Solution:** This tool shows real-time gas prices, historical trends, and alerts users when prices drop - saving money on every transaction.

**Universal Use:** Every single Base user pays gas. This tool benefits literally everyone in the ecosystem.

## 🔧 Tech Stack

- **Pure HTML/JS** - No build step, no dependencies to install
- **Ethers.js** - Direct blockchain connection
- **Tailwind CSS** - Beautiful, responsive UI
- **CoinGecko API** - ETH price data

## 📊 How It Works

1. Connects directly to Base RPC (`https://mainnet.base.org`)
2. Fetches current gas price every 15 seconds
3. Calculates transaction costs in USD
4. Compares to Ethereum L1 for savings percentage
5. Alerts users when gas drops below target

## 🎨 Customization

Change the alert threshold:
```javascript
// In browser console or modify index.html
localStorage.setItem('baseGasAlertSettings', JSON.stringify({
    targetGas: 0.2,        // Alert when below 0.2 gwei
    notifications: true,
    sound: true
}));
```

## 🌐 Base Network Info

- **Chain ID:** 8453
- **RPC:** https://mainnet.base.org
- **Currency:** ETH
- **Block Time:** ~2 seconds

## 📱 Mobile App

To convert to a mobile app:
```bash
# Using Capacitor
npm init -y
npm install @capacitor/core @capacitor/cli
npx cap init "Base Gas" com.base.gastracker
npx cap add ios
npx cap add android
# Copy index.html to www/ folder
npx cap sync
```

## 🤝 Contributing

This is an open tool for the Base ecosystem. Feel free to fork and improve!

Ideas for extensions:
- [ ] Wallet integration for 1-click transactions
- [ ] Push notifications via Firebase
- [ ] Historical data export
- [ ] Gas prediction ML model
- [ ] Multi-L2 support (Optimism, Arbitrum)

## 📜 License

MIT - Free for everyone. Built for Base ❤️

---

Built for the Base ecosystem. Not affiliated with Coinbase.
