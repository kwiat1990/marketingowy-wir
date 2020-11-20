6
<template>
  <header>
    <div class="bar"></div>

    <div class="container">
      <app-nav></app-nav>
      <transition-group name="fade">
        <button key="button" type="button" @click="showSearch = true">
          <app-icon icon="search"></app-icon>
        </button>
        <app-search key="search" v-if="showSearch" @on-close="showSearch = false"></app-search>
      </transition-group>
    </div>
  </header>
</template>

<script>
import Icon from "~/components/Icon.vue";
import Nav from "~/components/Nav.vue";
import Search from "~/components/Search.vue";

export default {
  components: {
    "app-icon": Icon,
    "app-nav": Nav,
    "app-search": Search,
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
  @apply bg-secondary border-b border-accent-primary text-primary;
}

.bar {
  background: linear-gradient(90deg, var(--primary-color), #8ed6fb 50%, #d32e9d);
  @apply relative h-1 z-10;
}

.container {
  @apply flex relative items-center justify-between;
}
</style>
