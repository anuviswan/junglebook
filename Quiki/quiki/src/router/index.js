import Vue from 'vue'
import VueRouter from 'vue-router'
import LandingPage from "../components/LandingPage"
import Home from "../components/Home"
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'default',
    component: LandingPage
  },
  {
    path: '/home',
    name: 'home',
    component: Home
  },
 
]

const router = new VueRouter({
  routes
})

export default router
