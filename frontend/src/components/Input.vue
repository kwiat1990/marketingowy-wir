<template>
  <div>
    <label :for="field.id">{{ field.label }}</label>
    <div class="input-wrapper" :class="{ ['input-wrapper--has-icon']: field.icon }">
      <app-icon v-if="field.icon" :icon="field.icon" disableHover></app-icon>
      <input
        v-bind="$attrs"
        :id="field.id"
        :type="field.type"
        :value="value"
        @input="$emit('input', $event.target.value.trim())"
      />
    </div>
  </div>
</template>

<script>
import AppIcon from "~/components/Icon.vue";

export default {
  name: "Input",
  components: { AppIcon },
  inheritAttrs: false,
  props: {
    field: Object,
    value: String,
  },
};
</script>

<style lang="scss" scoped>
.input-wrapper--has-icon {
  input {
    @apply pl-14;
  }
}
</style>
