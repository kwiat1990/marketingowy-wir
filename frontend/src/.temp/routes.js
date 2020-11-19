const c1 = () => import(/* webpackChunkName: "page--src--templates--category-vue" */ "/home/mateusz.kwiatkowski/Playground/marketingowy-wir/frontend/src/templates/Category.vue")
const c2 = () => import(/* webpackChunkName: "page--src--pages--about-vue" */ "/home/mateusz.kwiatkowski/Playground/marketingowy-wir/frontend/src/pages/About.vue")
const c3 = () => import(/* webpackChunkName: "page--src--pages--404-vue" */ "/home/mateusz.kwiatkowski/Playground/marketingowy-wir/frontend/src/pages/404.vue")
const c4 = () => import(/* webpackChunkName: "page--src--pages--index-vue" */ "/home/mateusz.kwiatkowski/Playground/marketingowy-wir/frontend/src/pages/Index.vue")

export default [
  {
    path: "/categories/41/",
    component: c1
  },
  {
    path: "/categories/42/",
    component: c1
  },
  {
    path: "/categories/43/",
    component: c1
  },
  {
    path: "/categories/44/",
    component: c1
  },
  {
    path: "/categories/45/",
    component: c1
  },
  {
    path: "/categories/46/",
    component: c1
  },
  {
    path: "/categories/47/",
    component: c1
  },
  {
    path: "/categories/48/",
    component: c1
  },
  {
    path: "/categories/49/",
    component: c1
  },
  {
    path: "/categories/50/",
    component: c1
  },
  {
    path: "/about/",
    component: c2
  },
  {
    name: "404",
    path: "/404/",
    component: c3
  },
  {
    name: "home",
    path: "/",
    component: c4
  },
  {
    name: "*",
    path: "*",
    component: c3
  }
]
