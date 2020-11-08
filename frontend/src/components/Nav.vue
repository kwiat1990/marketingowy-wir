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
          name: "None",
          href: "/none",
        },
      ];
    },
  },
};
</script>

<style lang="scss" scoped>
.nav-link {
  position: relative;
  @apply block py-3;

  &--is-active {
    @apply text-accent-primary;

    &::after {
      content: "";
      top: 100%;
      @apply block absolute inset-x-0 bg-dark h-px;
    }
  }
}
</style>
