export const collectionMixin = {
  data() {
    return {
      articles: [],
      currentPage: 1,
      hasNextPage: false,
    }
  },

  mounted() {
    this.articles = this.$page.articles.edges;
    this.hasNextPage = this.$page.articles.pageInfo.hasNextPage;
    this.currentPage = this.$page.articles.pageInfo.currentPage;
  },

  methods: {
    async fetchMore() {
      if (this.hasNextPage) {
        const { data } = await this.$fetch(`${this.$route.path}${this.currentPage+1}`);
        this.articles = [...this.articles, ...data.articles.edges];
        this.hasNextPage = data.articles.pageInfo.hasNextPage;
        this.currentPage = data.articles.pageInfo.currentPage;
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