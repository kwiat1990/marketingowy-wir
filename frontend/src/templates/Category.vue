<template>
  <section>
    <!-- <h1>{{ $page.category.name }}</h1> -->
    <app-filters
      v-if="filters"
      class="container mb-6 container--fixed"
      :filters="filters"
    ></app-filters>

    <Layout v-if="articles.length > 0">
      <app-preview-card
        v-for="{ node: article } in articles"
        :key="article.id"
        :content="article.lead"
        :date="article.published_at"
        :image="article.cover"
        :title="article.title"
        :url="article.path"
      ></app-preview-card>
    </Layout>
    <button v-if="hasNextPage" @click="fetchNextPage">Load</button>
  </section>
</template>

<page-query>
  query($page: Int, $name: String!) {
    articles: allStrapiArticle(
      filter: { category: { name: { eq: $name } } }
      perPage: 1
      page: $page
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
import { collectionMixin } from "~/mixins/collection.mixin";
import AppPreviewCard from "~/components/PreviewCard.vue";
import AppFilters from "~/components/Filters.vue";

export default {
  name: "Category",
  mixins: [collectionMixin],
  components: { AppPreviewCard, AppFilters },
};
</script>
