import axios from 'axios'

export default {
  actions: {
    async fetchLocations() {
      try {
        const response = await axios.get(`${this.state.url}/locations`)
        return response.data
      } catch (e) {
        throw e
      }
    }
  }
}