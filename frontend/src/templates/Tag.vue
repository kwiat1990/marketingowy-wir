<template>
  <Layout>
    <div>
      <h1>{{ $page.tag.name }}</h1>
    </div>
  </Layout>
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
        preview
        slug
        category {
          slug
        }
      }
    }
  }
</page-query>
