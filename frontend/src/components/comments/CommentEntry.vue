<template>
  <div class="comment" :id="comment.id">
    <app-comment
      :author="comment.authorName"
      :content="comment.content"
      :date="comment.created_at"
    ></app-comment>

    <button
      type="button"
      class="toggle-button button button--outline"
      @click="isReplying = !isReplying"
    >
      {{ isReplying ? "Anuluj" : "Odpowiedz" }}
      <app-icon :icon="isReplying ? 'close' : 'back-left'" disableHover></app-icon>
    </button>

    <slot :isReplying="isReplying"></slot>

    <template v-if="hasChildren">
      <app-comment
        class="response"
        v-for="childComment in comment.children"
        :author="childComment.authorName"
        :content="childComment.content"
        :date="childComment.created_at"
        :key="`nested-comment-${childComment.id}`"
      ></app-comment>
    </template>
  </div>
</template>

<script>
import AppRichContent from "~/components/RichContent.vue";
import AppComment from "~/components/comments/Comment.vue";
import AppIcon from "~/components/Icon.vue";

export default {
  name: "CommentEntry",
  props: ["comment"],
  components: { AppComment, AppIcon, AppRichContent },

  data() {
    return {
      isReplying: false,
    };
  },

  computed: {
    hasChildren() {
      return this.comment.children && this.comment.children.length > 0;
    },
  },
};
</script>

<style lang="scss">
.comment {
  @apply bg-color-white border border-color-accent-1 p-4 rounded-md;
}

.toggle-button {
  @apply border-color-accent-1 mt-4 text-base py-0.5 px-2;
}

.response {
  @apply mt-4 ml-10;
}
</style>
