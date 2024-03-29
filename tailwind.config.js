const { fontFamily } = require("tailwindcss/defaultTheme");

module.exports = {
  future: {
    purgeLayersByDefault: true,
  },
  content: [
    "./assets/**/*.{vue,js,ts,jsx,tsx,tpl,yml,svg,scss}",
    "./config/**/*.{vue,js,ts,jsx,tsx,tpl,yml}",
    "./modules/**/*.{vue,js,ts,jsx,tsx,tpl,yml}",
    "./templates/**/*.{vue,js,ts,jsx,tsx,tpl,yml}",
    "./nuxt.config.js",
  ],
  theme: {
    screens: {
      phone: "320px",
      "phone-wide": "480px",
      phablet: "560px",
      "tablet-small": "640px",
      "trusted-breakpoint": "649px",
      tablet: "768px",
      "tablet-medium": "992px",
      "tablet-wide": "1024px",
      "desktop-presta": "1200px",
      desktop: "1248px",
      "desktop-wide": "1440px",
      "full-hd": "1680px",
      "1920": "1920px",
      "content-max": "1760px",
    },
    extend: {
      colors: {
        main: "#DF1A5B",
        "main-hover": "#B7164B",
        "main-dark": "#232322",
        require: "#f00",
        gray: {
          default: "#F8F8F8",
          main: "#232322",
          1000: "#F8F8F8",
          2000: "#ECECEC",
          3000: "#ADAFBA",
        },
        pink: {
          650: "#DF1A5B",
        },
      },
      margin: {
        miniature: "102px",
        form: "20px",
        row: "30px",
      },
      backgroundImage: {
        "newsletter-plane": "url('../img/newsletter1.svg')",
        "newsletter-dashed": "url('../img/newsletter2.svg')",
        "header-brush": "url('../img/headers_under.svg')",
      },
      backgroundSize: {
        smaller: "70px",
        small: "100px",
      },
      width: {
        side: "467px",
        miniature: "102px",
        filter: "calc(100% - 12rem)",
      },
      minWidth: {
        label: "173px",
        "swiper-mobile": "500px",
      },
      height: {
        "banner-final": "750px",
        label: "173px",
        100: "28rem",
        screen: ["100vh /* fallback for Opera, IE and etc. */", "100dvh"],
      },
      minHeight: {
        8: "2rem",
        banner: "450px",
      },
      maxHeight: {
        tablet: "768px",
      },
      transitionDuration: {
        2000: "2000ms",
      },
      padding: {
        "10px": "10px;",
        "60px": "60px",
        "80px": "80px",
      },
      fontFamily: {
        body: ["Roboto", ...fontFamily.sans],
      },
      translate: {
        "1/5": "20%",
        "2/5": "40%",
        "3/5": "60%",
        "4/5": "80%",
      },
    },
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/forms")({
      strategy: "class",
    }),
    require("@tailwindcss/line-clamp"),
  ],
  corePlugins: {
    container: false,
    preflight: false,
  },
};
