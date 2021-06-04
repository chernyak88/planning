module.exports = {
  load: {
    before: ['responseTime', 'logger', 'cors', 'responses', 'gzip'],
    after: ['parser', 'router', 'responselogs']
  },
  settings: {
    responselogs: {
      enabled: true
    }
  }
};
