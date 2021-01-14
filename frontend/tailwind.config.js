module.exports = {
  purge: {
    content: ["./src/**/*.vue", "./src/**/*.js"],
    options: {
      safelist: ["g-image", "g-image--lazy", "g-image--loaded", "rotate-270"],
    },
  },
  theme: {
    colors: {
      current: "currentColor",
      inherit: "inherit",
      transparent: "transparent",

      "color-content-1": "var(--content-1)",
      "color-content-2": "var(--content-2)",
      "color-surface-1": "var(--surface-1)",
      "color-surface-2": "var(--surface-2)",
      "color-surface-3": "var(--surface-3)",
      "color-accent-1": "var(--accent-1)",
      "color-accent-2": "var(--accent-2)",
      "color-accent-3": "var(--accent-3)",

      "color-isabelline": "var(--color-isabelline)",
      "color-eerie-black": "var(--color-eerie-black)",
      "color-black": "var(--color-black)",
      "color-white": "var(--color-white)",
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
    borderStyle: ["hover"],
  },
  plugins: [require("@tailwindcss/forms"), require("@tailwindcss/typography")],
};
