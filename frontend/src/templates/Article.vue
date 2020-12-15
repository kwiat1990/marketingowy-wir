<template>
  <article>
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

    <figure v-if="$page.article.cover">
      <g-image
        :src="getUrl($page.article.cover.url)"
        :alt="$page.article.cover.alternativeText"
      ></g-image>
      <figcaption v-if="$page.article.cover.caption">
        {{ $page.article.content.caption }}
      </figcaption>
    </figure>

    <template v-for="content in $page.article.content">
      <figure v-if="content.image" :key="`image-${content.id}`">
        <g-image :src="getUrl(content.image.url)" :alt="content.image.alternativeText"></g-image>
        <figcaption v-if="content.image.caption">{{ content.image.caption }}</figcaption>
      </figure>

      <app-rich-content :content="content.text" :key="`text-${content.id}`"></app-rich-content>
    </template>
  </article>
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

<style lang="scss" scoped>
img {
  max-width: calc(100% + #{theme("spacing.12")});
  @apply -mx-6 my-10 sm:mx-auto sm:max-w-full;
}

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
  @apply max-w-3xl mx-auto text-center;
}

.lead {
  @apply block mt-8 text-xl sm:text-2xl text-center;
}
</style>
