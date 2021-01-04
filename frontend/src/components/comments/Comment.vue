<template>
  <div>
    <span class="mr-2 text-base font-bold">{{ author }}</span>
    <time class="text-base text-color-accent-2" :datetime="getFormattedDate(date).datetime">{{ getFormattedDate(date).date }}</time>
    <app-rich-content :content="content"></app-rich-content>
  </div>
</template>

<script>
import AppRichContent from "~/components/RichContent.vue";
import getFormattedDate from "~/utils/format-date";

export default {
  name: "Comment",
  props: ["author", "content", "date"],
  components: { AppRichContent },
  
  data() {
    return {
      getFormattedDate,
    };
  },
};
</script>
