import Vue from 'vue'
import Vuex from 'vuex'
import auth from './auth'
import locations from './locations'
import techresources from './techresources'
import metathemes from './metathemes'
import shootings from './shootings'
import log from './log'
import employees from './employees'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    url: process.env.VUE_APP_URL,
    userRole: null,
  },
  mutations: {
    setUserRole (state, payload) {
      state.userRole = payload
    }
  },
  actions: {
  },
  getters: {
  },
  modules: {
    auth,
    locations,
    techresources,
    metathemes,
    shootings,
    log,
    employees
  }
})
