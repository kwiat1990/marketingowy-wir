<template>
  <Layout>
    <ul>
      <li v-for="restaurant in $page.allStrapiRestaurant.edges" :key="restaurant.node.id">
        {{ restaurant.node.name }}
        <ul>
          <li v-for="category in restaurant.node.categories" :key="category.id">
            <g-link :to="'categories/' + category.id">{{ category.name }}</g-link>
          </li>
        </ul>
      </li>
    </ul>
  </Layout>
</template>

<page-query>
  query {
      allStrapiRestaurant {
        edges {
          node {
            id
            name
            categories {
              id
              name
            }
          }
        }
      }
    }
</page-query>

<script lang="ts">
export default {
  metaInfo: {
    title: "Marketingowy Wir",
    meta: [
      {
        name: "description",
        content: "Blog o online marketingu.",
      },
    ],
  },
};
</script>

<style>
.home-links a {
  margin-right: 1rem;
}
</style>
