<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="name">Name</label>
      <div>
        <app-icon icon="user"></app-icon>
        <input type="text" id="name" v-model="name" />
      </div>
    </div>
    <div>
      <label for="email">E-mail</label>
      <div>
        <app-icon icon="email"></app-icon>
        <input type="email" id="email" v-model="email" />
      </div>
    </div>
    <div class="col-span-2">
      <label for="comment">Comment</label>
      <textarea name="comment" id="comment" rows="3" v-model="comment"></textarea>
    </div>
    <button type="sumit" class="col-span-2">Submit</button>
  </form>
</template>

<script>
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
      this.$emit("on-submit", this.$data);
    },
  },
};
</script>

<style lang="scss" scoped>
form {
  @apply sm:grid gap-x-12 gap-y-6 grid-cols-2;
}

input,
textarea {
  @apply px-6 py-4 w-full;
}

label {
  @apply block;
}
</style>
