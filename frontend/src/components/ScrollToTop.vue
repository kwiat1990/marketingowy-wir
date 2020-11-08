<template>
  <button class="p-3 border border-accent-primary rounded text-xs" @click="scrollTop">
    <app-icon icon="arrow-up" rotate="90"></app-icon>
    Do góry!
  </button>
</template>

<script>
import Icon from "~/components/Icon.vue";

export default {
  name: "ScrollToTop",
  components: {
    "app-icon": Icon
  },

  methods: {
    scrollTop() {
      window.scrollTo(0, 0);
    },
  },
};
</script>

<style></style>
