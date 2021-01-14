<template>
  <figure>
    <g-image :src="srcset" :alt="altText"></g-image>
    <figcaption v-if="caption">
      {{ caption }}
    </figcaption>
  </figure>
</template>

<script>
export default {
  name: "ImageFigure",
  props: {
    altText: String,
    caption: String,
    srcset: Object,
  },
};
</script>

<style lang="scss" scoped>
img {
  max-width: calc(100% + #{theme("spacing.12")});
  @apply -mx-6 sm:mx-auto sm:max-w-full;
}

figure {
  @apply my-10;
}

figcaption {
  @apply max-w-3xl mx-auto text-center text-base;
}
</style>
