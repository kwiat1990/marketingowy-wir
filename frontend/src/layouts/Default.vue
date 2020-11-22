<template>
  <div class="prose layout">
    <slot />
  </div>
</template>

<static-query>
query {
  metadata {
    siteName
  }
}
</static-query>

<style lang="scss" scoped>
.layout {
  max-width: 760px;
  @apply px-6 mx-auto;
}
</style>
