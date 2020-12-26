// This is where project configuration and plugin options are located.
// Learn more: https://gridsome.org/docs/config

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`
const tailwind = require("tailwindcss");

module.exports = {
  templates: {
    StrapiArticle: [
      {
        path: "/:category__name/:title",
        component: "./src/templates/Article.vue",
      },
    ],

    StrapiTag: [
      {
        path: "/tagi/:name",
        component: "./src/templates/Tag.vue",
      },
    ],
  },

  chainWebpack: (config) => {
    const svgRule = config.module.rule("svg");
    svgRule.uses.clear();
    // svgRule
    //   .use("babel-loader")
    //   .loader("babel-loader")
    //   .end()
    //   .use("vue-svg-loader")
    //   .loader("vue-svg-loader")
    //   .options({
    //     svgo: {
    //       plugins: [
    //         { collapseGroups: true },
    //         { convertColors: { currentColor: true } },
    //         { removeNonInheritableGroupAttrs: true },
    //         { removeViewBox: false },
    //       ],
    //     },
    //   });
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

  css: {
    loaderOptions: {
      postcss: {
        plugins: [tailwind],
      },
    },
  },

  plugins: [
    {
      use: "@gridsome/source-strapi",
      options: {
        apiURL: process.env.GRIDSOME_API_URL,
        queryLimit: 1000, // Defaults to 100
        contentTypes: ["Article", "Category", "Tag"],
        singleTypes: ["About", "Footer"],
      },
    },
  ],
};
