export const fetchAndCacheArticlesMixin = {
  data() {
    return {
      articles: [],
      currentPage: 1,
      hasNextPage: false,
    };
  },

  mounted() {
    // TODO: it must be decided if cache should be persistent on page refresh or not
    // window.addEventListener("beforeunload", () => this.cacheData(this.$route.path));
    window.addEventListener("beforeunload", () => sessionStorage.clear());
  },

  beforeRouteEnter(to, from, next) {
    next((vm) => {
      const {
        edges,
        pageInfo: { hasNextPage, currentPage },
      } =
        sessionStorage.getItem(to.path) !== null
          ? JSON.parse(sessionStorage.getItem(to.path))
          : vm.$page.articles;

      vm.articles = edges;
      vm.hasNextPage = hasNextPage;
      vm.currentPage = currentPage;
    });
  },

  beforeRouteLeave(to, from, next) {
    if (to.path !== from.path) {
      this.cacheData(from.path);
    }
    next();
  },

  methods: {
    cacheData(key) {
      if (this.articles.length > 0) {
        sessionStorage.setItem(
          key,
          JSON.stringify({
            edges: this.articles,
            pageInfo: {
              hasNextPage: this.hasNextPage,
              currentPage: this.currentPage,
            },
          })
        );
      }
    },

    async fetchNextPage() {
      if (this.hasNextPage) {
        try {
          const { data } = await this.$fetch(`${this.$route.path}${this.currentPage + 1}`);
          this.articles = [...this.articles, ...data.articles.edges];
          this.hasNextPage = data.articles.pageInfo.hasNextPage;
          this.currentPage = data.articles.pageInfo.currentPage;
        } catch(error) {
          console.warn(`Cannot fetch next page, for more information check: ${error}`);
        }
      }
    },
  },

  computed: {
    filters() {
      return this.$page.categories.edges.map(({ node: category }) => {
        return {
          path: category.path,
          id: category.id,
          name: category.name,
        };
      });
    },
  },
};
