<template>
  <section class="card">
    <g-image
      v-if="image"
      :src="image.url"
      :alt="image.alternativeText"
      class="mb-4"
    ></g-image>
    <time class="block mt-4 text-base" :datetime="getFormattedDate(date).datetime">{{
      getFormattedDate(date).date
    }}</time>
    <span class="title">{{ title }}</span>
    <p class="my-4">{{ content }}</p>
    <g-link v-if="url" :to="url" class="link-decor">Czytaj więcej</g-link>
  </section>
</template>

<script>
import getFormattedDate from "~/utils/format-date";

export default {
  name: "PreviewCard",
  props: {
    content: String,
    date: String,
    image: Object,
    title: String,
    url: String,
  },
  
  data() {
    return {
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
