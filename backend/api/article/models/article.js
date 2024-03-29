"use strict";

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/models.html#lifecycle-hooks)
 * to customize this model
 */
module.exports = {
  /**
   * Triggered before user creation.
   */
  lifecycles: {
    async beforeCreate(data) {
      if (data.title) {
        data.slug = strapi.services.slug.buildSlug(data.title);
      }
    },

    async beforeUpdate(params, data) {
      if (data.title) {
        data.slug = strapi.services.slug.buildSlug(data.title);
      }
    },
  },
};
