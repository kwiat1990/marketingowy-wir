<template>
  <div class="filters">
    <label class="button" for="filter-all" :class="{ ['button--dark']: selected.length <= 0 }">
      <input type="radio" id="filter-all" :checked="selected.length <= 0" @change="selected = []" />
      <span>All</span>
    </label>
    <label
      v-for="filter in filters"
      :key="filter.id"
      :for="filter.code"
      :class="{ ['button--dark']: selected.includes(filter.code) }"
      class="button"
    >
      <input type="checkbox" :id="filter.code" :value="filter.code" v-model="selected" />
      <span>{{ filter.name }}</span>
    </label>
  </div>
</template>

<script>
export default {
  name: "Filters",
  props: {
    filters: Array,
    preselected: Array,
    reset: Boolean,
  },

  data() {
    return {
      selected: [],
    };
  },

  created() {
    if (this.preselected) {
      this.selected = this.preselected;
    }
  },

  watch: {
    reset(newVal, oldVal) {
      this.selected = [];
    },

    selected(newVal, oldVal) {
      this.$emit("on-filter-change", newVal);
    },
  },
};
</script>

<style lang="scss" scoped>
.filters {
  @apply space-x-5;

  input {
    @apply sr-only;
  }

  label {
    @apply py-1 px-4 uppercase text-sm;
  }
}
</style>
