module.exports = ({ env }) => ({
  host: env("API_HOSTNAME", "0.0.0.0"),
  port: env.int("API_PORT", 1337),
  url: env("API_URL", ""),
  proxy: env("API_PROXY", false),
  admin: {
    auth: {
      secret: env("ADMIN_JWT_SECRET", "6e4fa5a78611531616ebb4ac1a7e5206"),
    },
  },
});
