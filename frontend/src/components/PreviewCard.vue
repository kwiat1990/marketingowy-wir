<template>
  <g-link
    v-if="url"
    :to="url"
    :class="{ ['card--is-latest']: isLatest }"
    aria-label="Czytaj więcej"
    class="card"
  >
    <div class="card__image-wrapper" v-if="image">
      <g-image :src="image.url" :alt="image.alternativeText"></g-image>
    </div>

    <div class="card__content">
      <time class="block mt-4 text-base" :datetime="getFormattedDate(date).datetime">{{
        getFormattedDate(date).date
      }}</time>
      <span class="card__title">{{ title }}</span>
      <p class="my-4">{{ content }}</p>
    </div>
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

  &__title {
    background-size: 0% 50%;
    @apply text-2xl;
    @apply inline bg-gradient-to-t from-color-accent-2 to-color-surface-2 bg-no-repeat transition-all duration-500 bg-left-bottom;
  }

  &:hover {
    .card__title {
      background-size: 100% 50%;
    }
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
