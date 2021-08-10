const colors = require('tailwindcss/colors')
module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        teal: colors.teal,
        emerald: colors.emerald,
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
