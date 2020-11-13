<template>
  <div class="search">
    <form @submit.prevent>
      <input type="text" placeholder="Wyszukaj frazę" v-model="searchTerm" />
    </form>
    <button type="button" @click="$emit('on-close')">
      <app-icon icon="close"></app-icon>
    </button>
  </div>
</template>

<script>
import Icon from "~/components/Icon.vue";

export default {
  name: "Search",
  components: {
    "app-icon": Icon,
  },

  data() {
    return {
      searchTerm: "",
    };
  },
};
</script>

<style lang="scss" scoped>
.search {
  @apply flex absolute inset-0 bg-white;
}

form {
  @apply flex-grow;
}

input {
  @apply w-full h-full;
}

input,
button {
  @apply px-4;
}
</style>
