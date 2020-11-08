// This is where project configuration and plugin options are located.
// Learn more: https://gridsome.org/docs/config

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`

// const SvgSprite = require("vue-svg-sprite");

module.exports = {
  siteName: "Marketingowy wir",
  // assetsDir: "./src/assets",

  chainWebpack: (config) => {
    const svgRule = config.module.rule("svg");
    svgRule.uses.clear();
    svgRule
      .use("svg-sprite-loader")
      .loader("svg-sprite-loader")
      .end()
      .use("svgo-loader")
      .loader("svgo-loader")
      .options({
        plugins: [
          { removeNonInheritableGroupAttrs: true },
          { collapseGroups: true },
          { convertColors: { currentColor: true } },
        ],
      });
  },

  plugins: [
    {
      use: "@gridsome/source-strapi",
      options: {
        apiURL: `http://localhost:1337`,
        queryLimit: 1000, // Defaults to 100
        contentTypes: [`restaurant`, `category`],
      },
    },
    {
      use: "gridsome-plugin-typescript",
    },
    {
      use: "gridsome-plugin-tailwindcss",
    },
  ],
};
