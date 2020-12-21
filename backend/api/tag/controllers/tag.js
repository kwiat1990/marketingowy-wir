"use strict";

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/controllers.html#core-controllers)
 * to customize this controller
 */
const { sanitizeEntity } = require("strapi-utils");

module.exports = {
  /**
   * Retrieve records.
   *
   * @return {Array}
   */
  async find(ctx) {
    let entities;

    if (ctx.query._q) {
      entities = await strapi.services.tag.search(ctx.query);
    } else {
      /**
       * By default relational field for "category" has only an id, which isn't very helpful. 
       * In order to retrieve all data of a category, it needs to be populated direct inside the controller.
       * Strapi's graphql plugin make this out-of-the-box but it has some performance issues (in comaprision to Rest API it is 9x slower 
       * if there is plenty of relational collections!). See: https://github.com/strapi/strapi/issues/8552
       */
      entities = await strapi.services.tag.find(ctx.query, [
        "articles.category",
        "articles.cover"
      ]);
    }

    return entities.map((entity) =>
      sanitizeEntity(entity, { model: strapi.models.tag })
    );
  },
};
