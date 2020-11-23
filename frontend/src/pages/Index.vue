<template>
  <section>
    <Layout>
      <template v-if="previews">
        <app-entry-preview
          v-for="article in previews"
          :key="article.id"
          :entry="article"
        ></app-entry-preview>
        
        <!-- <article
          class="mb-8 prose border-b"
          v-for="article in $page.articles.edges"
          :key="article.id"
        >
          <h2>{{ article.node.title }}</h2>

          <g-image
            v-if="article.node.cover[0]"
            :src="getUrl(article.node.cover[0].url)"
            alt=""
          ></g-image>

          <app-rich-content :content="article.node.content"></app-rich-content> 

          <ul class="mt-8">
            <li v-for="category in article.node.categories" :key="category.id">
              <g-link :to="'categories/' + category.id">{{ category.name }}</g-link>
            </li>
          </ul>
        </article> -->
      </template>
    </Layout>
  </section>
</template>

<page-query>
  query {
    articles: allStrapiArticle {
      edges {
        node {
          published_at
          id
          title
          cover {
            url
          }
          preview
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
import EntryPreview from "../components/EntryPeview.vue";

export default {
  components: { "app-entry-preview": EntryPreview, "app-rich-content": RichContent },

  data() {
    return {
      getUrl,
    };
  },

  computed: {
    previews() {
      return this.$page.articles.edges.map(entry => {
        return {
          id: entry.node.id,
          category: entry.node.categories[0]?.name,
          date: entry.node.published_at,
          title: entry.node.title,
          content: entry.node.preview,
          slug: entry.node.slug,
          image: {
            url: entry.node.cover[0]?.url,
            alternativeText: "",
          }
        } 
      })
    }
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
