<template>
  <Layout>
    <small v-if="$page.article.categories.length > 0">{{ $page.article.categories[0].name }}</small>
    <h1>{{ $page.article.title }}</h1>
    <g-image
      v-if="$page.article.cover.length > 0"
      :src="getUrl($page.article.cover.url)"
      :alt="$page.article.cover.alternativeText"
    ></g-image>
    <span>{{ $page.article.cover.caption }}</span>
    <app-rich-content :content="$page.article.content"></app-rich-content>
    <app-tags v-if="$page.article.tags.length > 0" :tags="$page.article.tags"></app-tags>
  </Layout>
</template>

<page-query>
  query Article($id: ID!) {
    article: strapiArticle(id: $id) {
      id
      title
      content
      cover {
        url
        alternativeText
        caption
      }
      categories {
        name
      }
      tags {
        id
        name
      }
    }
  }
</page-query>

<script>
import getUrl from "~/utils/url-resolver";
import RichContent from "~/components/RichContent.vue";
import Tags from "~/components/Tags.vue";

export default {
  name: "Article",
  components: { "app-rich-content": RichContent, "app-tags": Tags },
  data() {
    return {
      getUrl,
    };
  },
};
</script>
