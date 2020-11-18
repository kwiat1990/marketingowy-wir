<template>
  <Layout>
    <div>
      <h1>{{ $page.category.name }}</h1>
      <ul>
        <li v-for="articles in $page.category.articles" :key="$page.category.id">
          {{ articles.title }}
        </li>
      </ul>
    </div>
  </Layout>
</template>

<page-query>
  query Category($id: ID!) {
      category: strapiCategory(id: $id) {
        id
        name
        articles {
          title
        }
      }
    }
</page-query>
