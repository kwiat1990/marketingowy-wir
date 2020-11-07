<template>
  <div id="app">
    <app-header />

    <main class="main">
      <transition>
        <router-view />
      </transition>
    </main>

    <div>
      <app-icon icon="x"></app-icon>
      <app-icon icon="archive"></app-icon>
      <app-icon icon="bell"></app-icon>
    </div>

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
  font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
    Arial, sans-serif;
  line-height: 1.5;
  margin: 0;
  padding: 0;
  min-height: 100%;

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

#app {
  display: flex;
  flex-direction: column;
}

.main {
  flex: 1 0 auto;
}
</style>
