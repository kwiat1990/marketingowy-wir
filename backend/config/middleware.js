module.exports = ({ env }) => ({
  load: {
    before: [
      "cookieGetter",
      "responseTime",
      "logger",
      "cors",
      "responses",
      "gzip",
    ],
    order: [
      "Define the middlewares' load order by putting their name in this array is the right order",
    ],
    after: ["parser", "router", "cookieSetter"],
  },
  settings: {
    cors: {
      origin: [
        env("CLIENT_URL", "http://localhost:8080"),
        env("API_URL", "http://localhost:1337"),
      ],
    },
    session: {
      enabled: true,
    },
    cookieGetter: {
      enabled: true,
    },
    cookieSetter: {
      enabled: true,
    },
  },
});
