<template>
  <Layout>
    <template v-if="$page.allStrapiArticle">
      <article
        class="border-b mb_8 prose"
        v-for="article in $page.allStrapiArticle.edges"
        :key="article.node.id"
      >
        <h2>{{ article.node.title }}</h2>
        <!-- remove pointer to localhost:1337, it's for local dev only -->
        <g-image
          v-if="article.node.cover[0]"
          :src="`http://localhost:1337${article.node.cover[0].url}`"
          alt=""
        ></g-image>
        <!--        <div v-html="marked(article.node.content)"></div>-->
        <app-rich-content :content="article.node.content"></app-rich-content>

        <ul class="mt-8">
          <li v-for="category in article.node.categories" :key="category.id">
            <g-link :to="'categories/' + category.id">{{ category.name }}</g-link>
          </li>
        </ul>
      </article>
    </template>
  </Layout>
</template>

<page-query>
  query {
      allStrapiArticle {
        edges {
          node {
            title
            content
            cover {
              url
            }
            categories {
              id
              name
            }
          }
        }
      }
    }
</page-query>

<script>
import RichContent from "~/components/RichContent.vue";

export default {
  components: { "app-rich-content": RichContent },

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
