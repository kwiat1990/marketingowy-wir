<template>
  <footer class="section-gradient" ref="footer">
    <div class="container">
      <a
        v-for="icon in $static.data.edges[0].node.icons.data"
        :key="icon.text"
        :href="icon.url"
        :title="icon.text"
        class="even:ml-4"
      >
        <app-icon :icon="icon.code"></app-icon>
      </a>

      <hr>

      <g-link :to="$static.data.edges[0].node.link"></g-link>

      <p>
        {{ $static.data.edges[0].node.copyright }}
      </p>

      <app-scroll-to-top v-if="hasScrollbar" class="mt-5"></app-scroll-to-top>
    </div>
  </footer>
</template>

<static-queryY>
  query {
    data: allStrapiFooter {
      edges {
        node {
          copyright,
          icons {
            data {
              code,
              text,
              url
            }
          }
          links {
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

export default {
  name: "Footer",
  components: {
    "app-icon": Icon,
    "app-scroll-to-top": ScrollToTop,
  },

  data() {
    return {
      hasScrollbar: false,
      observer: null,
    };
  },

  mounted() {
    this.observer = new IntersectionObserver((entries) => {
      // if intersectionRatio is 0, the target is out of view
      if (entries[0].intersectionRatio <= 0) {
        this.hasScrollbar = true;
      }
    });
    this.observer.observe(this.$el);
  },

  beforeDestroy() {
    this.observer.disconnect();
  },

  watch: {
    // react on route change
    $route(to, from) {
      this.hasScrollbar = false;
    },
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
  background: var(--section-gadient);
  @apply py-12 bg-secondary text-center text-primary;
}

p {
  border-color: var(--separator);
  @apply pt-4 mt-4 text-xs border-t border-solid;
}
</style>
