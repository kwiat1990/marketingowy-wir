<template>
  <section class="card">
    <g-image
      v-if="entry.image.url"
      :src="getUrl(entry.image.url)"
      :alt="entry.image.alternativeText"
      class="mb-4"
    ></g-image>
    <time class="block mt-4 text-base" :datetime="getFormattedDate(entry.date).datetime">{{
      getFormattedDate(entry.date).date
    }}</time>
    <span class="title">{{ entry.title }}</span>
    <p class="my-4">{{ entry.content }}</p>
    <g-link v-if="entry.link" :to="entry.link" class="link-decor">Czytaj więcej</g-link>
  </section>
</template>

<script>
import getUrl from "~/utils/url-resolver";
import getFormattedDate from "~/utils/format-date";
import Waves from "~/layouts/partials/Waves.vue";
import ImageLoader from "~/components/ImageLoader.vue";

export default {
  name: "EntryPreview",
  components: { "app-image-loader": ImageLoader, "app-waves": Waves },
  props: {
    entry: Object,
  },
  data() {
    return {
      getUrl,
      getFormattedDate,
    };
  },
};
</script>

<style lang="scss" scoped>
img {
  max-width: calc(100% + theme("spacing.12"));
  @apply -mx-6;
  @apply sm:mx-auto sm:max-w-full;
}

.read-more {
  background-size: 100% 50%;
  @apply inline bg-gradient-to-r from-color-accent-3 to-color-accent-3 bg-no-repeat transition-all duration-500 bg-left-bottom;
  
}

.title {
  @apply text-2xl;
}

.card {
  @apply relative;
}
</style>
