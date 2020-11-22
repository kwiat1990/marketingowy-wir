const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  future: {
    // removeDeprecatedGapUtilities: true,
    // purgeLayersByDefault: true,
  },
  purge: [],
  theme: {
    colors: {
      primary: "var(--color-primary)",
      secondary: "var(--color-secondary)",
      "surface-primary": "var(--bg-primary)",
      "surface-secondary": "var(--bg-secondary)",
      "accent-primary": "var(--accent-primary)",
      "accent-secondary": "var(--accent-secondary)",

      sand: "var(--color-sand)",
      dark: "var(--color-dark)",
      black: "var(--color-black)",
      white: "var(--color-white)",
    },
    container: {
      center: true,
      padding: defaultTheme.spacing["4"],
    },
    extend: {
      rotate: {
        135: "135deg",
        270: "270deg",
      },
      typography: {
        DEFAULT: {
          css: {
            color: "inherit",
            maxWidth: "none",
          },
        },
      },
    },
  },
  variants: {
    margin: ["odd", "even"],
  },
  plugins: [require("@tailwindcss/typography")],
};
