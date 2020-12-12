<template>
  <section>
    <app-filters
      v-if="filters"
      class="container mb-6 container--fixed"
      :filters="filters"
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

    <div class="container mb-6 container--fixed">
      <button class="block px-2 mx-auto mt-10 text-xl font-bold button button--dark">
        Load more
      </button>
    </div>
  </section>
</template>

<page-query>
  query($page: Int) { 
    articles: allStrapiArticle(sort: [{ by: "date" }], perPage: 1, page: $page) @paginate { 
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
          path
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
          path
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
    };
  },

  mounted() {
    this.articles = this.$page.articles.edges;
  },

  methods: {},

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
      return this.articles.map(({ node: entry }) => {
        return {
          id: entry.id,
          category: entry.category?.name,
          categoryCode: entry.category.slug,
          date: entry.published_at,
          title: entry.title,
          content: truncate(entry.lead),
          slug: entry.slug,
          image: {
            url: entry?.cover?.url,
            alt: entry?.cover?.alternativeText,
            caption: entry.cover?.caption,
          },
          link: entry.path,
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
