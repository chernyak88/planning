import axios from 'axios'

export default {
  actions: {
    async fetchLocations({commit, dispatch}, {query = '', params = {_sort: `name:asc`}} = {}) {
      try {
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/locations?${query}`,
          params: params
        })
        return response.data
      } catch (e) {
        throw e
      }
    }
  }
}