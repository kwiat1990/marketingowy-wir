<template>
  <section>
    <h1>{{ $page.category.name }}</h1>
    <Layout v-if="previews.length > 0">
      <app-entry-preview
        v-for="article in previews"
        :key="article.id"
        :entry="article"
      ></app-entry-preview>
    </Layout>
  </section>
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
    categories: allStrapiCategory(sortBy: "name", order: ASC) {
      edges {
        node {
          id
          name
          slug
        }
      }
    }
  }
</page-query>

<script>
import AppEntryPreview from "~/components/EntryPeview.vue";
import AppFilters from "~/components/Filters.vue";

export default {
  name: "DefaultPage",
  components: { AppEntryPreview, AppFilters },

  computed: {
    filters() {
      return this.$page.categories.edges.map(({ node: category }) => {
        return {
          code: category.slug,
          id: category.id,
          name: category.name,
        };
      });
    },
    
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
