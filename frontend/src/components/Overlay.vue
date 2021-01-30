<template>
  <component :is="component">
    <div
      v-show="show || !isActivated"
      :class="[
        isActivated ? 'overlay--is-active' : 'overlay--is-deactivated',
        show && 'overlay--is-open',
      ]"
      class="overlay"
      role="dialog"
      ref="overlay"
    >
      <button
        v-if="isActivated"
        type="button"
        aria-label="zamknij overlay"
        class="close-button"
        @click="close"
      >
        <app-icon icon="close"></app-icon>
      </button>
      <slot></slot>
    </div>
  </component>
</template>

<script>
import AppIcon from "~/components/Icon.vue";
import { FadeTransition as AppTransition} from "vue2-transitions";

export default {
  name: "Overlay",
  components: {
    AppTransition,
    AppIcon,
  },
  props: {
    deactivateAbove: String,
  },

  data() {
    return {
      isActivated: false,
      show: false,
    };
  },

  mounted() {
    const mediaqueryList = window.matchMedia(`(min-width: ${this.deactivateAbove})`);
    mediaqueryList.addEventListener("change", this.removeStyles);
    this.isActivated = !mediaqueryList.matches;
  },

  beforeDestroy() {
    window.removeEventListener("change", this.removeStyles);
  },

  methods: {
    removeStyles(event) {
      // The styles must be reset in case a user changes the size of the browser window while the filter overlay is open
      if (event.matches) {
        this.close();
      }
      this.isActivated = !event.matches;
    },

    // Public methods to use outside component:
    close() {
      this.$emit("on-close");
      this.show = false;
      document.body.classList.remove("overflow-hidden");
    },

    open() {
      this.$emit("on-open");
      this.show = true;
      if (this.isActivated) {
        document.body.classList.add("overflow-hidden");
      }
    },
  },

  computed: {
    component() {
      return this.isActivated ? "app-transition" : "div";
    },
  },
};
</script>

<style lang="scss" scoped>
.close-button {
  @apply block mb-16 mx-auto;
}

.overlay {
  &--is-active {
    @apply fixed top-1 left-0 right-0 bottom-0 z-50 py-3 px-6;
  }

  &--is-deactivated {
    @apply block;
  }

  &--is-open {
    // @apply fixed block top-1 left-0 right-0 bottom-0 z-50 py-3 px-6;
  }
}
</style>
