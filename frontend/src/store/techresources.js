import axios from 'axios'

export default {
  actions: {
    async fetchTechResources({commit, dispatch}, params) {
      try {
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/tech-resources`,
          params: params
        })
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchTechResourcesCount({commit, dispatch}, params) {
      try {
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/tech-resources/count`,
          params: params
        })
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchTechResourceById({commit, dispatch}, id) {
      try {
        const response = await axios.get(`${this.state.url}/tech-resources/${id}`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchTechResourcesStatuses() {
      try {
        const response = await axios.get(`${this.state.url}/tech-resource-statuses`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async createTechresource({commit, dispatch}, obj) {
      try {
        return await axios.post(
          `${this.state.url}/tech-resources`,
          {
            name: obj.name,
            type: obj.type,
            status: obj.status,
            location: obj.location,
            comment: obj.comment
          }
        )
      } catch (e) {
        throw e
      }
    },
    async editTechresource({commit, dispatch}, obj) {
      try {
        return await axios.put(
          `${this.state.url}/tech-resources/${obj.id}`,
          {
            name: obj.name,
            type: obj.type,
            status: obj.status,
            location: obj.location,
            comment: obj.comment
          }
        )
      } catch (e) {
        throw e
      }
    },
    async deleteTechresource({commit, dispatch}, id) {
      try {
        return await axios.delete(`${this.state.url}/tech-resources/${id}`)
      } catch (e) {
        throw e
      }
    }
  }
}