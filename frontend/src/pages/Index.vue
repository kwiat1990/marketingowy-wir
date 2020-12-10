<template>
  <section>
    <app-filters
      v-if="filters"
      class="container mb-6 container--fixed"
      :filters="filters"
      :preselected="preselected"
      @on-filter-change="onFilterChange"
    ></app-filters>

    <Layout :colNum="3">
      <template v-if="previews">
        <app-entry-preview
          v-for="article in previews"
          :key="article.id"
          :entry="article"
        ></app-entry-preview>
      </template>
    </Layout>
    <button @click="loadMore">Load more</button>
  </section>
</template>

<page-query>
  query($page: Int) { 
    articles: allStrapiArticle(perPage: 3, page: $page, sort: [{ by: "date" }]) @paginate {
      pageInfo {
        totalPages
        currentPage
      }
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
    categories:  allStrapiCategory(sortBy: "name", order: ASC) {
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
      visibleArticles: [],
      preselected: [],
    };
  },

  created() {
    this.visibleArticles = this.$page.articles.edges;
  },

  methods: {
    onFilterChange(filters) {
      this.$router.replace(
        { query: { ...filters } },
        // silcence irrelevant duplicate navigation error caused by preselected filters,
        // which trigger "on-filter-change" event direct after page load
        () => {}
      );
    },

    async loadMore() {
      const { data } = await this.$fetch(`/${this.$route.params?.page + 1 || 2}`);
      this.visibleArticles = [...this.visibleArticles, ...data.articles.edges];
    },
  },

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

    filteredArticles() {
      const query = Object.values(this.$route.query);
      if (query.length > 0) {
        return this.visibleArticles.filter(({ node: article }) => {
          if (query.includes(article.category.slug)) {
            return article;
          }
        });
      }
      return this.visibleArticles;
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
            formats: entry.cover?.formats,
            height: entry.cover?.height,
            width: entry.cover?.width,
          },
          link: `/${entry.category.slug}/${entry.slug}`,
        };
      });
    },
  },

  watch: {
    $route(to, from) {
      this.preselected = Object.values(to.query);
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
