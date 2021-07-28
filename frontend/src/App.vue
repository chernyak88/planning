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

<style lang="scss">
html, body, .app {
  font-family: Roboto, sans-serif;
  min-height: 100vh;
  margin: 0;
  padding: 0;
}
.app {
  height: 100px;
  overflow: auto;
}
.el-backtop, .el-backtop:hover {
  background-color: #409EFF;
}
.el-backtop, .el-calendar-table td.is-today {
  color: #FFF;
}
.el-dialog {
  margin-top: 15px !important;
}
.el-date-picker.has-sidebar {
  width: 322px;
}
.el-picker-panel [slot=sidebar]+.el-picker-panel__body, .el-picker-panel__sidebar+.el-picker-panel__body {
  margin-left: 0;
}
.el-picker-panel__sidebar {
  position: absolute;
  top: 15px;
  left: 65px;
  bottom: 0;
  width: 20px;
  height: 20px;
  border-right: none;
  box-sizing: border-box;
  padding-top: 0;
  background-color: #FFF;
  overflow: auto;
}
.el-picker-panel__shortcut {
  display: block;
  height: 100%;
  font-family: element-icons!important;
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  padding: 0;

  &::before {
    content: "\e7b9";
  }
}
</style>
