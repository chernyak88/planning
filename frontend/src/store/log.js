import moment from 'moment'

export default {
  state: {
    logDate: moment(new Date()).set({hour:0,minute:0,second:0,millisecond:0}).format()
  },
  actions: {
  },
  mutations: {
    setLogDate (state, payload) {
      state.logDate = moment(payload).set({hour:0,minute:0,second:0,millisecond:0}).format()
    }
  }
}