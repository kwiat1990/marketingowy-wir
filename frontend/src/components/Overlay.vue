<template>
  <div class="overlay" :class="{ ['overlay--is-active']: !isInactive }" role="dialog" ref="overlay">
    <button
      v-if="!isInactive"
      type="button"
      aria-label="zamknij overlay"
      class="close-button"
      @click="close"
    >
      <app-icon icon="close"></app-icon>
    </button>
    <slot></slot>
  </div>
</template>

<script>
import AppIcon from "~/components/Icon.vue";

export default {
  name: "Overlay",
  components: {
    AppIcon,
  },
  props: {
    deactivateAbove: String,
  },

  data() {
    return {
      openClassName: "overlay--is-open",
      overlayRef: null,
      isInactive: false,
    };
  },

  mounted() {
    const mediaqueryList = window.matchMedia(`(min-width: ${this.deactivateAbove})`);
    mediaqueryList.addEventListener("change", this.removeStyles);
    this.overlayRef = this.$refs.overlay;
    this.isInactive = mediaqueryList.matches;
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
      this.isInactive = event.matches;
    },

    // Public methods to use outside component:
    close() {
      this.$emit("on-close");
      if (this.overlayRef) {
        document.body.classList.remove("overflow-hidden");
        this.overlayRef.classList.remove(this.openClassName);
      }
    },

    open() {
      this.$emit("on-open");
      if (this.overlayRef && !this.isInactive) {
        document.body.classList.add("overflow-hidden");
        this.overlayRef.classList.add(this.openClassName);
      }
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
    @apply invisible opacity-0 duration-300 fixed inset-0 z-50 py-3 px-6;
    transition-property: opacity, visibility;
  }

  &--is-open {
    @apply opacity-100 visible;
  }
}
</style>
