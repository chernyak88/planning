<template>
  <div v-loading="loading">
    <div class="heading">
      <el-tabs v-model="activeName">
        <el-tab-pane label="Все" name="first">
          <el-table
            :data="tableData"
          >
            <el-table-column
              prop="date"
              label="Date"
              width="180">
            </el-table-column>
            <el-table-column
              prop="name"
              label="Name"
              width="180">
            </el-table-column>
            <el-table-column
              prop="address"
              label="Address">
            </el-table-column>
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="Планирование" name="second">Планирование</el-tab-pane>
        <el-tab-pane label="Санкт-Петербург" name="third">Санкт-Петербург</el-tab-pane>
        <el-tab-pane label="Регионы" name="fourth">Регионы</el-tab-pane>
        <el-tab-pane label="Зарубежка" name="five">Зарубежка</el-tab-pane>
        <el-tab-pane label="Продюсеры" name="six">Продюсеры</el-tab-pane>
        <el-tab-pane label="IZ.TV" name="seven">IZ.TV</el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script>
export default {
  name: 'planning',
  data() {
    return {
      loading: false,
      activeName: 'first',
      tableData: [{
        date: '2016-05-03',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles'
      }, {
        date: '2016-05-02',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles'
      }, {
        date: '2016-05-04',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles'
      }, {
        date: '2016-05-01',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles'
      }, {
        date: '2016-05-08',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles'
      }, {
        date: '2016-05-06',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles'
      }, {
        date: '2016-05-07',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles'
      }],
    }
  }
}
</script>

<style lang="scss" scoped>

</style>