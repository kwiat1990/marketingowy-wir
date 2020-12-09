<template>
  <div class="filters">
    <input type="radio" id="filter-all" :checked="selected.length <= 0" @change="selected = []" />
    <label for="filter-all">
      <span>All</span>
    </label>
    <template v-for="filter in filters">
      <input
        type="checkbox"
        :id="filter.code"
        :value="filter.code"
        v-model="selected"
        :key="'oko' + filter.id"
      />
      <label :key="filter.id" :for="filter.code">
        <span>{{ filter.name }}</span>
      </label>
    </template>
  </div>
</template>

<script>
export default {
  name: "Filters",
  props: {
    filters: Array,
    preselected: Array,
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
    @apply opacity-0 invisible absolute;
  }

  input:checked + label {
    @apply bg-accent-secondary bg-gradient text-accent-primary;
  }

  label {
    @apply rounded-full py-2 px-4 border-2 border-accent-secondary cursor-pointer transition-all duration-300 uppercase text-sm hover:bg-gradient;
  }
}
</style>
