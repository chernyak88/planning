<template>
  <el-row :gutter="20">
    <el-col :span="24">
      <el-dropdown class="user-name" @command="logout">
        <span class="el-dropdown-link">
          {{name}}<i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>Выйти</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-avatar icon="el-icon-user-solid"></el-avatar>
    </el-col>
  </el-row>
</template>

<script>
export default {
  computed: {
    name() {
      let user = JSON.parse(localStorage.getItem("user"))
      return user.email
    }
  },
  methods: {
    async logout() {
      await this.$store.dispatch('logout')
      this.$router.go('/login')
    }
  }
}
</script>

<style lang="scss" scoped>
.el-row, .el-col {
  height: 100%;
  display: flex;
  align-items: center;
}
.el-col:last-child {
  justify-content: flex-end;
}
.user-name, .el-link {
  margin-right: 10px;
}
.el-dropdown-link {
  cursor: pointer;
  color: #409EFF;
}
.search-field {
  width: 320px;
  margin-right: 20px;
}
</style>