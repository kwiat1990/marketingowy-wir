<template>
  <div class="tags">
    <g-link v-for="tag in tags" :key="tag.id" :to="tag.path" class="px-2 mx-2 mb-2 button">{{
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
  @apply text-center -mb-2;
}
</style>
