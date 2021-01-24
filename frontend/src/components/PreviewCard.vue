<template>
  <g-link v-if="url" :to="url" class="card" aria-label="Czytaj więcej">
    <g-image v-if="image" :src="image.url" :alt="image.alternativeText" class="mb-4"></g-image>

    <time class="block mt-4 text-base" :datetime="getFormattedDate(date).datetime">{{
      getFormattedDate(date).date
    }}</time>
    <span class="title">{{ title }}</span>
    <p class="my-4">{{ content }}</p>
  </g-link>
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
  }

.title {
  background-size: 0% 50%;
  @apply text-2xl;
  @apply inline bg-gradient-to-t from-color-accent-2 to-color-surface-2 bg-no-repeat transition-all duration-500 bg-left-bottom;
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
