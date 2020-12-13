<template>
  <div id="app">
    <app-header></app-header>
    <main class="main">
      <!-- <transition name="fade" mode="out-in" appear> -->
        <router-view />
      <!-- </transition> -->
    </main>
    <app-footer></app-footer>
  </div>
</template>

<script>
import Footer from "./layouts/partials/Footer.vue";
import Icon from "~/components/Icon.vue";
import Header from "~/layouts/partials/Header.vue";

export default {
  components: {
    "app-footer": Footer,
    "app-header": Header,
    "app-icon": Icon,
  },
};
</script>

<style lang="scss">
@import "src/assets/scss/base.scss";

// .fade-enter-active,
// .fade-leave-active {
//   transition: opacity 0.1s;
// }

// .fade-enter,
// .fade-leave-to {
//   opacity: 0;
// }

.main {
  flex: 1 0 auto;
  @apply my-12;
}

#app {
  display: flex;
  flex-direction: column;
}
</style>
