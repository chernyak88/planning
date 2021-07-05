import moment from 'moment'
import axios from 'axios'
import qs from 'qs'

export default {
  state: {
    date: moment(new Date()).set({hour:0,minute:0,second:0,millisecond:0}).format(),
  },
  actions: {
    async fetchMetathemes({commit, dispatch}, arr) {
      try {
        let query = qs.stringify({ _where: {
          _or: [
              [
                { 'metatheme_section.id': arr },
                { 'date_start_gt': this.state.metathemes.date },
                { 'date_start_lt': moment(this.state.metathemes.date).add(1, 'days').format() }
              ]
            ]
          }
        })
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/metathemes?${query}`
        })
        return response.data
      } catch (e) {
        throw e
      }
    }
  },
  mutations: {
    setDate (state, payload) {
      state.date = moment(payload).format()
    }
  }
}