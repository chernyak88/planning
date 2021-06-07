module.exports = {
  load: {
    before: ['responseTime', 'logger', 'cors', 'responses', 'gzip'],
    after: ['parser', 'router', 'syslogs']
  },
  settings: {
    syslogs: {
      enabled: true
    }
  }
};
