import Vue from 'vue'
import VueRouter from 'vue-router'
import LandingPage from "../components/LandingPage"
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'default',
    component: LandingPage
  },
 
]

const router = new VueRouter({
  routes
})

export default router
