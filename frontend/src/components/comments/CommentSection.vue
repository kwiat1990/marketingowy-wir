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
        :hasReplied="showSuccess(`form-${comment.id}`)"
        :key="`comment-${comment.id}`"
      >
        <template v-slot="{ isReplying }">
          <p v-if="showError(`form-${comment.id}`)" class="mt-6 error-message">{{ errorMessage }}</p>
          <p v-if="showSuccess(`form-${comment.id}`)">{{ successMessage }}</p>
          <app-comment-form
            class="mt-4"
            v-if="isReplying && !showSuccess(`form-${comment.id}`)"
            :id="`form-${comment.id}`"
            :hasError="showError(`form-${comment.id}`)"
            @on-submit="submitComment($event, comment.id)"
          >
          </app-comment-form>
        </template>
      </app-comment-entry>
    </template>
    <span v-else class="block w-full mt-8 mb-6 text-2xl font-bold"
      >Brak komentarzy - zacznij dyskusję</span
    >
    <p v-if="showError('form-reply')" class="mb-4 error-message">{{ errorMessage }}</p>
    <p v-if="showSuccess('form-reply')">{{ successMessage }}</p>
    <app-comment-form
      v-if="!showSuccess('form-reply')"
      id="form-reply"
      :hasError="showError('form-reply')"
      @on-submit="submitComment"
    >
    </app-comment-form>
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
      activeFormId: null,
      comments: [],
      errorMessage: null,
      hasReplied: false,
    };
  },

  async mounted() {
    this.$http
      .url(`/comments/article:${this.relatedTo}`)
      .get()
      .json((res) => {
        this.comments = res;
      })
      .catch((err) => {
        this.errorMessage = err.info;
        console.error("An error occured while fetching comments. ", err);
      });
  },

  computed: {
    successMessage() {
      return "Twój komentarz został dodany. Odśwież stronę, aby go zobaczyć.";
    },

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
    showError(formId) {
      return this.errorMessage && this.activeFormId === formId;
    },

    showSuccess(formId) {
      return this.hasReplied && this.activeFormId === formId;
    },

    submitComment(event, threadId = null) {
      this.activeFormId = event.id;
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
        .badRequest(
          (err) =>
            (this.errorMessage =
              "Coś poszło nie tak. Spróbuj ponownie, a jeśli problem będzie się powtarzał, daj nam znać.")
        )
        .json((res) => {
          this.hasReplied = true;
        })
        .catch((err) => {
          this.errorMessage = err.info;
          console.error("An error occured while posting the comment. ", err);
        });
    },
  },
};
</script>

<style></style>
