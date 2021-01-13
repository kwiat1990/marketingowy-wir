<template>
  <div class="comment" :class="{ ['comment--from-user']: hasUser }">
    <span v-if="hasUser" class="px-2 py-1 mr-2 text-xs uppercase rounded-full bg-color-surface-3"
      >Autor</span
    >
    <span class="mr-2 text-base font-bold">{{ author }}</span>
    <time class="block mb-2 text-base text-color-accent-2 sm:inline sm:mb-0" :datetime="getFormattedDate(date).datetime">{{
      getFormattedDate(date).date
    }}</time>
    <app-rich-content :content="content"></app-rich-content>
  </div>
</template>

<script>
import AppRichContent from "~/components/RichContent.vue";
import getFormattedDate from "~/utils/format-date";

export default {
  name: "Comment",
  props: {
    author: String,
    content: String,
    date: String,
    hasUser: Boolean,
  },
  components: { AppRichContent },

  data() {
    return {
      getFormattedDate,
    };
  },
};
</script>
