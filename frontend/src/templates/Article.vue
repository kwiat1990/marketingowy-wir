<template>
  <Layout>
    <small v-if="$page.article.category"
      ><g-link :to="$page.article.category.slug">{{ $page.article.category.name }}</g-link></small
    >
    <h1 class="text-4xl font-bold text-center sm:text-7xl">{{ $page.article.title }}</h1>
    <span class="block mt-8 text-2xl text-center">{{ $page.article.lead }}</span>
    <time
      class="block mt-4 text-base"
      :datetime="getFormattedDate($page.article.published_at).datetime"
      >{{ getFormattedDate($page.article.published_at).date }}</time
    >
    <app-tags v-if="$page.article.tags.length > 0" :tags="$page.article.tags"></app-tags>

    <g-image
      v-if="$page.article.cover"
      :src="getUrl($page.article.cover.url)"
      :alt="$page.article.cover.alternativeText"
    ></g-image>

    <template v-for="content in $page.article.content">
      <g-image
        v-if="content.image"
        :src="getUrl(content.image.url)"
        :alt="content.image.alternativeText"
        :key="`image-${content.id}`"
      ></g-image>
      <span v-if="content.image" :key="`caption-${content.id}`">{{ content.image.caption }}</span>
      <app-rich-content :content="content.text" :key="`text-${content.id}`"></app-rich-content>
    </template>
  </Layout>
</template>

<page-query>
  query Article($id: ID!) {
    article: strapiArticle(id: $id) {
      id
      lead
      title
      content {
        id
        text
        image {
          url
          alternativeText
          caption
        }
      }
      cover {
        url
        alternativeText
        caption
      }
      category {
        name
        slug
      }
      published_at
      tags {
        id
        name
        slug
      }
    }
  }
</page-query>

<script>
import getFormattedDate from "~/utils/format-date";
import getUrl from "~/utils/url-resolver";
import RichContent from "~/components/RichContent.vue";
import Tags from "~/components/Tags.vue";

export default {
  name: "Article",
  components: { "app-rich-content": RichContent, "app-tags": Tags },
  data() {
    return {
      getFormattedDate,
      getUrl,
    };
  },
};
</script>
