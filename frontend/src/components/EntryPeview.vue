<template>
  <g-link v-if="entry.link" :to="entry.link" class="card" :style="{['borderColor']: getRandomColor}">
    <g-image
      v-if="entry.image.url"
      :src="getUrl(entry.image.url)"
      :alt="entry.image.alternativeText"
      class="mb-4"
    ></g-image>
    <span class="title">{{ entry.title }}</span>
    <app-rich-content :content="entry.content" class="mt-4"></app-rich-content>
    <time class="block mt-4 text-base" :datetime="getFormattedDate(entry.date).datetime">{{
      getFormattedDate(entry.date).date
    }}</time>
  </g-link>
</template>

<script>
import getUrl from "~/utils/url-resolver";
import getFormattedDate from "~/utils/format-date";
import RichContent from "~/components/RichContent.vue";
import Waves from "~/layouts/partials/Waves.vue";

export default {
  name: "EntryPreview",
  components: { "app-rich-content": RichContent, "app-waves": Waves },
  props: {
    entry: Object,
  },
  data() {
    return {
      getUrl,
      getFormattedDate
    };
  },

  computed: {
    getRandomColor() {
      return "#" + Math.floor(Math.random() * 16777215).toString(16);
    },
  },
};
</script>

<style lang="scss" scoped>
.title {
  background-size: 0 50%;
  @apply inline text-2xl bg-gradient-to-r from-accent-tertiary to-accent-tertiary bg-no-repeat transition-all duration-500 bg-left-bottom;
}

.card {
  @apply relative border-t-8 border-solid overflow-hidden;

  &:hover {
    .title {
      background-size: 100% 50%;
    }
  }
}
</style>
