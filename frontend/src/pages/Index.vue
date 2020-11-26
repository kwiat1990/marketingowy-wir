<template>
  <section>
    <Layout twoCols>
      <template v-if="previews">
        <app-entry-preview
          v-for="article in previews"
          :key="article.id"
          :entry="article"
        ></app-entry-preview>
      </template>
      <template slot="sidebar">Okie</template>
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
      return this.$page.articles.edges.map((entry) => {
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
          },
        };
      });
    },
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
