<template>
    <el-container class="container">
        <el-header class="header">
            <Navbar />
        </el-header>
        <el-container>
            <el-aside width="65px">
                <Sidebar />
            </el-aside>
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
</style>