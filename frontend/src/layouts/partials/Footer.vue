<template>
  <footer>
    <app-icon icon="bell" class="inline-block"></app-icon>
    <app-icon icon="bell" class="inline-block"></app-icon>
    <p class="border-t border-solid border-primary pt-4 mt-4 text-xs">
      Copyright © {{ new Date().getFullYear() }} Marketingowy Wir. Wszelkie prawa zastrzeżone.
    </p>
  </footer>
</template>

<script>
import Icon from "~/components/Icon.vue";

export default {
  name: "Footer",
  components: {
    "app-icon": Icon,
  },
};
</script>

<style scoped>
footer {
  background-color: var(--bg-secondary);
  color: var(--bg-primary);
  text-align: center;
  @apply .p-4;
}
</style>
