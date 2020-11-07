const c1 = () => import(/* webpackChunkName: "page--src--templates--category-vue" */ "/home/mateusz.kwiatkowski/Playground/marketingowy-wir/frontend/src/templates/Category.vue")
const c2 = () => import(/* webpackChunkName: "page--src--pages--404-vue" */ "/home/mateusz.kwiatkowski/Playground/marketingowy-wir/frontend/src/pages/404.vue")
const c3 = () => import(/* webpackChunkName: "page--src--pages--index-vue" */ "/home/mateusz.kwiatkowski/Playground/marketingowy-wir/frontend/src/pages/Index.vue")

export default [
  {
    path: "/categories/1/",
    component: c1
  },
  {
    path: "/categories/2/",
    component: c1
  },
  {
    name: "404",
    path: "/404/",
    component: c2
  },
  {
    name: "home",
    path: "/",
    component: c3
  },
  {
    name: "*",
    path: "*",
    component: c2
  }
]
