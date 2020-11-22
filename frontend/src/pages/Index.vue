<template>
  <section>
    <Layout>
      <template v-if="$page.articles">
        <article
          class="mb-8 prose border-b"
          v-for="article in $page.articles.edges"
          :key="article.node.id"
        >
          <h2>{{ article.node.title }}</h2>

          <!-- remove pointer to localhost:1337, it's for local dev only -->
          <g-image
            v-if="article.node.cover[0]"
            :src="getUrl(article.node.cover[0].url)"
            alt=""
          ></g-image>

          <app-rich-content :content="article.node.content"></app-rich-content>

          <ul class="mt-8">
            <li v-for="category in article.node.categories" :key="category.id">
              <!-- <g-link :to="'categories/' + category.id">{{ category.name }}</g-link> -->
            </li>
          </ul>
        </article>
      </template>
    </Layout>
  </section>
</template>

<page-query>
  query {
    articles: allStrapiArticle {
      edges {
        node {
          title
          content
          cover {
            url
          }
          slug
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
import getUrl from "~/utils/url-resolver";
import RichContent from "~/components/RichContent.vue";

export default {
  components: { "app-rich-content": RichContent },
  
  data() {
    return {
      getUrl,
    };
  },

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

<style lang="scss" scoped>
.home-links a {
  margin-right: 1rem;
}
</style>
