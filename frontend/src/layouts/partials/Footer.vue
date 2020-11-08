<template>
  <footer>
    <div class="container">
      <a
        v-for="icon in icons"
        :key="icon.text"
        :href="icon.href"
        :title="icon.text"
        class="even:ml-4"
      >
        <app-icon :icon="icon.code"></app-icon>
      </a>

      <p>
        Copyright © {{ new Date().getFullYear() }} Marketingowy Wir. Wszelkie prawa zastrzeżone.
      </p>

      <app-scroll-to-top v-if="this.hasScrollbar" class="mt-5"></app-scroll-to-top>
    </div>
  </footer>
</template>

<script>
import Icon from "~/components/Icon.vue";
import ScrollToTop from "~/components/ScrollToTop.vue";

export default {
  name: "Footer",
  components: {
    "app-icon": Icon,
    "app-scroll-to-top": ScrollToTop,
  },

  data() {
    return {
      hasScrollbar: false,
    };
  },

  mounted() {
    this.hasScrollbar = document.innerHeight > window.innerHeigh;
  },

  computed: {
    icons() {
      return [
        {
          code: "facebook",
          href: "#",
          text: "Facebook",
        },
        {
          code: "instagram",
          href: "#",
          text: "Instagram",
        },
      ];
    },
  },
};
</script>

<style lang="scss" scoped>
footer {
  @apply py-6 bg-secondary text-center text-primary;
}

p {
  @apply pt-4 mt-4 text-xs border-t border-solid border-primary;
}
</style>
