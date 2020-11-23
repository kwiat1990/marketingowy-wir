<template>
  <Layout>
    <small v-if="$page.article.categories[0]">{{ $page.article.categories[0].name }}</small>
    <h1>{{ $page.article.title }}</h1>
    <g-image
      :src="getUrl($page.article.cover[0].url)"
      :alt="$page.article.cover[0].alternativeText"
    ></g-image>
    <span>{{ $page.article.cover[0].caption }}</span>
    <app-rich-content :content="$page.article.content"></app-rich-content>
    <app-tags :tags="$page.article.tags"></app-tags>
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
