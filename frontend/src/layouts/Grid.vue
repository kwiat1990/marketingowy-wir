<template>
  <div class="container container--fixed layout" :class="[fullWidhtCol && 'layout--extra-row']">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: "GridLayout",
  props: {
    fullWidhtCol: Boolean,
    default: false,
  },
};
</script>

<style lang="scss" scoped>
.layout {
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  @apply grid gap-12 sm:gap-6 md:gap-16 xl:gap-20;

  &--extra-row {
    @apply place-items-start;

    > :first-child {
      @apply col-span-full;
    }
  }
}
</style>
