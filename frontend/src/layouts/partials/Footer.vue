<template>
  <footer ref="footer">
    <app-waves animate></app-waves>
    <div class="inner">
      <div class="container">
        <div class="separator">
          <a
            v-for="icon in $static.data.edges[0].node.socialIcons"
            :key="icon.id"
            :href="icon.url"
            :title="icon.title"
            :aria-label="icon.text"
          >
            <app-icon :icon="icon.iconCode"></app-icon>
          </a>
        </div>
        <div class="separator">
          <g-link
            v-for="link in $static.data.edges[0].node.links"
            :key="link.id"
            :to="link.url"
            :title="link.title"
            >{{ link.label }}</g-link
          >
        </div>
        <span class="text-base">
          {{ $static.data.edges[0].node.copyright }}
        </span>
        <app-scroll-to-top v-show="needBackToTop" class="block mx-auto mt-5 -mb-4"></app-scroll-to-top>
      </div>
    </div>
  </footer>
</template>

<static-queryY>
  query {
    data: allStrapiFooter {
      edges {
        node {
          copyright,
          socialIcons {
            id,
            iconCode,
            label,
            title,
            url
          }
          links {
            id
            isInternal
            label
            title
            url
          }
        }
      }
    }
  }
</static-queryY>

<script>
import Icon from "~/components/Icon.vue";
import ScrollToTop from "~/components/ScrollToTop.vue";
import Waves from "~/layouts/partials/Waves.vue";

export default {
  name: "Footer",
  components: {
    "app-icon": Icon,
    "app-scroll-to-top": ScrollToTop,
    "app-waves": Waves,
  },

  data() {
    return {
      needBackToTop: false,
      observer: null,
    };
  },

  mounted() {
    this.observer = new IntersectionObserver((entries) => {
      // If intersectionRatio is 0, the target is out of view
      this.needBackToTop = entries[0].intersectionRatio <= 0;
    });
    // Watch page header visibility to determine if back to top is needed.
    // IntersectionObserver for header works better than for footer because of some inconsistency:
    // if during route change page needs to be scrolled to top, then values for footer are miscalculated)
    this.observer.observe(document.querySelector("header"));
  },

  beforeDestroy() {
    this.observer.disconnect();
  },

  watch: {
    // React on route change
    $route(to, from) {
      this.needBackToTop = false;
    },
  },
};
</script>

<style lang="scss" scoped>
.container {
  @apply max-w-none;
}

.inner {
  background: var(--section-gadient);
  @apply py-12 bg-secondary text-center text-primary;
}

.separator {
  border-color: var(--separator);
  @apply mb-5 pb-5 space-x-4 border-b;
}
</style>
