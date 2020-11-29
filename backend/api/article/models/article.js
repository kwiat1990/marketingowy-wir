"use strict";

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/models.html#lifecycle-hooks)
 * to customize this model
 */
function truncateBySentence(text, sentenceCount = 8) {
  // match ".","!","?" - english ending sentence punctuation
  const sentences = text.match(/[^\.!\?]+[\.!\?]+/g);
  if (sentences && sentences.length >= sentenceCount) {
    return sentences.slice(0, sentenceCount).join(" ");
  }
  return text;
}

module.exports = {
  /**
   * Triggered before user creation.
   */
  lifecycles: {
    async beforeCreate(data) {
      if (data.title) {
        data.slug = strapi.services.slug.buildSlug(data.title);
      }

      if (data.content) {
        data.preview = truncateBySentence(data.content);
      }
    },

    async beforeUpdate(params, data) {
      if (data.title) {
        data.slug = strapi.services.slug.buildSlug(data.title);

      }

      if (data.content) {
        data.preview = truncateBySentence(data.content);
      }
    },
  },
};
