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
          category {
            id
            name
            slug
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
      return this.$page.articles.edges.map(({ node: entry }) => {
        return {
          id: entry.id,
          category: entry.category?.name,
          date: entry.published_at,
          title: entry.title,
          content: entry.preview,
          slug: entry.slug,
          image: {
            url: entry.cover[0]?.url,
            alternativeText: "",
          },
          link: `/${entry.category.slug}/${entry.slug}`,
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
