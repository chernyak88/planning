import Vue from 'vue'
import axios from 'axios'

export default {
  actions: {
    async login({dispatch, commit}, { email, password }) {
      try {
        await axios.post(`${this.state.url}/auth/local`, {
          identifier: email,
          password: password,
        })
        .then(response => {
          const token = response.data.jwt
          const user = JSON.stringify(response.data.user)
          const userEmail = response.data.user.email
          Vue.cookie.set('token', token)
          localStorage.setItem('user', user)
          localStorage.setItem('userEmail', userEmail)
          axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
        })
      } catch (e) {
        throw e
      }
    },
    async logout({dispatch, commit}) {
      try {
        const user = JSON.parse(localStorage.getItem('user'))
        await axios.post(`${this.state.url}/syslogs`, {
          contentType: 'auth',
          name: '/auth/local',
          action: 'logout',
          author: user.email || user.username
        })
        .then(() => {
          Vue.cookie.delete('token')
        })
      } catch (e) {
        throw e
      }
    },
    async forgotPassword({dispatch, commit}, { email }){
      try {
        await axios.post(`${this.state.url}/auth/forgot-password`, {
          email: email
        })
        .then(response => {
          console.log('success');
        })
      } catch (e) {
        throw e
      }
    },
    async resetPassword({dispatch, commit}, { password, confirmPassword }){
      try {
        await axios.post(`${this.state.url}/auth/reset-password`, {
          code: 'privateCode', // code contained in the reset link
          password: password,
          passwordConfirmation: confirmPassword,
        })
        .then(response => {
          console.log('success');
        })
      } catch (e) {
        throw e
      }
    }
  }
}