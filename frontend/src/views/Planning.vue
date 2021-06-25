<template>
  <div v-loading="loading">
    <div class="heading">
      <el-tabs v-model="activeName">
        <el-tab-pane label="Все" name="all"></el-tab-pane>
        <el-tab-pane label="Планирование" name="planning"></el-tab-pane>
        <el-tab-pane label="Санкт-Петербург" name="spb"></el-tab-pane>
        <el-tab-pane label="Регионы" name="regions"></el-tab-pane>
        <el-tab-pane label="Зарубежка" name="foreign"></el-tab-pane>
        <el-tab-pane label="Продюсеры" name="producers"></el-tab-pane>
        <el-tab-pane label="IZ.TV" name="iztv"></el-tab-pane>
      </el-tabs>
      <el-table
        class="planning-table"
        :data="tableData"
      >
        <el-table-column
          prop="date"
          label="Нач.">
        </el-table-column>
        <el-table-column
          prop="name"
          label="Тема">
        </el-table-column>
        <el-table-column
          prop="address"
          label="Адрес">
        </el-table-column>
        <el-table-column
          label="Корреспонденты">
        </el-table-column>
        <el-table-column
          label="Эф план">
        </el-table-column>
        <el-table-column
          label="Перегоны, включения">
        </el-table-column>
        <el-table-column
          label="Статус">
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
export default {
  name: 'planning',
  data() {
    return {
      loading: true,
      activeName: 'all',
      metathemeSections: [],
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
  },
  async mounted() {
    this.metathemeSections = await this.$store.dispatch('fetchMetathemeSections')
    this.loading = false
    console.log(this.metathemeSections)
  }
}
</script>

<style lang="scss">
.planning-table th > .cell {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>