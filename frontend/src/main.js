// This is the main.js file. Import global CSS and scripts here.
// The Client API can be used here. Learn more: gridsome.org/docs/client-api
require('~/tailwind.css');

import Grid from "~/layouts/Grid.vue";
import Single from "~/layouts/Single.vue";

export default function (Vue, { router, head, isClient }) {
  // Set default layout as a global component
  Vue.component("grid-layout", Grid);
  Vue.component("single-layout", Single);
}
