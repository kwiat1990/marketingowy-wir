// Server API makes it possible to hook into various parts of Gridsome
// on server-side and add custom data to the GraphQL data layer.
// Learn more: https://gridsome.org/docs/server-api/

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`
const slugify = require("slugify");

module.exports = function (api) {
  // Helper
  async function pageBuilder(collectionName, graphqlQuery, page) {
    const { data } = await graphqlQuery;
    await data[collectionName].edges.forEach((edge) => page(edge.node));
  }

  // Pages
  api.createPages(async ({ graphql, createPage }) => {
    // pageBuilder(
    //   "allStrapiArticle",
    //   graphql(`
    //     {
    //       allStrapiArticle {
    //         edges {
    //           node {
    //             id
    //             title
    //             slug
    //             content
    //           }
    //         }
    //       }
    //     }
    //   `),
    //   (node) => {
    //     createPage({
    //       path: `/articles/${node.slug}`,
    //       component: './src/templates/Article.vue',
    //       context: {
    //         id: node.id,
    //       },
    //     })
    //   }
    // );

    // pageBuilder(
    //   "allStrapiCategory",
    //   graphql(`
    //     {
    //       allStrapiCategory {
    //         edges {
    //           node {
    //             id
    //             name
    //           }
    //         }
    //       }
    //     }
    //   `),
    //   (node) => {
    //     createPage({
    //       path: `/category/${category.node.id}`,
    //       component: './src/templates/Category.vue',
    //       context: {
    //         id: category.node.id,
    //       },
    //     })
    //   }
    // );

    const { data } = await graphql(`
      {
        allStrapiArticle {
          edges {
            node {
              id
              slug
            }
          }
        }
        allStrapiCategory {
          edges {
            node {
              id
              name
            }
          }
        }
      }
    `);

    const articles = await data.allStrapiArticle.edges;
    const categories = await data.allStrapiCategory.edges;

    await articles.forEach((article) => {
      createPage({
        path: `/articles/${article.node.slug}`,
        component: "./src/templates/Article.vue",
        context: {
          id: article.node.id,
        },
      });
    });

    await categories.forEach((category) => {
      createPage({
        path: `/category/${slugify(category.node.name)}`,
        component: "./src/templates/Category.vue",
        context: {
          id: category.node.id,
        },
      });
    });
  });
};
