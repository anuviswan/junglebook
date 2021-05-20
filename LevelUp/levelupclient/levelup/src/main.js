import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import axios from "axios"
import { getHttpHeader } from "./api/utils";

Vue.config.productionTip = false
Vue.use(Vuetify);



axios.defaults.baseURL = process.env.VUE_APP_BASE_URL;
axios.interceptors.request.use((request) => {
  const header = getHttpHeader();
  request.headers = header;
  return request;
});


axios.interceptors.response.use(
  (response) => {

    return {
      data: response.data,
      hasError: false,
      error: [],
    };
  },
  (error) => {
    switch (error.response.status) {
      case 400:
        return {
          data: null,
          hasError: true,
          error: [error.response.data],
        };
      case 401:
        alert("Unauthorized access, please login.");
        router.push("/");
        break;
      case 500:
        // Handle 500 here
        break;
      // and so on..
    }
    // return Promise.reject(error);
    return {
      data: null,
      hasError: true,
      error: [error.response.data],
    };
  }
);

new Vue({
  vuetify : new Vuetify(),  
  router,
  store,
  render: h => h(App)
}).$mount('#app')
