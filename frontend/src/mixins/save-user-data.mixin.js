const USER_KEY = "currentUser";
const AUTH_USER_KEY = "isAuthUser";

export const saveUserDataMixin = {
  data() {
    return {
      name: "",
      email: "",
    };
  },

  methods: {
    getUser() {
      const { name, email } = JSON.parse(localStorage.getItem(USER_KEY));
      this.name = name;
      this.email = email;
    },

    saveUser({ name = this.name, email = this.email, isAuth = false } = {}) {
      if (process.isClient && !!localStorage) {
        localStorage.setItem(USER_KEY, JSON.stringify({ name, email }));

        if (isAuth) {
          localStorage.setItem(AUTH_USER_KEY, JSON.stringify(isAuth));
        }
      }
    },
  },

  computed: {
    isUser() {
      return process.isClient && !!localStorage && !!localStorage.getItem(USER_KEY);
    },

    isAuthUser() {
      return process.isClient && !!localStorage && !!localStorage.getItem(AUTH_USER_KEY);
    },
  },
};
