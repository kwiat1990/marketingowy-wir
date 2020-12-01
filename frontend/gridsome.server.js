// Server API makes it possible to hook into various parts of Gridsome
// on server-side and add custom data to the GraphQL data layer.
// Learn more: https://gridsome.org/docs/server-api/

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`
module.exports = function (api) {
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
                preview
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
                preview
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
          dataType: "article",
          data: article,
        },
      });
    });

    await categories.forEach(({ node: category }) => {
      createPage({
        path: `/${category.slug}`,
        component: "./src/templates/DefaultPage.vue",
        context: {
          id: category.id,
          dataType: "category",
          data: category,
        },
      });
    });

    await tags.forEach(({ node: tag }) => {
      createPage({
        path: `/${tag.slug}`,
        component: "./src/templates/DefaultPage.vue",
        context: {
          id: tag.id,
          dataType: "tag",
          data: tag,
        },
      });
    });
  });
};
