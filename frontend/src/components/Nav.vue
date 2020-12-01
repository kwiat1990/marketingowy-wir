<template>
  <nav class="flex space-x-5">
    <g-link
      v-for="item in items"
      :key="item.href"
      :to="item.href"
      class="nav-link"
      exact-active-class="nav-link--is-active"
    >
      <span>{{ item.name }}</span>
    </g-link>
  </nav>
</template>

<script>
export default {
  name: "Nav",

  computed: {
    items() {
      return [
        {
          name: "Docs",
          href: "/docs",
        },
        {
          name: "Other",
          href: "/other",
        },
        {
          name: "Some",
          href: "/some",
        },
        {
          name: "About",
          href: "/about",
        },
      ];
    },
  },
};
</script>

<style lang="scss" scoped>
.nav-link {
  @apply block relative py-3;

  &::after {
    content: "";
    @apply absolute left-2/4 bottom-2 block transition-opacity transform -translate-x-2/4 h-1 w-1 opacity-0 rounded-full bg-current;
  }

  &--is-active {
    &::after {
      @apply delay-300 opacity-100;
    }
  }
}
</style>
