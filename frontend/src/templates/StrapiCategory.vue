<template>
  <section>
    <!-- <h1>{{ $page.category.name }}</h1> -->
    <app-filters
      v-if="filters"
      class="container mb-6 container--fixed"
      :filters="filters"
    ></app-filters>

    <Layout v-if="previews.length > 0">
      <app-entry-preview
        v-for="article in previews"
        :key="article.id"
        :entry="article"
      ></app-entry-preview>
    </Layout>
    <button @click="fetchMore">Load</button>
  </section>
</template>

<page-query>
  query ($page: Int, $slug: String!) {
    articles: allStrapiArticle(filter: { category: { slug: { eq: $slug }}}, perPage: 1, page: $page) @paginate {
      edges {
        node {
          id
          title
          lead
          slug
          path
          published_at
          cover {
            url
            alternativeText
            caption
          }
          category {
            id
            name
            slug
          }
        }
      }
    }
   categories: allStrapiCategory(sortBy: "name", order: ASC) {
      edges {
        node {
          id
          name
          path
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

  data() {
    return {
      visibleArticles: [],
    };
  },

  mounted() {
    this.visibleArticles = this.$page.articles.edges;
  },

  methods: {
    async fetchMore() {
      const { data } = await this.$fetch(this.$route.path + "/2");
      this.visibleArticles = [...this.visibleArticles, ...data.articles.edges];
    },
  },

  computed: {
     filters() {
      return this.$page.categories.edges.map(({ node: category }) => {
        return {
          path: category.path,
          id: category.id,
          name: category.name,
        };
      });
    },
    
    previews() {
      return this.visibleArticles.map(({ node: entry }) => {
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
          link: entry.path,
        };
      });
    },
  },

  watch: {
    $route(newRoute, oldRoute) {
      this.visibleArticles = this.$page.articles.edges;
    },
  },
};
</script>
