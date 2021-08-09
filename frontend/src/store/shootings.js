import axios from 'axios'

export default {
  state: {
    sortShootings: 'date_start:asc'
  },
  actions: {
    async fetchShootings({commit, dispatch}, query, params = {_sort: this.state.shootings.sortShootings}) {
      try {
        const response = await axios({
          method: 'get',
          url: `${this.state.url}/shootings?${query}`,
          params: params
        })
        return response.data
      } catch (e) {
        throw e
      }
    },
    async createShooting({commit, dispatch}, obj) {
      try {
        return await axios.post(
          `${this.state.url}/shootings`,
          {
            name: obj.name,
            metatheme: obj.metatheme,
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
            comment_car: obj.comment_car,
            auto_create: obj.auto_create
          }
        )
      } catch (e) {
        throw e
      }
    },
    async editShooting({commit, dispatch}, obj) {
      try {
        return await axios.put(
          `${this.state.url}/shootings/${obj.id}`,
          {
            name: obj.name,
            metatheme: obj.metatheme,
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
    async deleteShooting({commit, dispatch}, id) {
      try {
        return await axios.delete(`${this.state.url}/shootings/${id}`)
      } catch (e) {
        throw e
      }
    }
  },
  mutations: {
    setSortShootings (state, payload) {
      state.sortShootings = payload
    }
  }
}