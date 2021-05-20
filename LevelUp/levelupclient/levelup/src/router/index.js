import Vue from 'vue'
import VueRouter from 'vue-router'
import Question from '../views/Question.vue'
import Home from '../views/Home.vue'

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
  }
]

const router = new VueRouter({
  routes
})

export default router
