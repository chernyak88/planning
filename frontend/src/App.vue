<template>
  <div id="app" class="app">
    <el-backtop target=".app"></el-backtop>
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
  mounted() {
    this.$store.commit('setUserRole', this.userRole)
  },
  computed: {
    userRole() {
      localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')).role.name : null
    },
    layout() {
      return (this.$route.meta.layout || 'empty') + '-layout'
    }
  }
}
</script>
