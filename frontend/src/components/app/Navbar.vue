<template>
  <el-row>
    <el-col v-if="$route.path === '/planning'">
      <PlanningHeader />
    </el-col>
    <el-col v-if="$route.path === '/log'">
      <LogHeader />
    </el-col>
    <el-col>
      <el-badge :value="32" class="badge" v-if="$route.path === '/planning'">
        <i class="el-icon-message-solid"></i>
      </el-badge>
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
import PlanningHeader from '@/components/planning/PlanningHeader'
import LogHeader from '@/components/log/LogHeader'

export default {
  components: {
    PlanningHeader,
    LogHeader
  },
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
.el-col:first-child {
  flex: 1;
}
.el-col-24 {
  width: auto;
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
.badge {
  font-size: 22px;
  color: #909399;
  margin-right: 25px;
  cursor: pointer;
}
</style>