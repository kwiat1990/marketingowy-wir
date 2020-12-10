<template>
  <div class="tags">
    <g-link v-for="tag in tags" :key="tag.id" :to="tag.slug" class="px-2 button button--dark">{{
      tag.name
    }}</g-link>
  </div>
</template>

<script>
export default {
  name: "Tags",
  props: {
    tags: Array,
    required: true,
  },
};
</script>

<style lang="scss" scoped>
.tags {
  @apply flex space-x-2;
}
</style>
