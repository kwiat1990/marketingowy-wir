6
<template>
  <header>
    <div class="inner">
      <div class="bar"></div>
      <div class="container">
        <g-link to="/" class="brand">Marketingowy wir</g-link>
        <app-nav class="mr-8"></app-nav>
        <app-transition group>
          <button key="button" type="button" @click="showSearch = true">
            <app-icon icon="search"></app-icon>
          </button>
          <app-search key="search" v-if="showSearch" @on-close="showSearch = false"></app-search>
        </app-transition>
      </div>
    </div>
  </header>
</template>

<script>
import AppIcon from "~/components/Icon.vue";
import AppNav from "~/components/Nav.vue";
import AppSearch from "~/components/Search.vue";
import { FadeTransition as AppTransition} from "vue2-transitions";

export default {
  name: "Header",
  components: {
    AppIcon,
    AppNav,
    AppSearch,
    AppTransition,
  },

  data() {
    return {
      showSearch: false,
    };
  },
};
</script>

<style lang="scss" scoped>
.inner {
  @apply overflow-hidden;
}

.bar {
  background: linear-gradient(90deg, var(--primary-color), #8ed6fb 50%, #d32e9d);
  @apply relative z-10 h-1;
}

.brand {
  @apply block text-2xl font-bold flex-auto; 
}

.container {
  @apply relative flex items-center max-w-none py-4;
}
</style>
