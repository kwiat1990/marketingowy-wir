<template>
  <nav class="flex">
    <button type="button" class="md:hidden" @click="$refs.overlay.open()">
      <app-icon icon="menu"></app-icon>
    </button>

    <app-overlay ref="overlay" class="bg-color-surface-2 md:bg-transparent" deactivateAbove="768px">
      <div class="inner">
        <g-link
          v-for="item in items"
          :key="item.path"
          :to="item.path"
          class="nav-link"
          exact-active-class="nav-link--is-active"
        >
          <span>{{ item.name }}</span>
        </g-link>
      </div>
    </app-overlay>
  </nav>
</template>

<script>
import AppIcon from "~/components/Icon.vue";
import AppOverlay from "~/components/Overlay.vue";

export default {
  name: "Nav",
  components: { AppIcon, AppOverlay },

  data() {
    return {
      shouldOpenNav: false,
    };
  },

  computed: {
    items() {
      return [
        {
          name: "Docs",
          path: "/docs",
        },
        {
          name: "Other",
          path: "/other",
        },
        {
          name: "Some",
          path: "/some",
        },
        {
          name: "About",
          path: "/about",
        },
      ];
    },
  },

  watch: {
    $route(to, from) {
      this.$refs.overlay.close();
    },
  },
};
</script>

<style lang="scss" scoped>
.inner {
  @screen md {
    @apply flex;
  }
}

.nav-link {
  @apply block relative text-3xl mb-12 text-center;

  @screen md {
    @apply text-lg mb-0 ml-4;
  }

  &::after {
    content: "";
    @apply absolute left-2/4 -bottom-2 block transition-opacity transform -translate-x-2/4 h-2 w-2 opacity-0 rounded-full bg-current;

    @screen md {
      @apply bottom-0 h-1 w-1;
    }
  }

  &--is-active {
    &::after {
      @apply delay-300 opacity-100;
    }
  }
}
</style>
