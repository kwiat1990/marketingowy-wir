<template>
  <section class="card">
    <g-image v-if="entry.image.url" :src="getUrl(entry.image.url)" :alt="entry.image.alternativeText"></g-image>
    <div class="p-4">
      <span v-if="entry.category">{{ entry.category.toUpperCase() }}</span>
      <h1 class="mb-0">{{ entry.title }}</h1>
      <time>{{ new Date(entry.date).toLocaleDateString() }}</time>
      <p>{{ entry.content }}</p>
      <g-link :to="`/articles/${entry.slug}`">Czytaj wiecej</g-link>
    </div>
  </section>
</template>

<script>
import getUrl from "~/utils/url-resolver";

export default {
  name: "EntryPreview",
  props: {
    entry: Object,
  },
  data() {
    return {
      getUrl,
    };
  },
};
</script>

<style lang="scss" scoped>
.card {
  background: #f5f3ec;
  box-shadow: 0 0 15px -5px var(--color-glow);
}

</style>
