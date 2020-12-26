<template>
  <div>
    <button class="block w-full px-4 button md:hidden" @click="$refs.overlay.open()">
      Zobacz filtry
    </button>

    <app-overlay class="bg-color-surface-1 md:bg-transparent" deactivateAbove="768px" ref="overlay">
      <div class="filters">
        <g-link to="/" class="button" exact-active-class="button--dark">Wszystko</g-link>
        <g-link
          v-for="filter in filters"
          :key="filter.id"
          :to="filter.path"
          class="button"
          exact-active-class="button--dark"
        >
          {{ filter.name }}
        </g-link>
      </div>
    </app-overlay>
  </div>
</template>

<script>
import AppOverlay from "~/components/Overlay.vue";

export default {
  name: "Filters",
  components: { AppOverlay },
  props: {
    filters: Array,
  },

  watch: {
    $route(to, from) {
      this.$refs.overlay?.close();
    },
  },
};
</script>

<style lang="scss" scoped>
a {
  @apply py-2 px-4 mb-4 uppercase;

  @screen md {
    @apply py-1 px-4 mr-2 text-sm;
  }
}

.filters {
  @apply flex flex-col items-center;

  @screen md {
    @apply block;
  }
}
</style>
