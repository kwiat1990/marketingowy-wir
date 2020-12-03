<template>
  <Layout class="prose">
    <h1>{{ $page.about.edges[0].node.title }}</h1>
    <!-- TODO: adjust to the new api -->
    <!-- <g-image
      v-if="$page.about.edges[0].node.img.length > 0"
      :src="getUrl($page.about.edges[0].node.img[0].url)"
    ></g-image>
    <app-rich-content :content="$page.about.edges[0].node.content.text"></app-rich-content> -->
  </Layout>
</template>

<page-query>
  query {
    about: allStrapiAbout {
      edges {
        node {
          content {
            text
            image {
              url
              alternativeText
              caption
            }
          }
          title
        }
      }
    }
  }
</page-query>

<script>
import getUrl from "~/utils/url-resolver";
import RichContent from "~/components/RichContent.vue";

export default {
  name: "About",
  components: { "app-rich-content": RichContent },

  data() {
    return {
      getUrl,
    };
  },
};
</script>

<style scoped></style>
