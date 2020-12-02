<template>
  <div class="layout" :class="getLayout">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: "LayoutDefault",
  props: {
    twoCols: {
      type: Boolean,
      default: false,
    },
  },

  computed: {
    getLayout() {
      return {
        "layout--splited": this.twoCols,
      };
    },
  },
};
</script>

<style lang="scss" scoped>
.layout {
   @apply px-6 lg:px-20 max-w-screen-2xl mx-auto;
   
  &--splited {
    @apply grid gap-12 sm:gap-6 md:gap-16 xl:gap-20 sm:grid-cols-2 lg:grid-cols-3;
  }
}
</style>
