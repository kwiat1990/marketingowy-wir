<template>
  <div id="app">
    <app-header></app-header>
    <main class="main">
      <router-view />
    </main>
    <app-footer></app-footer>
  </div>
</template>

<script>
import Footer from "./layouts/partials/Footer.vue";
import Icon from "~/components/Icon.vue";
import Header from "~/layouts/partials/Header.vue";
import {
  addFocusHandlers,
  removeFocusHandlers,
} from "~/utils/focus-events";

export default {
  components: {
    "app-footer": Footer,
    "app-header": Header,
    "app-icon": Icon,
  },

  mounted() {
    addFocusHandlers();
  },

  beforeDestroy() {
    removeFocusHandlers();
  },
};
</script>

<style lang="scss">
@import "src/assets/scss/base.scss";
.main {
  flex: 1 0 auto;
  @apply my-12;
}

#app {
  display: flex;
  flex-direction: column;
}
</style>
