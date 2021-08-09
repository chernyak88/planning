import router from '../router'
import axios from 'axios'
import moment from 'moment'

export default {
  state: {
    dateUrgentDepartures: moment(new Date()).set({hour:0,minute:0,second:0,millisecond:0}).format(),
    rangeUrgentDepartures: 0,
    urgentUpdated: false,
    sortUrgentDepartures: 'date_start:asc'
  },
  actions: {
    async fetchUrgentDepartures({commit, dispatch}, {query = '', params = {_sort: this.state.urgentdepartures.sortUrgentDepartures}} = {}) {
      try {
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/urgent-departures?${query}`,
          params: params
        })
        return response.data
      } catch (e) {
        throw e
      }
    },
    async createUrgentDeparture({commit, dispatch}, obj) {
      try {
        return await axios.post(
          `${this.state.url}/urgent-departures`,
          {
            name: obj.name,
            reserved: obj.reserved,
            date_departure: obj.date_departure,
            date_arrival: obj.date_arrival,
            date_start: obj.date_start,
            date_end: obj.date_end,
            date_return: obj.date_return,
            address: obj.address,
            metatheme_aether_plans: obj.metatheme_aether_plans,
            comment_aether_plans: obj.comment_aether_plans,
            metatheme_inclusions: obj.metatheme_inclusions,
            comment_inclusions: obj.comment_inclusions,
            comment: obj.comment,
            comment_tech: obj.comment_tech,
            comment_car: obj.comment_car
          }
        )
      } catch (e) {
        throw e
      }
    },
    async editUrgentDeparture({commit, dispatch}, obj) {
      try {
        return await axios.put(
          `${this.state.url}/urgent-departures/${obj.id}`,
          {
            name: obj.name,
            reserved: obj.reserved,
            date_departure: obj.date_departure,
            date_arrival: obj.date_arrival,
            date_start: obj.date_start,
            date_end: obj.date_end,
            date_return: obj.date_return,
            address: obj.address,
            metatheme_aether_plans: obj.metatheme_aether_plans,
            comment_aether_plans: obj.comment_aether_plans,
            metatheme_inclusions: obj.metatheme_inclusions,
            comment_inclusions: obj.comment_inclusions,
            comment: obj.comment,
            comment_tech: obj.comment_tech,
            comment_car: obj.comment_car
          }
        )
      } catch (e) {
        throw e
      }
    },
    async deleteUrgentDeparture({commit, dispatch}, id) {
      try {
        return await axios.delete(`${this.state.url}/urgent-departures/${id}`)
      } catch (e) {
        throw e
      }
    }
  },
  mutations: {
    setDateUrgentDepartures (state, payload) {
      state.dateUrgentDepartures = moment(payload).set({hour:0,minute:0,second:0,millisecond:0}).format()
      state.rangeUrgentDepartures = 0
      router.push({ query: { date: moment(payload).format('DD-MM-YYYY') }}).catch(()=>{})
    },
    setRangeUrgentDepartures (state, payload) {
      switch (payload) {
        case 'day':
          state.rangeUrgentDepartures = 0
          router.push({ query: { date: moment(state.dateUrgentDepartures).format('DD-MM-YYYY') }}).catch(()=>{})
          break
        case 'week':
          state.rangeUrgentDepartures = 7
          router.push({
            query: {
              date: moment(state.dateUrgentDepartures).format('DD-MM-YYYY'),
              date_finish: moment(state.dateUrgentDepartures).add(state.rangeUrgentDepartures, 'days').format('DD-MM-YYYY')
            }
          }).catch(()=>{})
          break
        case 'month':
          const daysInMonth = moment(state.dateUrgentDepartures).daysInMonth()
          state.rangeUrgentDepartures = daysInMonth
          router.push({
            query: {
              date: moment(state.dateUrgentDepartures).format('DD-MM-YYYY'),
              date_finish: moment(state.dateUrgentDepartures).add(state.rangeUrgentDepartures, 'days').format('DD-MM-YYYY')
            }
          }).catch(()=>{})
          break
      }
    },
    urgentDeparturesUpdated (state) {
      state.urgentUpdated = !state.urgentUpdated
    },
    setSortUrgentDepartures (state, payload) {
      state.sortUrgentDepartures = payload
    }
  }
}