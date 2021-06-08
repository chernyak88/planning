<template>
  <div id="app" class="app">
    <component :is="layout">
      <router-view/>
    </component>
  </div>
</template>

<script>
import EmptyLayout from '@/layouts/EmptyLayout'
import MainLayout from '@/layouts/MainLayout'

export default {
  components: {
    EmptyLayout,
    MainLayout
  },
  beforeMount() {
    window.addEventListener('beforeunload', this.onUnload)
  },
  beforeDestroy() {
    window.removeEventListener('beforeunload', this.onUnload)
  },
  computed: {
    layout() {
      return (this.$route.meta.layout || 'empty') + '-layout'
    }
  },
  methods: {
    async onUnload() {
      try {
        const user = JSON.parse(localStorage.getItem('user'))
        await this.$http.post(`${this.$store.state.url}/syslogs`, {
          contentType: 'browser/page',
          action: 'close/refresh',
          author: user.email || user.username
        })
      } catch (e) {
        throw e
      }
    }
  }
}
</script>

<style lang="scss">
html, body, .app {
  font-family: Roboto, sans-serif;
  min-height: 100vh;
  margin: 0;
  padding: 0;
}
</style>
