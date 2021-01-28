<template>
  <transition name="fade">
    <div
      v-show="showModal || isInactive"
      :class="{ ['overlay--is-active']: !isInactive, ['overlay--is-open']: showModal }"
      class="overlay"
      role="dialog"
      ref="overlay"
    >
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
  </transition>
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
      isInactive: false,
      showModal: false,
    };
  },

  mounted() {
    const mediaqueryList = window.matchMedia(`(min-width: ${this.deactivateAbove})`);
    mediaqueryList.addEventListener("change", this.removeStyles);
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
      this.showModal = false;
      document.body.classList.remove("overflow-hidden");
    },

    open() {
      this.$emit("on-open");
      this.showModal = true;
      if (!this.isInactive) {
        document.body.classList.add("overflow-hidden");
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.close-button {
  @apply block mb-16 mx-auto;
}

.overlay {
  &--is-active {
    @apply hidden;
  }

  &--is-open {
    @apply fixed block top-1 left-0 right-0 bottom-0 z-50 py-3 px-6;
  }
}
</style>
