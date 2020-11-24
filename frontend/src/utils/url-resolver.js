/**
 * Based on current enviroment set correct hostname to the source files (e.g. images, videos)
 * @param {string} url  
 */
export default function getURL(url = "") {
  if (url.startsWith("/")) {
    return `${process.env.GRIDSOME_STRAPI_URL || "http://localhost:1337"}${url}`;
  }
  return url;
}
