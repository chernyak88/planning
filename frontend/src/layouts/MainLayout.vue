<template>
    <el-container class="container">
        <el-aside :width="asideWidth">
            <Sidebar @toggleMenu='toggleMenu' />
        </el-aside>
        <el-container>
            <el-header class="header">
                <Navbar />
            </el-header>
            <el-main>
                <div class="app-page">
                    <router-view />
                </div>
            </el-main>
        </el-container>
    </el-container>
</template>

<script>
import Navbar from '@/components/app/Navbar'
import Sidebar from '@/components/app/Sidebar'

export default {
  name: "main-layout",
  components: {
    Navbar,
    Sidebar
  },
  data: () => ({
    asideWidth: '65px',
  }),
  methods: {
    toggleMenu(isCollapse) {
        switch (isCollapse) {
            case true:
                this.asideWidth = '65px'
                break
            case false:
                this.asideWidth = '250px'
                break
        }
    }
  }
}
</script>

<style lang="scss" scoped>
.container {
    min-height: 100vh;
}
.header {
    border-bottom: solid 1px #e6e6e6;
}
.el-aside {
    overflow: hidden;
}
</style>