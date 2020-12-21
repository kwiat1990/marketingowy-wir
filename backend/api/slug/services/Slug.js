const slugify = require("slugify");

module.exports = {
  buildSlug: (text) => {
    return slugify(text, { lower: true });
  },
};