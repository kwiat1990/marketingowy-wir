<template>
  <form class="container max-w-xl" @submit.prevent="onSubmit">
    <div>
      <label for="email">E-mail</label>
      <div class="input-wrapper">
        <app-icon icon="email" disableHover></app-icon>
        <input type="email" id="email" v-model="email" />
      </div>
    </div>

    <div>
      <label for="name">Password</label>
      <div class="input-wrapper">
        <app-icon icon="lock" disableHover></app-icon>
        <input type="password" id="password" v-model="password" />
      </div>
    </div>

    <button type="submit" class="block px-8 py-2 mx-auto button button--dark">Submit</button>
  </form>
</template>

<script>
import AppIcon from "~/components/Icon.vue";

export default {
  name: "Login",
  components: { AppIcon },
  data() {
    return {
      email: "",
      password: "",
    };
  },

  methods: {
    onSubmit() {
      try {
        fetch(`${process.env.GRIDSOME_API_URL}/auth/local`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ identifier: this.email, password: this.password }),
        });

        this.email = "";
        this.password = "";
      } catch (e) {
        console.warn("There is an error occured.", e);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
form {
}

input,
textarea {
  @apply px-6 py-2 w-full rounded-md border-2 border-color-accent-3;
}

input {
  @apply pl-14;
}

label {
  @apply block;
}

.input-wrapper {
  @apply relative mb-6;

  svg {
    @apply absolute top-1/2 left-3 transform -translate-y-2/4 hover:scale-100;
  }
}
</style>
