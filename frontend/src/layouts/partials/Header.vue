6
<template>
  <header>
    <div class="inner">
      <div class="bar"></div>
      <div class="container">
        <g-link to="/" class="brand">Marketingowy wir</g-link>
        <app-nav class="ml-auto mr-8"></app-nav>
        <transition-group name="fade">
          <button key="button" type="button" @click="showSearch = true">
            <app-icon icon="search"></app-icon>
          </button>
          <app-search key="search" v-if="showSearch" @on-close="showSearch = false"></app-search>
        </transition-group>
      </div>
    </div>
  </header>
</template>

<script>
import AppIcon from "~/components/Icon.vue";
import AppNav from "~/components/Nav.vue";
import AppSearch from "~/components/Search.vue";

export default {
  name: "Header",
  components: {
    AppIcon,
    AppNav,
    AppSearch,
  },

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
  transition: opacity 0.3s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.inner {
  @apply overflow-hidden;
}

.bar {
  background: linear-gradient(90deg, var(--primary-color), #8ed6fb 50%, #d32e9d);
  @apply relative z-10 h-1;
}

.brand {
  @apply block text-2xl font-bold text-center;
}

.container {
  @apply relative flex items-center justify-between max-w-none py-4;
}
</style>
