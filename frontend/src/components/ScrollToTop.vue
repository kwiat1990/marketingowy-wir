<template>
  <button class="p-3 text-xs" @click="scrollTop">
    <app-icon icon="arrow-up" rotate="90" class="animate-bounce mr-2"></app-icon>
    Do góry!
  </button>
</template>

<script>
import Icon from "~/components/Icon.vue";

export default {
  name: "ScrollToTop",
  components: {
    "app-icon": Icon,
  },

  methods: {
    scrollTop() {
      window.scrollTo(0, 0);
    },
  },
};
</script>

<style></style>
