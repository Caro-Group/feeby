
const { fontFamily } = require('tailwindcss/defaultTheme');

module.exports = {
  future: {
    purgeLayersByDefault: true,
  },
  content: [
    './assets/**/*.{vue,js,ts,jsx,tsx,tpl,yml}',
    './config/**/*.{vue,js,ts,jsx,tsx,tpl,yml}',
    './modules/**/*.{vue,js,ts,jsx,tsx,tpl,yml}',
    './templates/**/*.{vue,js,ts,jsx,tsx,tpl,yml}',
    './nuxt.config.js'
  ],
  theme: {
    screens: {
      'phone': '320px',
      'phone-wide': '480px',
      'phablet': '560px',
      'tablet-small': '640px',
      'tablet': '768px',
      'tablet-wide': '1024px',
      'desktop': '1248px',
      'desktop-wide': '1440px',
      'full-hd': '1680px',
    },
    extend: {
      colors: {
        "main" : "#DF1A5B",
        "require": "#f00",
        gray: {
          default: '#F8F8F8',
        },
        pink: {
          650: '#DF1A5B',
        },
      },
      width: {
        "side": "467px",
        "miniature": "102px"
      },
      margin: {
        'miniature': '102px',
        'form': '20px',
      },
      backgroundImage: {
        'newsletter-plane': "url('../img/newsletter1.svg')",
        'newsletter-dashed': "url('../img/newsletter2.svg')",
        'header-brush': "url('../img/headers_under.svg')",
       },
      backgroundSize: {
       'smaller': '70px',
       'small': '100px',
      },
      minWidth: {
        'label': '173px'
      },
      height: {
        '100':'28rem', 
      },
      transitionDuration: {
        '2000': '2000ms',
      },
      fontFamily: {
        'header': [
          '"Nomada Didone"',
          'Roboto', 
          ...fontFamily.sans
        ],
        'body': [
          'Roboto', 
          ...fontFamily.sans
        ],
      },
    },
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/forms")({
      strategy: 'class',
    }),
    require("@tailwindcss/line-clamp"),
  ],
  corePlugins: {
   container: false,
   preflight: false,
  }
};
