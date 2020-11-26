import * as marked from "marked";
import getUrl from "~/utils/url-resolver";

/**
 * Markdown renderers can transform specific elements before they will be parsed.
 * There is a whole bunch of renderer methods for block and inline level elements. See: https://marked.js.org/using_pro#renderer
 */
const renderer = {
  link(href, title, text) {
    const match = href.startsWith("/");
    if (match) {
      return `<g-link to="${href}">${text}</g-link>`;
    }
  },

  image(href, title, text) {
    return `<g-image src="${getUrl(href)}" alt="${text}"></g-image>`;
  }
};

marked.use({ renderer });

export default marked;
