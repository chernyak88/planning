<template>
  <div class="show-employees" v-loading="loading">
    <el-table
      :data="tableData"
      border>
      <el-table-column
        prop="status"
        :label="location"
        width="150">
      </el-table-column>
      <el-table-column
        prop="employees"
        label="Сотрудники">
      </el-table-column>
    </el-table>
    <span
      slot="footer"
      class="dialog-footer"
    >
      <el-button
        type="primary"
        @click="changeLocation('Москва')"
      >
        Москва
      </el-button>
      <el-button
        type="primary"
        @click="changeLocation('Санкт-Петербург')"
      >
        Санкт-Петербург
      </el-button>
      <el-button
        type="primary"
        @click="changeLocation('Регионы')"
      >
        Регионы
      </el-button>
      <el-button
        type="danger"
        @click="$emit('hideEmployees')"
      >
        Закрыть
      </el-button>
    </span>
  </div>
</template>

<script>
export default {
  name: 'showemployees',
  data: () => ({
    loading: true,
    location: 'Москва',
    tableData: [
      {
        status: 'Дежурный',
        employees: []
      },
      {
        status: 'Темы',
        employees: []
      },
      {
        status: 'Выходной',
        employees: []
      },
      {
        status: 'Отпуск',
        employees: []
      },
      {
        status: 'Больничный',
        employees: []
      },
      {
        status: 'Командировка',
        employees: []
      }
    ]
  }),
  async mounted() {
    this.loading = false
  },
  methods: {
    changeLocation(val) {
      this.location = val
    }
  }
}
</script>
<style lang="scss">
.show-employees {

  & .el-table {
    margin-bottom: 20px;
  }

  & th {
    background-color: #e9ecef;
    border-color: #f3f3f3;
  }

  & .dialog-footer {
    display: block;
    text-align: right;
  }

}
</style>