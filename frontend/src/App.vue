<template>
  <div id="app">
    <Header />
    <main class="main">
      <transition>
        <router-view />
      </transition>
    </main>
    <footer>Footer</footer>
  </div>
</template>

<script lang="ts">
import Header from "~/components/Header/Header.vue";

export default {
  components: {
    Header,
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
}

#app {
  display: flex;
  flex-direction: column;
}

.main {
  flex: 1 0 auto;
}
</style>
