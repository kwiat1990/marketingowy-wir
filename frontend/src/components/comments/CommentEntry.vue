<template>
  <div class="comment-entry" :id="`comment-${comment.id}`">
    <app-comment
      :author="userName(comment)"
      :content="comment.content"
      :date="comment.created_at"
      :hasUser="comment.authorUser !== null"
    ></app-comment>

    <button
      v-if="!hasReplied"
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
        :author="userName(childComment)"
        :content="childComment.content"
        :date="childComment.created_at"
        :hasUser="childComment.authorUser !== null"
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
  props: ["comment", "hasReplied"],
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

  methods: {
    userName(comment) {
      return comment?.authorUser ? comment.authorUser?.username : comment.authorName;
    },
  },
};
</script>

<style lang="scss">
.comment-entry {
  @apply border-b border-color-accent-1 pb-6 px-4;
}

.toggle-button {
  @apply border-color-accent-1 mt-4 text-base py-1 px-4;
}

.response {
  @apply mt-4 ml-10;
}
</style>
