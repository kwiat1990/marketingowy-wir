// Server API makes it possible to hook into various parts of Gridsome
// on server-side and add custom data to the GraphQL data layer.
// Learn more: https://gridsome.org/docs/server-api/

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`

const fs = require("fs");
const http = require("http");
const path = require("path");

/**
 * Move all Strapi media files (videos, images etc.) to Gridsome's asset directory and set its URL to local path,
 * so that all features of `g-image` can be used (automatic srcset, blur, lazy-loading)
 * @param {Object} imageObject
 */
function moveImagesAndOverwriteUrl(imageObject) {
  const localFilePath = `./src/assets/img/${imageObject.hash + imageObject.ext}`;
  const hostname = process.env.STRAPI_URL;

  http.get(`${hostname}${imageObject.url}`, (response) => {
    Object.defineProperty(imageObject, "url", {
      value: path.resolve(__dirname, localFilePath),
      writable: true,
    });

    const file = fs.createWriteStream(localFilePath);
    response.pipe(file);
  });
}

module.exports = function (api) {
  api.onCreateNode((options) => {
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
};
