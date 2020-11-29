<template>
  <Layout>
    <small v-if="$page.article.category">{{ $page.article.category.name }}</small>
    <h1>{{ $page.article.title }}</h1>
    <g-image
      v-if="$page.article.cover.length > 0"
      :src="getUrl($page.article.cover[0].url)"
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
      category {
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
