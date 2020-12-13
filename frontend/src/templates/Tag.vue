<template>
  <section>
    <!-- <h1>{{ $page.tag.name }}</h1> -->
    <Layout :colNum="3">
      <!-- <app-entry-preview
        v-for="article in previews"
        :key="article.id"
        :entry="article"
      ></app-entry-preview> -->
    </Layout>
  </section>
</template>

<page-query>
  query Tag($id: ID) {
    tag: strapiTag(id: $id) {
      id
      name
      articles {
        published_at
        id
        title
        cover {
          url
        }
        lead
        slug
        category {
          slug
        }
      }
    }
  }
</page-query>

<script>
import AppPreviewCard from "~/components/PreviewCard.vue";

export default {
  name: "Tag",
  components: { AppPreviewCard },
};
</script>
