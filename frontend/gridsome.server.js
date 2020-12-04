// Server API makes it possible to hook into various parts of Gridsome
// on server-side and add custom data to the GraphQL data layer.
// Learn more: https://gridsome.org/docs/server-api/

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`

const fs = require("fs");
const http = require("http");
const path = require("path");

module.exports = function (api) {
  api.onCreateNode((options) => {
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

   api.createPages(async ({ graphql, createPage }) => {
    const { data } = await graphql(`
      {
        allStrapiArticle {
          edges {
            node {
              category {
                name
                slug
              }
              id
              slug
            }
          }
        }

        allStrapiCategory(filter: { articles: { title: { exists: true } } }) {
          edges {
            node {
              id
              name
              slug
              articles {
                published_at
                id
                title
                cover {
                  url
                }
                lead
                slug
                category {
                  id
                  name
                  slug
                }
              }
            }
          }
        }

        allStrapiTag {
          edges {
            node {
              id
              name
              slug
              articles {
                published_at
                id
                title
                cover {
                  url
                }
                lead
                slug
                category {
                  id
                  name
                  slug
                }
              }
            }
          }
        }
      }
    `);

    const articles = await data.allStrapiArticle.edges;
    const categories = await data.allStrapiCategory.edges;
    const tags = await data.allStrapiTag.edges;

    await articles.forEach(({ node: article }) => {
      createPage({
        path: `/${article.category.slug}/${article.slug}`,
        component: "./src/templates/Article.vue",
        context: {
          id: article.id,
          dataType: "Article",
          data: article,
        },
      });
    });

    await categories.forEach(({ node: category }) => {
      createPage({
        path: `/${category.slug}`,
        component: "./src/templates/Category.vue",
        context: {
          id: category.id,
          dataType: "Category",
          data: category,
        }
      });
    });

    await tags.forEach(({ node: tag }) => {
      createPage({
        path: `/${tag.slug}`,
        component: "./src/templates/DefaultPage.vue",
        context: {
          id: tag.id,
          dataType: "Tag",
          data: tag,
        },
      });
    });
  });
};
