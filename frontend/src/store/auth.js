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
          sessionStorage.setItem('token', token)
          sessionStorage.setItem('user', user)
          localStorage.setItem('userEmail', userEmail)
          axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
        })
      } catch (e) {
        throw e
      }
    },
    logout() {
      sessionStorage.removeItem('token')
      sessionStorage.removeItem('user')
    }
  }
}