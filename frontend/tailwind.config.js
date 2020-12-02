const { screens } = require("tailwindcss/defaultTheme");
const defaultTheme = require("tailwindcss/defaultTheme");
const plugin = require("tailwindcss/plugin");

module.exports = {
  future: {
    // removeDeprecatedGapUtilities: true,
    // purgeLayersByDefault: true,
  },
  purge: [],
  theme: {
    colors: {
      current: "currentColor",
      transparent: "transparent",

      primary: "var(--color-primary)",
      secondary: "var(--color-secondary)",
      "surface-primary": "var(--bg-primary)",
      "surface-secondary": "var(--bg-secondary)",
      "accent-primary": "var(--accent-primary)",
      "accent-secondary": "var(--accent-secondary)",
      "accent-tertiary": "var(--accent-tertiary)",

      sand: "var(--color-sand)",
      dark: "var(--color-dark)",
      black: "var(--color-black)",
      white: "var(--color-white)",
    },
    container: {
      center: true,
      padding: {
        DEFAULT: defaultTheme.spacing["6"],
        lg: defaultTheme.spacing["20"],
      },
    },
    extend: {
      rotate: {
        135: "135deg",
        270: "270deg",
      },
      typography: {
        DEFAULT: {
          css: {
            blockquote: {
              borderLeftColor: "var(--bg-secondary)",
            },
            color: "inherit",
            maxWidth: "none",
            "ol > li::before": {
              color: "inherit",
            },
            "ul > li::before": {
              backgroundColor: "currentColor",
            },
          },
        },
        lg: {
          css: {
            img: {
              marginTop: 0,
              marginBottom: 0,
            },
          },
        },
      },
    },
  },
  variants: {
    margin: ["odd", "even"],
  },
  plugins: [
    require("@tailwindcss/typography"),
    plugin(function ({ addBase, theme }) {
      addBase({
        body: { fontSize: theme("fontSize.lg"), lineHeight: theme("lineHeight.relaxed") },
      });
    }),
  ],
};
