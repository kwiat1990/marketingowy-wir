<template>
  <section>
    <app-filters
      v-if="filters"
      class="mb-6 fixed-container"
      :filters="filters"
      :preselected="Object.values($route.query)"
      @on-filter-change="onFilterChange"
    ></app-filters>

    <Layout :colNum="3">
      <template v-if="previews">
        <app-entry-preview
          v-for="article in filteredArticles"
          :key="article.id"
          :entry="article"
        ></app-entry-preview>
      </template>
      </Layout>
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
    };
  },

  methods: {
    onFilterChange(filters) {
      this.$router.replace(
        {
          path: this.$route.path,
          query: { ...filters },
        },
        // silcence irrelevant duplicate navigation error caused by preselected filters,
        // which trigger "on-filter-change" event direct after page load
        () => {}
      );
    },

    beforeEnter: function (el) {
      el.style.opacity = 0;
      el.style.height = 0;
    },
    enter: function (el, done) {
      var delay = el.dataset.index * 150;
      setTimeout(function () {
        Velocity(el, { opacity: 1, height: "1.6em" }, { complete: done });
      }, delay);
    },
    leave: function (el, done) {
      var delay = el.dataset.index * 150;
      setTimeout(function () {
        Velocity(el, { opacity: 0, height: 0 }, { complete: done });
      }, delay);
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
        return this.previews.filter((article) => {
          if (query.includes(article.categoryCode)) {
            return article;
          }
        });
      }
      return this.previews;
    },

    previews() {
      return this.$page.articles.edges.map(({ node: entry }) => {
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

</style>
