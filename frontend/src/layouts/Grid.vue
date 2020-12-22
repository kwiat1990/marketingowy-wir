<template>
  <div class="container container--fixed layout">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: "GridLayout",
  props: {
    colNum: {
      type: Number,
      default: 1,
    },
  },
};
</script>

<style lang="scss" scoped>
.layout {
   @apply grid gap-12 sm:gap-6 md:gap-16 xl:gap-20 sm:grid-cols-2 lg:grid-cols-3;
}
</style>
