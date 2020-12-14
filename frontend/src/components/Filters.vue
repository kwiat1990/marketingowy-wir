<template>
  <div>
    <button class="block w-full px-4 button md:hidden" @click="toggleFilters">Zobacz filtry</button>

    <div class="filters" ref="filters">
      <button
        type="button"
        class="mb-16 md:hidden"
        aria-label="zamknij filtry"
        @click="toggleFilters"
      >
        <app-icon icon="close"></app-icon>
      </button>

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
  </div>
</template>

<script>
import AppIcon from "~/components/Icon.vue";
import resolveConfig from "tailwindcss/resolveConfig";
import tailwindConfig from "../../tailwind.config.js";

const config = resolveConfig(tailwindConfig);

export default {
  name: "Filters",
  components: { AppIcon },
  props: {
    filters: Array,
  },

  mounted() {
    this.resetStylingOnResize();
  },

  methods: {
    toggleFilters() {
      const el = this.$refs.filters;
      const className = "filters--is-active";
      if (el) {
        if (el.classList.contains(className)) {
          document.body.classList.remove("overflow-hidden");
          el.classList.remove(className);
        } else {
          document.body.classList.add("overflow-hidden");
          el.classList.add(className);
        }
      }
    },

    resetStylingOnResize() {
      // The styles must be reset in case a user changes the size of the browser window while the filter overlay is open
      const mediaqueryList = window.matchMedia(`(min-width: ${config.theme.screens.md})`);
      mediaqueryList.addEventListener("change", (event) => {
        if (event.matches) {
          this.toggleFilters();
        }
      });
    },
  },

  watch: {
    $route(to, from) {
      this.toggleFilters();
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
  @apply flex flex-col items-center invisible opacity-0 bg-color-surface-1 fixed inset-0 z-50 py-3 px-6 transition-all duration-300;

  &--is-active {
    @apply opacity-100 visible;
  }

  @screen md {
    @apply block static p-0 inset-auto visible opacity-100;
  }
}
</style>
