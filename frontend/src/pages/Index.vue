<template>
  <section>
    <app-filters
      v-if="filters"
      class="container mb-6 container--fixed"
      :filters="filters"
    ></app-filters>

    <Layout :colNum="3">
      <template v-if="articles.length > 0">
        <app-preview-card
          v-for="{ node: article } in articles"
          :key="article.id"
          :content="article.lead"
          :date="article.published_at"
          :image="article.cover"
          :title="article.title"
          :url="article.path"
        ></app-preview-card>
      </template>
    </Layout>

    <div class="container mb-6 container--fixed">
      <button
        v-if="hasNextPage"
        class="block px-2 mx-auto mt-10 text-xl font-bold button button--dark"
        @click="fetchMore"
      >
        Load more
      </button>
    </div>
  </section>
</template>

<page-query>
 query($page: Int) {
    articles: allStrapiArticle(
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
import AppRichContent from "~/components/RichContent.vue";
import AppPreviewCard from "~/components/PreviewCard.vue";
import AppFilters from "~/components/Filters.vue";

export default {
  name: "Index",
  mixins: [collectionMixin],
  components: { AppPreviewCard, AppFilters, AppRichContent },

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
