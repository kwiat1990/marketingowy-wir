<template>
  <single-layout>
    <h1 class="headline">{{ $page.about.edges[0].node.title }}</h1>
    <template v-for="content in $page.about.edges[0].node.content">
      <app-image
        v-if="content.image"
        :altText="content.image.alternativeText"
        :srcset="content.image.url"
        :key="`image-${content.id}`"
      ></app-image>
      <app-rich-content :content="content.text" :key="`text-${content.id}`"></app-rich-content>
    </template>
  </single-layout>
</template>

<page-query>
  query {
    about: allStrapiAbout {
      edges {
        node {
          content {
            id
            image {
              url
              alternativeText
              caption
            }
            text
          }
          title
        }
      }
    }
  }
</page-query>

<script>
import AppRichContent from "~/components/RichContent.vue";
import AppImage from "~/components/Image.vue";

export default {
  name: "AboutPage",
  components: { AppImage, AppRichContent },
};
</script>

<style scoped>
.headline {
  @apply text-4xl font-bold mb-8;
}
</style>
