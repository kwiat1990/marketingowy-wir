<template>
  <single-layout>
    <h1 class="headline">{{ $page.about.edges[0].node.title }}</h1>
    <template v-for="content in $page.about.edges[0].node.content">
      <g-image v-if="content.image" :alt="content.image.alternativeText" :src="content.image.url" :key="`image-${content.id}`" class="mb-12"></g-image>
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

export default {
  name: "AboutPage",
  components: { AppRichContent },
};
</script>

<style scoped>
.headline {
  @apply text-4xl font-bold mb-8;
}
</style>
