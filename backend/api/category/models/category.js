'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/models.html#lifecycle-hooks)
 * to customize this model
 */

module.exports = {
  lifecycles: {
    async beforeCreate(data) {
      if (data.name) {
        data.slug = strapi.services.slug.buildSlug(data.name);
      }
    },

    async beforeUpdate(params, data) {
      if (data.name) {
        data.slug = strapi.services.slug.buildSlug(data.name);
      }
    },
  },
};
