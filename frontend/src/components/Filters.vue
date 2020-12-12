<template>
  <div class="filters">
    <g-link to="/" :class="{ ['button--dark']: isActive('/') }" class="button">All</g-link>
    <g-link
      v-for="filter in filters"
      :key="filter.id"
      :to="filter.path"
      :class="{ ['button--dark']: isActive(filter.path) }"
      class="button"
    >
      {{ filter.name }}
    </g-link>
  </div>
</template>

<script>
export default {
  name: "Filters",
  props: {
    filters: Array,
  },

  methods: {
    isActive(path) {
      return path === this.$route.path;
    }
  }
};
</script>

<style lang="scss" scoped>
.filters {
  @apply space-x-5;
  
  a {
    @apply py-1 px-4 uppercase text-sm;
  }
}
</style>
