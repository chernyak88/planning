import Vue from 'vue'
import Vuex from 'vuex'
import auth from './auth'
import locations from './locations'
import techresources from './techresources'
import metathemes from './metathemes'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    url: process.env.VUE_APP_URL,
    userRole: JSON.parse(localStorage.getItem('user')).role.name || null,
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
    techresources,
    metathemes
  }
})
