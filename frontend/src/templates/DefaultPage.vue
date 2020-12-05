<template>
  <Layout>
    <h1>{{ $page.tag.name }}</h1>
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
    tag: strapiTag(id: $id) {
      id
      name
      slug
      articles {
        id
        title
        lead
        slug
        published_at
        category {
          name
          slug
        }
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
      return this.$page.tag.articles.map((entry) => {
        return {
          id: entry.id,
          category: entry.category.name,
          date: entry.published_at,
          title: entry.title,
          content: entry.lead,
          slug: entry.slug,
          image: {
            url: entry.cover?.url,
            alt: entry.cover?.alternativeText,
            caption: entry.cover?.caption,
          },
          link: `${entry.category.slug}/${entry.slug}`,
        };
      });
    },
  },
};
</script>

<style></style>
