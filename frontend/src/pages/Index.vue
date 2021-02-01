<template>
  <div>
    <app-filters
      v-if="filters"
      class="container mb-6 container--fixed"
      :filters="filters"
    ></app-filters>

    <app-transition :appear="true" mode="out-in">
      <grid-layout :key="$route.path" :fullWidhtCol="!$context.hideLatest">
        <app-preview-card
          v-if="!$context.hideLatest"
          :content="latestArticle.lead"
          :date="latestArticle.published_at"
          :image="latestArticle.cover"
          :title="latestArticle.title"
          :url="latestArticle.path"
          isLatest
        ></app-preview-card>

        <app-preview-card
          v-for="{ node: article } in articles"
          :key="article.id"
          :content="article.lead"
          :date="article.published_at"
          :image="article.cover"
          :title="article.title"
          :url="article.path"
        ></app-preview-card>
      </grid-layout>
    </app-transition>

    <button
      v-if="hasNextPage"
      class="block px-4 py-2 mx-auto mt-10 text-xl font-bold button button--outline"
      @click="fetchNextPage"
    >
      Załaduj więcej
    </button>
  </div>
</template>

<page-query>
 query($page: Int, $name: [String!], $toSkip: Int = 1) {
  latestArticle: allStrapiArticle(limit: 1) {
    edges {
      node {
        cover {
          alternativeText
          caption
          url(width: 720)
        }
        id
        lead
        path
        published_at
        title
      }
    }
  }
   
  articles: allStrapiArticle(
    filter: { category: { name: { in: $name } } }
    perPage: 6,
    page: $page,
    skip: $toSkip
  ) @paginate {
  pageInfo {
    currentPage
    hasNextPage
  }
    edges {
      node {
        cover {
          alternativeText
          caption
          url(width: 640)
        }
        id
        lead
        path
        published_at
        title
      }
    }
  }
  
  categories: allStrapiCategory(
    filter: { articles: { title: { exists:  true }} }
    sortBy: "name", 
    order: ASC
  ) {
    edges {
      node {
        id
        name
        path
      }
    }
  }
}
</page-query>

<script>
import { fetchAndCacheArticlesMixin } from "~/mixins/fetch-and-cache-articles.mixin";
import AppRichContent from "~/components/RichContent.vue";
import AppPreviewCard from "~/components/PreviewCard.vue";
import AppFilters from "~/components/Filters.vue";
import { SlideYDownTransition as AppTransition } from "vue2-transitions";

export default {
  name: "HomePage",
  mixins: [fetchAndCacheArticlesMixin],
  components: { AppFilters, AppPreviewCard, AppRichContent, AppTransition },

  computed: {
    latestArticle() {
      return this.$page?.latestArticle?.edges[0]?.node;
    },
  },
};
</script>
