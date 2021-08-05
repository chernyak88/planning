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
    async fetchEmployeesRoles({commit, dispatch}, {query = '', params = {_sort: `name:asc`}} = {}) {
      try {
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/employee-roles?${query}`,
          params: params
        })
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
            surname: obj.surname,
            patronymic: obj.patronymic,
            phone: obj.phone,
            phone_2: obj.phone_2,
            location: obj.location,
            employee_role: obj.employee_role,
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
            surname: obj.surname,
            patronymic: obj.patronymic,
            birthdate: obj.birthdate,
            phone: obj.phone,
            phone_2: obj.phone_2,
            rank: obj.rank,
            employee_role: obj.employee_role,
            location: obj.location,
            passport: obj.passport,
            foreign_passport: obj.foreign_passport,
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