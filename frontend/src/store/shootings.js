import axios from 'axios'

export default {
  state: {

  },
  actions: {
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
            metatheme_inclusions: obj.metatheme_inclusions,
            comment: obj.comment,
            comment_tech: obj.comment_tech,
            comment_car: obj.comment_car
          }
        )
      } catch (e) {
        throw e
      }
    }
  },
  mutations: {

  }
}