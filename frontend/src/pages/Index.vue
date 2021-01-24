<template>
  <section>
    <app-filters
      v-if="filters"
      class="container mb-6 container--fixed"
      :filters="filters"
    ></app-filters>

    <single-layout class="mb-20">
      <app-preview-card
        :content="$page.latestArticle.edges[0].node.lead"
        :date="$page.latestArticle.edges[0].node.published_at"
        :image="$page.latestArticle.edges[0].node.cover"
        :title="$page.latestArticle.edges[0].node.title"
        :url="$page.latestArticle.edges[0].node.path"
        isLatest
      ></app-preview-card>
    </single-layout>

    <grid-layout :colNum="3" v-if="articles.length > 1">
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

    <button
      v-if="hasNextPage"
      class="block px-4 py-2 mx-auto mt-10 text-xl font-bold button button--outline"
      @click="fetchNextPage"
    >
      Załaduj więcej
    </button>
  </section>
</template>

<page-query>
 query($page: Int) {
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
      perPage: 6
      page: $page,
      skip: 1
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
  
  categories: allStrapiCategory(sortBy: "name", order: ASC) {
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

export default {
  name: "HomePage",
  mixins: [fetchAndCacheArticlesMixin],
  components: { AppFilters, AppPreviewCard, AppRichContent },
};
</script>
