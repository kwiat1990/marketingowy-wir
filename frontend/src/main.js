// This is the main.js file. Import global CSS and scripts here.
// The Client API can be used here. Learn more: gridsome.org/docs/client-api
require("~/tailwind.css");

import wretch from "wretch";
import Grid from "~/layouts/Grid.vue";
import Single from "~/layouts/Single.vue";

const fetchConfig = wretch()
  .url(process.env.GRIDSOME_API_URL)
  .content("application/json")
  .options({ credentials: "include", mode: "cors" })
  // Parse all errors
  .errorType("json")
  // Cover all important errors and make it accessible using then() method
  .catcher(400, (err) => err.json)
  .catcher(401, (err) => err.json)
  .catcher(403, (err) => err.json)
  .catcher(404, (err) => err.json)
  .catcher(500, (err) => err.json)

export default function (Vue, { router, head, isClient }) {
  // Set default layout as a global component
  Vue.component("grid-layout", Grid);
  Vue.component("single-layout", Single);

  // Add methods to Vue prototype
  Object.defineProperty(Vue.prototype, "$http", {
    value: fetchConfig,
  });

  // Meta
  head.title = "Marketingowy wir – Online marketing – Neuromarketing – Branding";
  head.meta.push({
    name: "description",
    content:
      "Marketingowy wir to blog wyjaśniający zagadnienia z zakresu online marketingu, brandingu, neuromarketingu i psychologii reklamy oraz e-commerce.",
  });
}
