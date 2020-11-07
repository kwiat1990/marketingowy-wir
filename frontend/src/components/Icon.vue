<template>
  <svg class="icon">
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
  height: 1.5rem;
  width: 1.5rem;
}
</style>
