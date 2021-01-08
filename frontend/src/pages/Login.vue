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

    <button type="submit" class="block w-full px-4 py-2 mx-auto button button--dark">Submit</button>
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
          credentials: "include",
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
input {
  @apply pl-14;
}
</style>
