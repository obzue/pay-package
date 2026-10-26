// Copy to config.js (gitignored) and fill in real values. NEVER put secret keys (sk_live_/sk_test_) here:
// this file is served to browsers. Only publishable keys (pk_...) and public Checkout/Payment Link URLs belong client-side.
window.PAY_CONFIG = {
  stripePublishableKey: 'pk_test_REPLACE_ME',
  checkoutUrls: {
    growthSaaS: 'https://buy.stripe.com/REPLACE_ME',
    enterpriseAIOS: 'https://buy.stripe.com/REPLACE_ME',
    perSeat: 'https://buy.stripe.com/REPLACE_ME'
  }
};
