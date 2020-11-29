<template>
  <div class="prose layout" :class="getLayout">
    <main>
      <slot />
    </main>
    <aside v-if="!hideSidebar">
      <ul>
        <li v-for="category in $static.categories.edges" :key="category.node.id">
          <g-link :to="category.node.slug">{{ category.node.name }}</g-link>
        </li>
      </ul>
    </aside>
  </div>
</template>

<static-query>
query {
  categories: allStrapiCategory(
    sortBy: "name", order: ASC, 
    filter: { articles: { title: { exists: true }}}
  ) {
    edges {
      node {
        id
        name
        slug
      }
    }
  }
  metadata {
    siteName
  }
}
</static-query>

<script>
export default {
  name: "LayoutDefault",
  props: {
    twoCols: {
      type: Boolean,
      default: false,
    },
    hideSidebar: {
      type: Boolean,
      default: false,
    },
  },

  computed: {
    getLayout() {
      return {
        "layout--splited": this.twoCols,
        "layout--no-sidebar": this.hideSidebar,
      };
    },
  },
};
</script>

<style lang="scss" scoped>
.layout {
  @apply px-6 mx-auto max-w-screen-lg md:grid md:gap-8;

  @screen md {
    grid-template-columns: 5fr 2fr;
  }

  &--no-sidebar {
    @apply block;
  }

  &--splited {
    main {
      @apply lg:grid lg:gap-8 lg:grid-cols-2;
    }
  }

  aside {
    @apply bg-accent-primary;
  }
}
</style>
