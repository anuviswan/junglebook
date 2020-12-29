import Vue from 'vue'
import VueRouter from 'vue-router'
import LandingPage from "../components/LandingPage"
import Home from "../components/Home"
import ImageQuestion from "../components/ImageQuestion"
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
  {
    path: '/q/:category',
    name: 'question',
    component: ImageQuestion
  },
 
]

const router = new VueRouter({
  routes
})

export default router
