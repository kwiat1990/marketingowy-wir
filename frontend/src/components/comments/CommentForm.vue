<template>
  <form class="form" :class="{ ['form--has-error']: hasError }" @submit.prevent="onSubmit">
    <template v-if="!isUser">
      <app-input
        v-for="field in fields"
        :key="field.id"
        :field="field"
        v-model="$data[field.id]"
      ></app-input>
    </template>

    <div class="col-span-2 input-wrapper">
      <label for="comment">Comment</label>
      <textarea name="comment" id="comment" rows="8" v-model="comment"></textarea>
    </div>

    <div v-if="!isUser" class="flex col-span-2 input-wrapper">
      <input type="checkbox" id="`user-data-${id}`" v-model="allowedToSaveData" />
      <label for="`user-data-${id}`" class="ml-4 font-normal normal-case"
        >Zapisz mój adres e-mail i nazwę użytkownika w tej przeglądarce, aby automatycznie wypełnić
        oba pola podczas pisania kolejnych komentarzy.</label
      >
    </div>

    <button
      type="submit"
      class="w-full col-span-2 px-6 py-2 button button--outline border-color-accent-2"
      :disabled="!isValid"
    >
      Submit
    </button>
  </form>
</template>

<script>
import sanitizeHtml from "sanitize-html";
import { saveUserDataMixin } from "~/mixins/save-user-data.mixin";
import AppIcon from "~/components/Icon.vue";
import AppInput from "~/components/Input.vue";

export default {
  name: "CommentForm",
  components: { AppIcon, AppInput },
  mixins: [saveUserDataMixin],
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
      allowedToSaveData: false,
    };
  },

  mounted() {
    this.getUser();
  },

  methods: {
    onSubmit() {
      if (this.allowedToSaveData) {
        this.saveUser();
      }

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
