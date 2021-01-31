<template>
  <article :class="[isLatest && 'card--is-latest']" class="card">
    <g-link v-if="image" :to="url" class="card__image-wrapper" aria-label="Czytaj artykuł">
      <g-image :src="image.url" :alt="image.alternativeText"></g-image>
    </g-link>

    <div class="card__content">
      <time class="block mt-4 text-base" :datetime="getFormattedDate(date).datetime">{{
        getFormattedDate(date).date
      }}</time>
      <span class="card__title">{{ title }}</span>
      <p class="my-4">{{ content }}</p>
      <g-link :to="url" class="px-4 button button--outline">Czytaj artykuł</g-link>
    </div>
  </article>
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
    isLatest: Boolean,
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

.card {
  @apply relative;

  &__content {
    @apply mb-4;
  }
}

.card--is-latest {
  @screen lg {
    @apply grid grid-cols-2;
  }

  img {
    @screen md {
      @apply object-cover h-full w-full;
    }
  }

  .card__image-wrapper {
    @screen lg {
      @apply order-1;
    }
  }

  .card__content {
    @screen md {
      @apply bg-color-surface-2 p-12 mb-0;
    }
  }

  .card__title {
    @screen md {
      @apply text-4xl;
    }
  }
}
</style>
