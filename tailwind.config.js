module.exports = {
  future: {
    purgeLayersByDefault: true,
  },
  purge: {
    enabled: process.env.NODE_ENV === 'production',
    content: [
      'assets/**/*.{vue,js,ts,jsx,tsx,tpl,yml}',
      'config/**/*.{vue,js,ts,jsx,tsx,tpl,yml}',
      'modules/**/*.{vue,js,ts,jsx,tsx,tpl,yml}',
      'templates/**/*.{vue,js,ts,jsx,tsx,tpl,yml}',
      'nuxt.config.js'
    ],
    options: {
      whitelist: [''],
    }
  },
  darkMode: false,
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
};