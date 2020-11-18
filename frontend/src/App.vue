<template>
  <div id="app">
    <app-header></app-header>

    <main>
      <transition>
        <router-view />
      </transition>
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
  created() {
    // const s1 = performance.now();
    // console.log(getComputedStyle(document.documentElement).getPropertyValue("--mq"));
    // const s2 = performance.now();
    // console.log(s2 - s1);
  },
};
</script>

<style lang="scss">
@import "src/assets/scss/variables";

html,
body,
#app {
  height: 100%;
}

body {
  background-color: var(--bg);
  min-height: 100%;
  scroll-behavior: smooth;

  // TODO adjust theming options
  @media (prefers-color-scheme: light) {
    body {
      background: white;
      color: black;
    }
  }

  @media (prefers-color-scheme: dark) {
    body {
      background: black;
      color: white;
    }
  }
}

main {
  flex: 1 0 auto;
}

#app {
  display: flex;
  flex-direction: column;
}
</style>
