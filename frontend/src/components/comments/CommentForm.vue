<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="name">Name</label>
      <div class="input-wrapper">
        <app-icon icon="user" disableHover></app-icon>
        <input type="text" id="name" v-model="name" />
      </div>
    </div>

    <div>
      <label for="email">E-mail</label>
      <div class="input-wrapper">
        <app-icon icon="email" disableHover></app-icon>
        <input type="email" id="email" v-model="email" />
      </div>
    </div>
    
    <div class="col-span-2 input-wrapper">
      <label for="comment">Comment</label>
      <textarea name="comment" id="comment" rows="8" v-model="comment"></textarea>
    </div>
    
    <button type="submit" class="w-full col-span-2 px-6 py-2 button button--dark" :disabled="!isValid">Submit</button>
  </form>
</template>

<script>
import sanitizeHtml from "sanitize-html";
import AppIcon from "~/components/Icon.vue";

export default {
  name: "CommentForm",
  components: { AppIcon },
  
  data() {
    return {
      comment: "",
      email: "",
      name: "",
    };
  },

  methods: {
    onSubmit() {
      this.$emit("on-submit", {
        comment: sanitizeHtml(this.comment),
        email: sanitizeHtml(this.email),
        name: sanitizeHtml(this.name),
      });
    },
  },

  computed: {
    isValid() {
      return true;
    }
  }
};
</script>

<style lang="scss" scoped>
form {
  @apply sm:grid gap-x-12 grid-cols-2;
}

input,
textarea {
  @apply px-6 py-2 w-full rounded-md border-2 border-color-accent-3;
}

input {
  @apply pl-14;
}

label {
  @apply block;
}

textarea {
  @apply resize-none
}

.input-wrapper {
  @apply relative mb-6;

  svg {
    @apply absolute top-1/2 left-3 transform -translate-y-2/4 hover:scale-100;
  }
}
</style>
