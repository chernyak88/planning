import moment from 'moment'
import axios from 'axios'
import qs from 'qs'

export default {
  state: {
    date: moment(new Date()).set({hour:0,minute:0,second:0,millisecond:0}).format(),
  },
  actions: {
    async fetchMetathemes({commit, dispatch}, arr, params = {_sort: 'metatheme_section.id:asc'}) {
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
          url: `${this.state.url}/metathemes?${query}`,
          params: params
        })
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchMetathemeSections() {
      try {
        const response = await axios.get(`${this.state.url}/metatheme-sections`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchMetathemeInclusions() {
      try {
        const response = await axios.get(`${this.state.url}/metatheme-inclusions`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchMetathemeAethers() {
      try {
        const response = await axios.get(`${this.state.url}/metatheme-aethers`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async fetchMetathemeAetherPlans() {
      try {
        const response = await axios.get(`${this.state.url}/metatheme-aether-plans`)
        return response.data
      } catch (e) {
        throw e
      }
    },
    async createMetatheme({commit, dispatch}, obj) {
      try {
        return await axios.post(
          `${this.state.url}/metathemes`,
          {
            name: obj.name,
            metatheme_section: obj.metatheme_section,
            date_start: obj.date_start,
            date_end: obj.date_end,
            short_description: obj.short_description,
            description: obj.description,
            address: obj.address,
            metatheme_inclusions: obj.metatheme_inclusions,
            comment_inclusions: obj.comment_inclusions,
            metatheme_aethers: obj.metatheme_aethers,
            metatheme_aether_plans: obj.metatheme_aether_plans,
            comment_aether_plans: obj.comment_aether_plans,
            status_coord: obj.status_coord,
            comment_coord: obj.comment_coord,
            country: obj.country
          }
        )
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