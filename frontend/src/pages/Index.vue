<template>
  <section>
    <app-filters
      v-if="filters"
      class="container mb-6 container--fixed"
      :filters="filters"
      :preselected="Object.values($route.query)"
      @on-filter-change="onFilterChange"
    ></app-filters>

    <Layout :colNum="3">
      <template v-if="previews">
        <app-entry-preview
          v-for="article in paginatedResults"
          :key="article.id"
          :entry="article"
        ></app-entry-preview>
      </template>
    </Layout>

    <div class="container mb-6 container--fixed">
      <button
        v-if="hasMorePages"
        class="block px-2 mx-auto mt-10 text-xl font-bold button button--dark"
        @click="loadMore"
      >
        Load more
      </button>
    </div>
  </section>
</template>

<page-query>
  query { 
  articles: allStrapiArticle(sort: [{ by: "date" }]) { 
      edges {
        node {
          category {
            id
            name
            slug
          }
          cover {
            url(width: 640)
            caption
            alternativeText
            height
            width
          }
          id
          lead
          published_at
          slug
          title
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
import getUrl from "~/utils/url-resolver";
import truncate from "~/utils/truncate";
import AppRichContent from "~/components/RichContent.vue";
import AppEntryPreview from "~/components/EntryPeview.vue";
import AppFilters from "~/components/Filters.vue";

export default {
  components: { AppEntryPreview, AppFilters, AppRichContent },

  data() {
    return {
      getUrl,
      articles: [],
      currentPage: 1,
      resultsPerPage: 3,
    };
  },

  mounted() {
    this.articles = this.$page.articles.edges;
  },

  methods: {
    onFilterChange(filters) {
      this.currentPage = 1;
      this.$router.replace(
        { query: { ...filters } },
        // silence irrelevant duplicate navigation error caused by preselected filters,
        // which trigger "on-filter-change" event direct after page load
        () => {}
      );
    },

    loadMore() {
      if (this.hasMorePages) {
        this.currentPage += 1;
      }
    },
  },

  computed: {
    hasMorePages() {
      console.log(this.currentPage, Math.ceil(this.filteredArticles.length / this.resultsPerPage));
      return this.currentPage < Math.ceil(this.filteredArticles.length / this.resultsPerPage);
    },

    filters() {
      return this.$page.categories.edges.map(({ node: category }) => {
        return {
          code: category.slug,
          id: category.id,
          name: category.name,
        };
      });
    },

    filteredArticles() {
      const query = Object.values(this.$route.query);
      if (query.length > 0) {
        return this.articles.filter(({ node: article }) => {
          if (query.includes(article.category.slug)) {
            return article;
          }
        });
      }
      return this.articles;
    },

    paginatedResults() {
      const resultsToShow = this.resultsPerPage * this.currentPage;
      return [...this.previews.slice(0, resultsToShow)];
    },

    previews() {
      return this.filteredArticles.map(({ node: entry }) => {
        return {
          id: entry.id,
          category: entry.category?.name,
          categoryCode: entry.category.slug,
          date: entry.published_at,
          title: entry.title,
          content: truncate(entry.lead),
          slug: entry.slug,
          image: {
            url: entry.cover?.url,
            alt: entry.cover?.alternativeText,
            caption: entry.cover?.caption,
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

<style lang="scss" scoped></style>
