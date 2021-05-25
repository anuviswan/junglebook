import Vue from 'vue'
import VueRouter from 'vue-router'
import Question from '../views/Question.vue'
import Home from '../views/Home.vue'
import Loading from "../views/Loading.vue"
import Winner from "../views/Winner.vue"
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/Question',
    name: 'Question',
    component: Question
  },
  {
    path: '/Loading',
    name: 'Loading',
    component: Loading
  },
  {
    path:"/Winner",
    name:"Winner",
    component:Winner
  }
]

const router = new VueRouter({
  routes
})

export default router
