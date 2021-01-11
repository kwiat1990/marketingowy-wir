module.exports = ({ env }) => ({
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
  },
});
