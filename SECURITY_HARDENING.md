# Security Hardening Guide

## Current Security Status: ✅ GOOD

Your app is already quite secure because it's:
- Pure static files (no server to hack)
- No user input or authentication
- No wallet connections
- No data collection

## Recommended Hardening Steps

### 1. Add Content Security Policy (CSP)

Add this to your hosting platform's headers:

```http
Content-Security-Policy: 
  default-src 'self';
  script-src 'self' https://cdn.tailwindcss.com https://cdnjs.cloudflare.com;
  style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;
  font-src https://fonts.gstatic.com;
  connect-src https://mainnet.base.org https://api.coingecko.com;
  img-src 'self' data: https:;
```

### 2. Subresource Integrity (SRI)

Add integrity hashes to external scripts:

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/ethers/6.9.0/ethers.umd.min.js" 
        integrity="sha384-PLACEHOLDER_HASH"
        crossorigin="anonymous"></script>
```

Generate hashes:
```bash
curl -s https://cdnjs.cloudflare.com/ajax/libs/ethers/6.9.0/ethers.umd.min.js | \
  openssl dgst -sha384 -binary | \
  openssl base64
```

### 3. Fallback RPCs (Resilience)

Add backup RPC endpoints:
- `https://mainnet.base.org` (primary)
- `https://base.llamarpc.com` (fallback)
- `https://base.drpc.org` (fallback)

### 4. Rate Limiting Protection

Cache ETH price to avoid hitting CoinGecko limits:

```javascript
// Store last fetch time
const CACHE_DURATION = 5 * 60 * 1000; // 5 minutes

function shouldFetchPrice() {
  const lastFetch = localStorage.getItem('lastPriceFetch');
  return !lastFetch || (Date.now() - parseInt(lastFetch)) > CACHE_DURATION;
}
```

### 5. DDoS Protection

If using custom domain, enable:
- Cloudflare (free tier)
- Vercel Edge Network
- Netlify Edge

## Hosting Platform Security Comparison

| Platform | SSL | DDoS Protection | Edge Network | Custom Domain |
|----------|-----|-----------------|--------------|---------------|
| Vercel | ✅ Free | ✅ Built-in | ✅ Global | ✅ Free |
| Netlify | ✅ Free | ✅ Built-in | ✅ Global | ✅ Free |
| Cloudflare Pages | ✅ Free | ✅ Enterprise-grade | ✅ Fastest | ✅ Free |
| GitHub Pages | ✅ Free | ⚠️ Basic | ⚠️ Limited | ✅ Free |
| IPFS | ⚠️ Manual | ❌ None | ✅ Decentralized | ⚠️ Manual |

## Recommended: Cloudflare Pages

Best balance of speed, security, and free features.

```bash
# Deploy with Wrangler
npm i -g wrangler
wrangler pages deploy . --project-name=base-gas-tracker

# Add custom domain in dashboard
# Automatic SSL, DDoS protection, global CDN
```

## Monitoring

Add simple analytics (privacy-friendly):

```html
<!-- Optional: privacy-focused analytics -->
<script defer src="https://umami.is/script.js" data-website-id="YOUR_ID"></script>
```

Or use Cloudflare Web Analytics (no JS needed).

## Incident Response

If something goes wrong:

1. **CDN compromised:** Deploy new version with local assets
2. **RPC down:** Switch to fallback RPC
3. **CoinGecko down:** Show cached price with "stale" warning

All can be handled client-side with proper error handling.

## Summary

Your current app is **secure by design** due to its simplicity. For production:

1. ✅ Deploy to Vercel/Cloudflare (free SSL + DDoS)
2. ⚠️ Add CSP headers (optional but good)
3. ⚠️ Consider fallback RPCs (for reliability)
4. ⚠️ Cache ETH price (for rate limits)

The biggest "risk" is the site going down due to external API issues - not a security risk, just reliability.
