// Build: npx tailwindcss@3.4.17 -c vendor/tailwind/tailwind.config.js -i vendor/tailwind/input.css -o vendor/tailwind/tailwind.min.css --minify
module.exports = {
  content: ['./index.html', './showcase/**/*.html', './public/**/*.html', './config.example.js'],
  darkMode: 'class',
  theme: { extend: {
    colors: {
      brand: { 50:'#eef2ff',100:'#e0e7ff',400:'#818cf8',500:'#6366f1',600:'#4f46e5',900:'#1e1b4b',accent:'#06b6d4',neon:'#10b981',pink:'#ec4899' },
      dark: { bg:'#090d16', card:'#111827', border:'rgba(255, 255, 255, 0.08)' }
    },
    fontFamily: { sans: ['Inter','sans-serif'], mono: ['Fira Code','monospace'] }
  } }
};
