<template>
  <Layout>
    <h1>{{ $page.category.name }}</h1>
    <template v-if="previews.length > 0">
      <app-entry-preview
        v-for="article in previews"
        :key="article.id"
        :entry="article"
      ></app-entry-preview>
    </template>
  </Layout>
</template>

<page-query>
  query ($id: ID!) {
    category: strapiCategory(id: $id) {
      id
      name
      slug
      articles {
        id
        title
        lead
        slug
        published_at
        cover {
          url
          alternativeText
          caption
        }
      }
    }
  }
</page-query>

<script>
import EntryPreview from "../components/EntryPeview.vue";

export default {
  name: "DefaultPage",
  components: { "app-entry-preview": EntryPreview },

  computed: {
    previews() {
      return this.$page.category.articles.map((entry) => {
        return {
          id: entry.id,
          category: this.$page.category.name,
          date: entry.published_at,
          title: entry.title,
          content: entry.lead,
          slug: entry.slug,
          image: {
            url: entry.cover?.url,
            alt: entry.cover?.alternativeText,
            caption: entry.cover?.caption,
          },
          link: `${this.$page.category.slug}/${entry.slug}`,
        };
      });
    },
  },
};
</script>
