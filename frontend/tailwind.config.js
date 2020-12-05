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
    extend: {
      backgroundImage: {
        gradient: "var(--section-gradient)",
      },
      rotate: {
        135: "135deg",
        270: "270deg",
      },
    },
  },
  variants: {
    margin: ["responsive", "odd", "even"],
    backgroundImage: ["hover"],
  },
  plugins: [require("@tailwindcss/typography")],
};
