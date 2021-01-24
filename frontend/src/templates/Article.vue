<template>
  <single-layout>
    <div class="hero">
      <g-link
        v-if="$page.article.category"
        class="category link-decor"
        :to="$page.article.category.path"
        >{{ $page.article.category.name }}</g-link
      >
      <h1 class="headline">{{ $page.article.title }}</h1>
      <span class="lead">{{ $page.article.lead }}</span>
      <time class="date" :datetime="getFormattedDate($page.article.published_at).datetime">{{
        getFormattedDate($page.article.published_at).date
      }}</time>
      <app-tags v-if="$page.article.tags.length > 0" :tags="$page.article.tags"></app-tags>
    </div>

    <app-image
      v-if="$page.article.cover"
      :srcset="$page.article.cover.url"
      :altText="$page.article.cover.alternativeText"
      :caption="$page.article.content.caption"
    >
    </app-image>

    <template v-for="content in $page.article.content">
      <app-image
        v-if="content.image"
        :key="`image-${content.id}`"
        :srcset="content.image.url"
        :altText="content.image.alternativeText"
        :caption="content.image.caption"
      >
      </app-image>

      <app-rich-content :content="content.text" :key="`text-${content.id}`"></app-rich-content>
    </template>

    <app-comment-section
      class="max-w-4xl mx-auto mt-40 border-t-2 border-color-surface-3"
      :relatedTo="$page.article.id"
    ></app-comment-section>
  </single-layout>
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
          url(width: 1000)
          alternativeText
          caption
        }
      }
      cover {
        url(width: 1200)
        alternativeText
        caption
      }
      category {
        name
        path
      }
      published_at
      tags {
        id
        name
        path
      }
    }
  }
</page-query>

<script>
import getFormattedDate from "~/utils/format-date";
import AppRichContent from "~/components/RichContent.vue";
import AppCommentSection from "~/components/comments/CommentSection.vue";
import AppTags from "~/components/Tags.vue";
import AppImage from "~/components/Image.vue";

export default {
  name: "Article",
  components: { AppCommentSection, AppImage, AppRichContent, AppTags },
  data() {
    return {
      getFormattedDate,
      showComments: false,
    };
  },
};
</script>

<style lang="scss" scoped>
.category {
  @apply uppercase inline-block pb-0 mb-4;
}

.date {
  @apply block my-4 text-base;
}

.headline {
  @apply text-4xl font-bold text-center sm:text-7xl;
}

.hero {
  @apply max-w-4xl mx-auto text-center;
}

.lead {
  @apply block mt-8 leading-10 text-xl sm:text-2xl sm:leading-10 text-center;
}
</style>
