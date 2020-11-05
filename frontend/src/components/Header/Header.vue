6
<template>
  <header class="header">
    <div class="bar"></div>
    Header
  </header>
</template>

<script>
export default {
  components: {},
  name: "Header",
};
</script>

<style lang="scss" scoped>
.header {
  height: 50px;
  border-bottom: 1px solid var(--border-color);
}

.bar {
  background: linear-gradient(90deg, var(--primary-color), #8ed6fb 50%, #d32e9d);
  height: 4px;
}
</style>
