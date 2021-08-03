import axios from 'axios'
import moment from 'moment'

export default {
  state: {
    logDate: moment(new Date()).set({hour:0,minute:0,second:0,millisecond:0}).format()
  },
  actions: {
    async fetchLogs({commit, dispatch}, query = '') {
      try {
        const response = await axios.get(`${this.state.url}/logs/?${query}`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async saveLog({commit, dispatch}, obj) {
      try {
        return await axios.post(
          `${this.state.url}/logs`,
          {
            uid: obj.logDate,
            logDate: obj.logDate,
            themes: obj.themes,
          }
        )
      } catch (e) {
        throw e
      }
    },
    async updateLog({commit, dispatch}, obj) {
      try {
        return await axios.put(
          `${this.state.url}/logs/${obj.id}`,
          {
            uid: obj.logDate,
            logDate: obj.logDate,
            themes: obj.themes,
          }
        )
      } catch (e) {
        throw e
      }
    }
  },
  mutations: {
    setLogDate (state, payload) {
      state.logDate = moment(payload).set({hour:0,minute:0,second:0,millisecond:0}).format()
    }
  }
}