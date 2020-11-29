<template>
  <Layout>
    <h1>{{ $context.data.name }}</h1>
    <template v-if="previews.length > 0">
      <app-entry-preview
        v-for="article in previews"
        :key="article.id"
        :entry="article"
      ></app-entry-preview>
    </template>
  </Layout>
</template>

<script>
import EntryPreview from "../components/EntryPeview.vue";

export default {
  name: "DefaultPage",
  components: { "app-entry-preview": EntryPreview },

  computed: {
    previews() {
      return this.$context.data.articles.map((entry) => {
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
          link: `${this.$context.data.slug}/${entry.slug}`,
        };
      });
    },
  },
};
</script>

<style></style>
