<template>
  <svg
    class="waves"
    :class="classes"
    :style="styles"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    viewBox="0 24 150 28"
    preserveAspectRatio="none"
    shape-rendering="auto"
  >
    <defs>
      <path
        id="gentle-wave"
        d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z"
        fill="currentColor"
      ></path>
    </defs>
    <g class="parallax">
      <use xlink:href="#gentle-wave" x="48" y="0" opacity="0.7" />
      <use xlink:href="#gentle-wave" x="48" y="3" opacity="0.5" />
      <use xlink:href="#gentle-wave" x="48" y="5" opacity="0.3" />
      <use xlink:href="#gentle-wave" x="48" y="7" opacity="0.9" />
    </g>
  </svg>
</template>

<script>
export default {
  name: "Waves",
  props: {
    animate: Boolean,
    invert: Boolean,
    color: String,
  },

  computed: {
    classes() {
      return {
        transform: this.invert,
        "rotate-180": this.invert,
        "waves--is-animated": this.animate,
      };
    },
    styles() {
      return {
        color: this.color || "#2f2f2f"
      };
    },
  },
};
</script>

<style lang="scss" scoped>
.waves {
  @apply w-full text-inherit transition-colors duration-300 h-2 max-h-2 md:max-h-3 md:h-3;

  &--is-animated {
    .parallax {
      use {
        backface-visibility: hidden;
        animation: move-forever 25s cubic-bezier(0.55, 0.5, 0.45, 0.5) infinite;

        @for $i from 1 through 4 {
          &:nth-child(#{$i}) {
            animation-delay: -#{$i + 2}s;
            @if $i == 4 {
              animation-duration: 20s;
            } @else {
              animation-duration: #{4 + ($i * 3)}s;
            }
          }
        }
      }
    }
  }
}

@keyframes move-forever {
  0% {
    transform: translate3d(-90px, 0, 0);
  }
  100% {
    transform: translate3d(85px, 0, 0);
  }
}
</style>
