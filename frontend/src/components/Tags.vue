<template>
  <ul class="tags">
    <li v-for="tag in tags" :key="tag.id">
      <g-link to="/">{{ tag.name }}</g-link>
    </li>
  </ul>
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
  @apply list-none space-x-4;

  li {
    @apply inline-block p-1 border;
  }
}
</style>
