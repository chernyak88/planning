<template>
  <el-menu
    class="sidebar"
    :router="true"
    :default-active="activeLink"
    :collapse="isCollapse"
  >
    <el-menu-item index="/" :route="{ name: 'home'}">
      <i class="el-icon-s-home"></i>
      <span slot="title">Главная</span>
    </el-menu-item>
  </el-menu>
</template>

<script>
export default {
  data: () => ({
    isCollapse: true,
    activeLink: null
  }),
  mounted: function() {
    this.activeLink = this.$route.path;
  },
  watch: {
    $route (to, from) {
      this.activeLink = to.path;
    }
  }
}
</script>

<style lang="scss" scoped>
.sidebar {
  height: 100%;
}
</style>