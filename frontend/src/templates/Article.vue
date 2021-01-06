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

    <figure v-if="$page.article.cover">
      <g-image :src="$page.article.cover.url" :alt="$page.article.cover.alternativeText"></g-image>
      <figcaption v-if="$page.article.cover.caption">
        {{ $page.article.content.caption }}
      </figcaption>
    </figure>

    <template v-for="content in $page.article.content">
      <figure v-if="content.image" :key="`image-${content.id}`">
        <g-image :src="content.image.url" :alt="content.image.alternativeText"></g-image>
        <figcaption v-if="content.image.caption">{{ content.image.caption }}</figcaption>
      </figure>

      <app-rich-content :content="content.text" :key="`text-${content.id}`"></app-rich-content>
    </template>

    <div class="max-w-3xl mx-auto">
      <button @click="showComments = true">Pokaz komentarze</button>
      <div class="comments" v-if="showComments && comments">
        <app-comment-entry
          class="mb-4"
          v-for="comment in comments"
          :comment="comment"
          :key="`comment-${comment.id}`"
        >
          <template v-slot="{ isReplying }">
            <app-comment-form
              class="mt-4"
              v-if="isReplying"
              @on-submit="submitComment($event, comment.id)"
            ></app-comment-form>
          </template>
        </app-comment-entry>
        <app-comment-form @on-submit="submitComment"></app-comment-form>
      </div>
    </div>
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
import AppCommentEntry from "~/components/comments/CommentEntry.vue";
import AppCommentForm from "~/components/comments/CommentForm.vue";
import AppTags from "~/components/Tags.vue";

export default {
  name: "Article",
  components: { AppCommentEntry, AppCommentForm, AppRichContent, AppTags },
  data() {
    return {
      getFormattedDate,
      showComments: false,
      comments: [],
      showReply: false,
    };
  },

  async mounted() {
    try {
      const response = await fetch(
        `${process.env.GRIDSOME_API_URL}/comments/article:${this.$page.article.id}`
      );
      this.comments = await response.json();
    } catch (e) {
      console.error(`An error occured when fetching comments. ${e}`);
    }
  },

  methods: {
    submitComment(event, threadId = null) {
      function handleErrors(response) {
        console.log(response.json());
        if (!response.ok) {
          throw Error(response.statusText);
        }
        return response;
      }

      try {
        fetch(`${process.env.GRIDSOME_API_URL}/comments/article:${this.$page.article.id}`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            authorId: event.email,
            authorName: event.name,
            authorEmail: event.email,
            content: event.comment,
            threadOf: threadId,
            related: [
              {
                refId: parseInt(this.$page.article.id, 10),
                ref: "article",
                field: "comments",
              },
            ],
          }),
        })
          .then(handleErrors)
          .then((response) => console.log("ok"))
          .catch((error) => console.log(error));
      } catch (e) {
        console.error(`The comment could not be posted. Please try again. Error details: ${e}`);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
img {
  max-width: calc(100% + #{theme("spacing.12")});
  @apply -mx-6 sm:mx-auto sm:max-w-full;
}

figure {
  @apply my-10;
}

figcaption {
  @apply max-w-3xl mx-auto text-center text-base;
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
