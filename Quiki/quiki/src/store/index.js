import Vue from 'vue'
import Vuex from 'vuex'
import questions from "./modules/questions"

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    questions
  }
});

export default store;
