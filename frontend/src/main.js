import Vue from 'vue'
import axios from 'axios'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/ru-RU'
import 'element-ui/lib/theme-chalk/index.css'
import  './assets/scss/main.scss'
import  './assets/scss/print.scss'
import  './assets/scss/pdf-view.scss'
import VueCookie from 'vue-cookie'
import Print from 'vue-print-nb'
import moment from 'moment'
import App from './App.vue'
import NoData from './components/app/NoData'
import './registerServiceWorker'
import router from './router'
import store from './store'

Vue.config.productionTip = false

Vue.use(ElementUI, { locale })
Vue.use(VueCookie)
Vue.use(Print)

Vue.component('NoData', NoData)

Vue.prototype.moment = moment
Vue.prototype.$http = axios
const token = Vue.cookie.get('token')
if (token) {
  Vue.prototype.$http.defaults.headers.common['Authorization'] = `Bearer ${token}`
}

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')