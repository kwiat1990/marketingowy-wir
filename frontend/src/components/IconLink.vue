<template>
  <g-link :to="to" class="flex items-center font-bold">
    <app-icon v-bind="icon" disableHover></app-icon>
    <span class="ml-2">
      <slot>Wróć do strony głównej</slot>
    </span>
  </g-link>
</template>

<script>
import AppIcon from "~/components/Icon.vue";

export default {
  name: "IconLink",
  components: { AppIcon },
  props: {
    to: String,
    icon: {
      type: Object,
      default: () => {
        return { icon: "arrow-up", rotate: "270" };
      },
    },
  },
};
</script>
