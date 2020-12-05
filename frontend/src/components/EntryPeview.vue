<template>
  <g-link v-if="entry.link" :to="entry.link" class="card">
    <g-image
      v-if="entry.image.url"
      :src="getUrl(entry.image.url)"
      :alt="entry.image.alternativeText"
      :style="{ ['borderColor']: getRandomColor }"
      class="mb-4"
    ></g-image>
    <span class="title">{{ entry.title }}</span>
    <p class="mt-4">{{ entry.content }}</p>
    <time class="block mt-4 text-base" :datetime="getFormattedDate(entry.date).datetime">{{
      getFormattedDate(entry.date).date
    }}</time>
  </g-link>
</template>

<script>
import getUrl from "~/utils/url-resolver";
import getFormattedDate from "~/utils/format-date";
import Waves from "~/layouts/partials/Waves.vue";

export default {
  name: "EntryPreview",
  components: { "app-waves": Waves },
  props: {
    entry: Object,
  },
  data() {
    return {
      getUrl,
      getFormattedDate,
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
img {
  max-width: calc(100% + theme("spacing.12"));
  @apply -mx-6 border-t-8 border-solid sm:mx-auto sm:max-w-full;
}

.title {
  background-size: 0 50%;
  @apply inline text-2xl bg-gradient-to-r from-accent-tertiary to-accent-tertiary bg-no-repeat transition-all duration-500 bg-left-bottom;
}

.card {
  @apply relative;

  &:hover {
    .title {
      background-size: 100% 50%;
    }
  }
}
</style>
