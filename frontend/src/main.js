// This is the main.js file. Import global CSS and scripts here.
// The Client API can be used here. Learn more: gridsome.org/docs/client-api
require('~/tailwind.css');

import Grid from "~/layouts/Grid.vue";
import Single from "~/layouts/Single.vue";

export default function (Vue, { router, head, isClient }) {
  // Set default layout as a global component
  Vue.component("grid-layout", Grid);
  Vue.component("single-layout", Single);

  head.title = "Marketingowy wir – Online marketing – Neuromarketing – Branding";
  head.meta.push({
    name:"description",
    content: "Marketingowy wir to blog wyjaśniający zagadnienia z zakresu online marketingu, brandingu, neuromarketingu i psychologii reklamy oraz e-commerce."
  })
}
