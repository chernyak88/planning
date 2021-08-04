import axios from 'axios'

export default {
  actions: {
    async fetchEmployees({commit, dispatch}, params) {
      try {
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/employees`,
          params: params
        })
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchEmployeesCount({commit, dispatch}, params) {
      try {
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/employees/count`,
          params: params
        })
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchEmployeeById({commit, dispatch}, id) {
      try {
        const response = await axios.get(`${this.state.url}/employees/${id}`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchEmployeesRoles() {
      try {
        const response = await axios.get(`${this.state.url}/employee-roles`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async createEmployee({commit, dispatch}, obj) {
      try {
        return await axios.post(
          `${this.state.url}/employees`,
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
    async editEmployee({commit, dispatch}, obj) {
      try {
        return await axios.put(
          `${this.state.url}/employees/${obj.id}`,
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
    async deleteEmployee({commit, dispatch}, id) {
      try {
        return await axios.delete(`${this.state.url}/employees/${id}`)
      } catch (e) {
        throw e
      }
    }
  }
}