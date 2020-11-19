import * as marked from "marked";

/**
 * Markdown renderers can transform specific elements before they will be parsed.
 * There is a whole bunch of block and inline level renderer methods. See: https://marked.js.org/using_pro#renderer
 */
const renderer = {
  link(href, title, text) {
    const match = href.startsWith("/");
    if (match) {
      return `<g-link to="${href}">${text}</g-link>`;
    }
  },
};

marked.use({ renderer });

export default marked;
