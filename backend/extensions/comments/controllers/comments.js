"use strict";

/**
 * comments.js controller
 *
 * @description: A set of functions called "actions" of the `comments` plugin.
 */

const { sanitizeEntity } = require("strapi-utils");

const parseParams = (params) =>
  Object.keys(params).reduce((prev, curr) => {
    const value = params[curr];
    const parsedValue = isNaN(value) ? value : parseInt(value, 10);
    return {
      ...prev,
      [curr]: parsedValue,
    };
  }, {});

const throwError = (ctx, e) =>
  ctx.throw(e.status, e.getData ? e.getData() : e.message);

module.exports = {
  post: async (ctx) => {
    const { params = {} } = ctx;
    const { relation } = parseParams(params);
    const { body = {} } = ctx.request;
    try {
      // If authenticated user sent the request, fetch his data from DB
      // and put it inside response object
      const token = ctx.cookies.get("token");
      let user;

      if (token) {
        ctx.request.header.authorization = "Bearer " + token;
        const { id } = await strapi.plugins[
          "users-permissions"
        ].services.jwt.getToken(ctx);

        if (id) {
          user = await strapi.plugins[
            "users-permissions"
          ].services.user.fetchAuthenticatedUser(id);
        }
      }

      const entity = await strapi.plugins.comments.services.comments.create(
        {
          ...body,
          authorUser: user || null,
        },
        relation
      );

      if (entity) {
        return entity;
      }
    } catch (e) {
      throwError(ctx, e);
    }
  },
};
