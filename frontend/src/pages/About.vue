<template>
  <Layout class="prose">
    <h1>{{ $page.about.edges[0].node.title }}</h1>
  </Layout>
</template>

<page-query>
  query {
    about: allStrapiAbout {
      edges {
        node {
          img {
            url
          }
          content
          title
        }
      }
    }
  }
</page-query>

<script>
export default {
  name: "About",
};
</script>

<style scoped></style>
