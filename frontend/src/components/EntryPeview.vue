<template>
  <section class="card">
    <g-image
      v-if="entry.image.url"
      :src="getUrl(entry.image.url)"
      :alt="entry.image.alternativeText"
    ></g-image>
    <div class="p-4">
      <span v-if="entry.category">{{ entry.category.toUpperCase() }}</span>
      <h1 class="mb-0">{{ entry.title }}</h1>
      <time :datetime="getFormattedDate.datetime">{{ getFormattedDate.date }}</time>
      <app-rich-content :content="entry.content"></app-rich-content>
      <g-link v-if="entry.link" :to="entry.link">Czytaj więcej</g-link>
    </div>
  </section>
</template>

<script>
import getUrl from "~/utils/url-resolver";
import RichContent from "~/components/RichContent.vue";
import Waves from "~/layouts/partials/Waves.vue";

export default {
  name: "EntryPreview",
  components: { "app-rich-content": RichContent, "app-waves": Waves },
  props: {
    entry: Object,
  },
  data() {
    return {
      getUrl,
    };
  },

  computed: {
    getFormattedDate() {
      const date = new Date(this.entry.date);
      return {
        datetime: `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`,
        date: date.toLocaleDateString("pl-PL", {
          day: "numeric",
          month: "long",
          year: "numeric",
        }),
      };
    },

    getRandomColor() {
      return "#" + Math.floor(Math.random() * 16777215).toString(16);
    },
  },
};
</script>

<style lang="scss" scoped>
.card {
  background: #f5f3ec;
  box-shadow: 0 0 15px -5px var(--color-glow);
  @apply relative overflow-hidden;
}
</style>
