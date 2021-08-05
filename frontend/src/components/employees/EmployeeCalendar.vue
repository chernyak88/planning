<template>
  <div v-loading="loading" class="employee-calendar">
    <el-page-header
      :content="employeeName"
      @back="$router.push(`/employee`)"
    >
    </el-page-header>
    <el-calendar v-model="calendar">
    </el-calendar>
  </div>
</template>

<script>
export default {
  name: 'employeecalendar',
  data() {
    return {
      loading: true,
      employee: null,
      employeeName: null,
      calendar: new Date()
    }
  },
  async mounted() {
    this.employee = await this.$store.dispatch('fetchEmployeeById', this.$route.params.id)
    this.loading = false
  },
  watch: {
    employee() {
      const surname = this.employee.surname ? this.employee.surname : ''
      const name = this.employee.name ? this.employee.name : ''
      const patronymic = this.employee.patronymic ? this.employee.patronymic : ''
      this.employeeName = `${surname} ${name} ${patronymic}`
    }
  },
  methods: {

  }
}
</script>

<style lang="scss">

</style>