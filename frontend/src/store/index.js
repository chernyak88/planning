import Vue from 'vue'
import Vuex from 'vuex'
import auth from './auth'
import locations from './locations'
import techresources from './techresources'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    url: process.env.VUE_APP_URL,
  },
  mutations: {
  },
  actions: {
  },
  getters: {
  },
  modules: {
    auth,
    locations,
    techresources
  }
})
