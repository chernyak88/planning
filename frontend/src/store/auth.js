import axios from 'axios'

export default {
  actions: {
    async login({dispatch, commit}, { email, password }){
      try {
        await axios.post(`${this.state.url}/auth/local`, {
          identifier: email,
          password: password,
        })
        .then(response => {
          const token = response.data.jwt
          const user = JSON.stringify(response.data.user)
          const userEmail = response.data.user.email
          localStorage.setItem('token', token)
          localStorage.setItem('user', user)
          localStorage.setItem('userEmail', userEmail)
          axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
          axios.post(`${this.state.url}/syslogs`, {
            contentType: 'auth',
            name: '/auth/local',
            action: 'login',
            author: response.data.user.email || response.data.user.username
          })
        })
      } catch (e) {
        throw e
      }
    },
    async logout({dispatch, commit}){
      try {
        const user = JSON.parse(localStorage.getItem('user'))
        await axios.post(`${this.state.url}/syslogs`, {
          contentType: 'auth',
          name: '/auth/local',
          action: 'logout',
          author: user.email || user.username
        })
        .then(() => {
          localStorage.removeItem('token')
          localStorage.removeItem('user')
        })
      } catch (e) {
        throw e
      }
    }
  }
}