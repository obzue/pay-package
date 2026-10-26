# Security Policy — pay-package

## Reporting a vulnerability
Report privately via https://obzueai.com/security or security@obzueai.com (see `/.well-known/security.txt`). Please do not open public issues for vulnerabilities.

## Threat model
- **Client-side only.** This repo is static HTML/CSS/JS (MEA pricing tiers, Stripe checkout links). There is no server, database, or API in this repo.
- **No secrets in the repo.** Only Stripe *publishable* keys (`pk_...`) and public Checkout/Payment Link URLs may be used client-side, and they are loaded from a gitignored `config.js` (template: `config.example.js`). Stripe secret keys (`sk_live_*`, `sk_test_*`), restricted keys and webhook secrets (`whsec_*`) must never be committed or shipped to the browser.
- **CSP is the primary defense.** `_headers` / `netlify.toml` set a strict Content-Security-Policy plus HSTS, `X-Content-Type-Options: nosniff`, `X-Frame-Options: DENY`, `Referrer-Policy` and `Permissions-Policy`. Inline `onclick` handlers have been replaced with `addEventListener` delegation.
- **Subresource Integrity / self-hosted assets.** Tailwind CSS (v3.4.17, prebuilt + minified from `vendor/tailwind/tailwind.config.js`), Font Awesome 6.4.0, Alpine.js 3.14.9 and the Google Fonts (Plus Jakarta Sans, Inter, Fira Code) are self-hosted under `vendor/`. All local `<script>`/`<link>` tags carry `integrity` + `crossorigin`. No third-party CDN is loaded.

## Known gap / out of scope (today)
- **No server-side validation.** Prices, plan names and "trial activation" are enforced only in the browser and can be tampered with by any user. Stripe Checkout/Price IDs on Stripe's side are the only real source of truth for amounts.
- No rate limiting, no authentication. The "Account & Bank Payouts" and "Tier-3 Admin Console" tabs are UI mockups with no access control and must not be wired to real data without a backend.
- Closed: CDN/CSP gap for styling. All styling, icon, font and Alpine assets are self-hosted, so the strict CSP (own origin + Stripe only) applies unchanged. If you add new Tailwind classes, rebuild `vendor/tailwind/tailwind.min.css` (command in the config file) and update its SRI hash in the HTML.

## Checklist when a backend is added
- [ ] Server-side input validation (allowlists for plan/price IDs; never trust client-sent amounts)
- [ ] Parameterized queries / ORM only — no string-built SQL
- [ ] Rate limiting on checkout, login and admin endpoints
- [ ] Authentication + authorization (MFA, role checks) on all admin and payout routes
- [ ] Stripe webhook signature verification (`Stripe-Signature` with `whsec_` secret) and idempotent event handling
- [ ] Secrets in environment/secret manager only; rotate on exposure
- [ ] CSRF protection, secure/HttpOnly/SameSite cookies
- [ ] Logging and alerting for payment anomalies
