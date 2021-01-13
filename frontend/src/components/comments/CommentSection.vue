<template>
  <div class="comments">
    <template v-if="commentCount > 0">
      <span class="block w-full mt-8 mb-6 text-2xl font-bold"
        >Komentarze ({{ commentCount }})
      </span>

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
    </template>
    <span v-else class="block w-full mt-8 mb-6 text-2xl font-bold"
      >Brak komentarzy - zacznij dyskuje</span
    >

    <app-comment-form @on-submit="submitComment"></app-comment-form>
  </div>
</template>

<script>
import AppCommentEntry from "~/components/comments/CommentEntry.vue";
import AppCommentForm from "~/components/comments/CommentForm.vue";

export default {
  name: "CommentSection",
  props: {
    relatedTo: String,
  },
  components: {
    AppCommentEntry,
    AppCommentForm,
  },

  data() {
    return {
      comments: [],
    };
  },

  async mounted() {
    this.$http
      .url(`/comments/article:${this.relatedTo}`)
      .get()
      .json((res) => {
        this.comments = res;
      })
      .then((err) => (this.error = err))
      .catch((err) => console.error("An error occured while fetching comments. ", err));
  },

  computed: {
    commentCount() {
      if (this.comments.length > 0) {
        return (
          this.comments.length +
          this.comments.reduce((count, comment) => (count += comment.children.length), 0)
        );
      }
    },
  },

  methods: {
    submitComment(event, threadId = null) {
      this.$http
        .url(`/comments/article:${this.$page.article.id}`)
        .post({
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
        })
        .json((res) => {
          return res;
        })
        .then((err) => {
          this.error = err;
        })
        .catch((err) => console.error("An error occured while posting the comment. ", err));
    },
  },
};
</script>

<style></style>
