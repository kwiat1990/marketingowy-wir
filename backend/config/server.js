module.exports = ({ env }) => ({
  host: env("HOST", "0.0.0.0"),
  port: env.int("PORT", 1337),
  url: env("URL", ""),
  admin: {
    auth: {
      secret: env("ADMIN_JWT_SECRET", "6e4fa5a78611531616ebb4ac1a7e5206"),
    },
  },
});
