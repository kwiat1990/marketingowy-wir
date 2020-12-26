<template>
  <svg class="icon" :class="{ [`rotate-${this.rotate}`]: this.rotate, transform: this.rotate }">
    <use :xlink:href="`#${iconComponent}`"></use>
  </svg>
</template>

<script>
import arrow from "~/assets/icons/arrow-up.svg";
import close from "~/assets/icons/close.svg";
import facebook from "~/assets/icons/facebook.svg";
import instagram from "~/assets/icons/instagram.svg";
import menu from "~/assets/icons/menu.svg";
import search from "~/assets/icons/search.svg";

const icons = {
  "arrow-up": arrow,
  close,
  facebook,
  instagram,
  menu,
  search,
};
export default {
  name: "Icon",
  props: {
    icon: {
      type: String,
      required: true
    },
    rotate: String,
  },
  computed: {
    iconComponent() {
      return icons[this.icon]?.id;
    },
  },
};
</script>

<style lang="scss" scoped>
.icon {
  height: 1.5em;
  width: 1.5em;
  @apply inline-block transition-transform duration-300;

  &:hover {
    @apply transform scale-110;
  }
}
</style>
