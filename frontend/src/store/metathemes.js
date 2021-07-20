import router from '../router'
import moment from 'moment'
import axios from 'axios'
import qs from 'qs'

export default {
  state: {
    date: moment(new Date()).set({hour:0,minute:0,second:0,millisecond:0}).format(),    
    range: 0,
    metaUpdated: false,
    grouped: null,
    filter: 'all',
    sort: 'asc'
  },
  actions: {
    async fetchMetathemes({commit, dispatch}, arr, params = {_sort: `metatheme_section.id:asc,date_start:${this.state.metathemes.sort}`}) {
      try {
        let query = qs.stringify({ _where: {
          _or: [
              [
                { 'metatheme_section.id': arr },
                { 'date_start_gt': this.state.metathemes.date },
                { 'date_start_lt': moment(this.state.metathemes.date).add(this.state.metathemes.range, 'days').set({hour:23,minute:59,second:59,millisecond:0}).format() }
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
    },
    async editMetatheme({commit, dispatch}, obj) {
      try {
        return await axios.put(
          `${this.state.url}/metathemes/${obj.id}`,
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
    setGrouped (state, payload) {
      state.grouped = payload
    },
    setFilter (state, payload) {
      state.filter = payload
    },
    setSort (state, payload) {
      state.sort = payload
    },
    setDate (state, payload) {
      state.date = moment(payload).set({hour:0,minute:0,second:0,millisecond:0}).format()
      state.range = 0
      router.push({ query: { date: moment(payload).format('DD-MM-YYYY') }}).catch(()=>{})
    },
    setRange (state, payload) {
      switch (payload) {
        case 'day':
          state.range = 0
          router.push({ query: { date: moment(state.date).format('DD-MM-YYYY') }}).catch(()=>{})
          break
        case 'week':
          state.range = 7
          router.push({
            query: {
              date: moment(state.date).format('DD-MM-YYYY'),
              date_finish: moment(state.date).add(state.range, 'days').format('DD-MM-YYYY')
            }
          }).catch(()=>{})
          break
        case 'month':
          const daysInMonth = moment(state.date).daysInMonth()
          state.range = daysInMonth
          router.push({
            query: {
              date: moment(state.date).format('DD-MM-YYYY'),
              date_finish: moment(state.date).add(state.range, 'days').format('DD-MM-YYYY')
            }
          }).catch(()=>{})
          break
        case 'all':
          state.range = 165000
          router.push({
            query: {
              date: moment(state.date).format('DD-MM-YYYY'),
              date_finish: 'all'
            }
          }).catch(()=>{})
          break
      }
    },
    metathemesUpdated (state) {
      state.metaUpdated = !state.metaUpdated
    }
  }
}