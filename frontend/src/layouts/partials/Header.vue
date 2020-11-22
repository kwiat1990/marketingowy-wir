6
<template>
  <header>
    <div class="bar"></div>

    <div class="container">
      <g-link to="/" class="brand">Marketingowy wir</g-link>

      <app-nav class="ml-8 mr-auto"></app-nav>

      <transition-group name="fade">
        <button key="button" type="button" @click="showSearch = true">
          <app-icon icon="search"></app-icon>
        </button>

        <app-search key="search" v-if="showSearch" @on-close="showSearch = false"></app-search>
      </transition-group>
    </div>
    <app-waves inverted></app-waves>
  </header>
</template>

<script>
import Icon from "~/components/Icon.vue";
import Nav from "~/components/Nav.vue";
import Search from "~/components/Search.vue";
import Waves from "~/layouts/partials/Waves.vue";

export default {
  components: {
    "app-icon": Icon,
    "app-nav": Nav,
    "app-search": Search,
    "app-waves": Waves,
  },
  name: "Header",

  data() {
    return {
      showSearch: false,
    };
  },
};
</script>

<style lang="scss" scoped>
.fade-enter-active,
.fade-leave-active {
  transition: transform 0.3s;
}

.fade-enter,
.fade-leave-to {
  transform: translateY(-100%);
}

header {
  background: var(--section-gadient);
  @apply bg-secondary text-primary;
}

.bar {
  background: linear-gradient(90deg, var(--primary-color), #8ed6fb 50%, #d32e9d);
  @apply relative z-10 h-1;
}

.brand {
  @apply block text-2xl font-bold text-center;
}

.container {
  @apply relative flex items-center justify-between;
}
</style>
