<template>
  <div class="prose layout" :class="getLayout">
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
.prose {
  @apply px-6 lg:px-20 max-w-screen-xl mx-auto;
}

.layout {
  &--splited {
    @apply px-6 mx-auto max-w-screen-lg md:grid md:gap-8 md:grid-cols-2;
  }
}
</style>
