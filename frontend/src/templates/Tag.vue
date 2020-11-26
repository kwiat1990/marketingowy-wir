<template>
  <Layout>
    <div>
      <h1>{{ $page.tag.name }}</h1>
    </div>
  </Layout>
</template>

<page-query>
  query Tag($id: ID!) {
    tag: strapiTag(id: $id) {
      id
      name
      articles
    }
  }
</page-query>
