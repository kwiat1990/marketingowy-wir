<template>
  <form class="form" :class="{ ['form--has-error']: hasError }" @submit.prevent="onSubmit">
    <app-input
      v-for="field in fields"
      :key="field.id"
      :field="field"
      v-model="$data[field.id]"
    ></app-input>

    <div class="col-span-2 input-wrapper">
      <label for="comment">Comment</label>
      <textarea name="comment" id="comment" rows="8" v-model="comment"></textarea>
    </div>

    <button
      type="submit"
      class="w-full col-span-2 px-6 py-2 button button--dark"
      :disabled="!isValid"
    >
      Submit
    </button>
  </form>
</template>

<script>
import sanitizeHtml from "sanitize-html";
import AppIcon from "~/components/Icon.vue";
import AppInput from "~/components/Input.vue";

export default {
  name: "CommentForm",
  components: { AppIcon, AppInput },
  props: {
    id: String,
    hasError: {
      type: Boolean,
      default: false,
    },
  },

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
        id: this.id,
      });
    },
  },

  computed: {
    isValid() {
      return this.comment !== "" && this.email !== "" && this.name !== "";
    },

    fields() {
      return [
        {
          type: "text",
          icon: "user",
          id: "name",
          label: "Name",
        },
        {
          type: "email",
          icon: "email",
          id: "email",
          label: "E-mail",
        },
      ];
    },
  },
};
</script>

<style lang="scss" scoped>
.form {
  @apply sm:grid gap-x-12 grid-cols-2;
  
  &--has-error {
    /deep/ input,
    textarea {
      border-color: var(--color-red);
    }
  }
}
</style>
