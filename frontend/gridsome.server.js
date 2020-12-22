// Server API makes it possible to hook into various parts of Gridsome
// on server-side and add custom data to the GraphQL data layer.
// Learn more: https://gridsome.org/docs/server-api/

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`

const fs = require("fs");
const http = require("http");
const https = require("https");
const path = require("path");

/**
 * Move all Strapi media files (videos, images etc.) to Gridsome's asset directory and set its URL to local path,
 * so that all features of `g-image` can be used (automatic srcset, blur, lazy-loading)
 * @param {Object} imageObject
 */
function moveImagesAndOverwriteUrl(imageObject) {
  const localFilePath = `./src/assets/img/${imageObject.hash + imageObject.ext}`;
  const reqMode = process.env.NODE_ENV === "development" ? http : https;
  const req = reqMode.get(`${process.env.GRIDSOME_API_URL}${imageObject.url}`, (response) => {
    Object.defineProperty(imageObject, "url", {
      value: path.resolve(__dirname, localFilePath),
      writable: true,
    });
    const file = fs.createWriteStream(localFilePath);
    response.pipe(file);
  });
  req.end();
  req.on("error", (error) => {
    console.error(error);
  });
}

module.exports = function (api) {
  api.onCreateNode((options) => {
    // add custom-made "path" to the collections
    // this happens automatically for collections created with template option in gridsome config
    // but unfortunately only on 1st level
    if (options.internal.typeName === "StrapiArticle") {
      options.category.path = `/${options.category.slug}/`;
      options.tags.forEach((tag) => {
        tag.path = `/tagi/${tag.slug}/`;
      });
    }

    if (options.internal.typeName === "StrapiCategory") {
      options.path = `/${options.slug}/`;
    }

    if (
      options.internal.typeName === "StrapiTag" ||
      options.internal.typeName === "StrapiCategory"
    ) {
      options.articles.forEach((article) => {
        article.path = `/${article.category.slug}/${article.slug}/`;
        article.category.path = `/${article.category.slug}/`;
      });
    }

    // replace image's url with g-image data object
    if (options.cover && options.cover.url) {
      moveImagesAndOverwriteUrl(options.cover);
    }

    if (options.content) {
      options.content.forEach((item, index) => {
        if (item.image && item.image.url) {
          moveImagesAndOverwriteUrl(options.content[index].image);
        }
      });
    }

    if (options.articles) {
      options.articles.forEach((item, index) => {
        if (item.cover) {
          moveImagesAndOverwriteUrl(options.articles[index].cover);
        }
      });
    }
  });

  // because route matching pattern for category and home is the same,
  // category pages have to to be created in advance, so that their routes are hardcoded
  api.createPages(({ getCollection, createPage }) => {
    getCollection("StrapiCategory")
      .data()
      .forEach((category) => {
        createPage({
          path: `/${category.path}`,
          component: "./src/templates/Category.vue",
          context: {
            id: category.id,
            name: category.name,
          },
        });
      });
  });
};
