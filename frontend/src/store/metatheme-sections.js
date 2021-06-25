import axios from 'axios'

export default {
  actions: {
    async fetchMetathemeSections() {
      try {
        const response = await axios.get(`${this.state.url}/metatheme-sections`)
        return response.data
      } catch (e) {
        throw e
      }
    }
  }
}