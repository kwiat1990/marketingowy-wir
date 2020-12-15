<template>
  <svg class="icon" :class="{ [`rotate-${this.rotate}`]: this.rotate, transform: this.rotate }">
    <use :xlink:href="`#${iconCode}`"></use>
  </svg>
</template>

<script>
export default {
  name: "Icon",
  props: {
    icon: {
      type: String,
      required: true,
    },
    rotate: String,
  },

  computed: {
    iconCode() {
      // get a single icon and its id from the icons directory using webpack require function
      return require(`../assets/icons/${this.icon}.svg`)?.default?.id;
    },
  },
};
</script>

<style lang="scss" scoped>
.icon {
  height: 1.5em;
  width: 1.5em;
  @apply inline-block transition-transform duration-300;

  &:hover {
    @apply transform scale-110;
  }
}
</style>
