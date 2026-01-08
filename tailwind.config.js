/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,ts,jsx,tsx}",
    "./src/app/**/*.{js,ts,jsx,tsx}",
    "./src/components/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        "brand-bg": "#050816",
        "brand-sidebar": "#0a0f1f",
        "brand-accent": "#00eaff",
      },
    },
  },
  plugins: [],
};
