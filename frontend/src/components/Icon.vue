<template>
  <svg
    class="icon"
    :class="{
      [`rotate-${this.rotate}`]: this.rotate,
      ['icon--has-hover']: !disableHover,
      transform: this.rotate,
    }"
  >
    <use :xlink:href="`#${iconComponent}`"></use>
  </svg>
</template>

<script>
import arrow from "~/assets/icons/arrow-up.svg";
import close from "~/assets/icons/close.svg";
import email from "~/assets/icons/email.svg";
import facebook from "~/assets/icons/facebook.svg";
import instagram from "~/assets/icons/instagram.svg";
import lock from "~/assets/icons/lock.svg";
import menu from "~/assets/icons/menu.svg";
import reply from "~/assets/icons/back-left.svg";
import search from "~/assets/icons/search.svg";
import user from "~/assets/icons/user.svg";

const icons = {
  "arrow-up": arrow,
  close,
  email,
  facebook,
  instagram,
  lock,
  menu,
  "back-left": reply,
  search,
  user,
};
export default {
  name: "Icon",
  props: {
    icon: {
      type: String,
      required: true,
    },
    rotate: String,
    disableHover: {
      type: Boolean,
      default: false,
    },
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
  @apply inline-block;

  &--has-hover {
    @apply transition-transform duration-300;

    &:hover {
      @apply transform scale-110;
    }
  }
}
</style>
