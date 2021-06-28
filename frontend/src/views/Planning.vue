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
    </div>
    <div class="el-table planning-table el-table--fit el-table--striped el-table--border">
      <table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 100%;">
        <thead>
          <tr>
            <th colspan="1" rowspan="1" class="el-table_5_column_29 is-leaf"><div class="cell">Нач.</div></th>
            <th colspan="1" rowspan="1" class="el-table_5_column_30 is-leaf"><div class="cell">Тема</div></th>
            <th colspan="1" rowspan="1" class="el-table_5_column_31 is-leaf"><div class="cell">Адрес</div></th>
            <th colspan="1" rowspan="1" class="el-table_5_column_32 is-leaf"><div class="cell">Корреспонденты</div></th>
            <th colspan="1" rowspan="1" class="el-table_5_column_33 is-leaf"><div class="cell">Эф план</div></th>
            <th colspan="1" rowspan="1" class="el-table_5_column_34 is-leaf"><div class="cell">Перегоны, включения</div></th>
            <th colspan="1" rowspan="1" class="el-table_5_column_35 is-leaf"><div class="cell">Статус</div></th>
          </tr>
        </thead>
        <tbody v-if="metathemeSections.length === 0">
          <tr class="el-table__row no-data">
            <td rowspan="1" colspan="7" class="el-table_8_column_51"><div class="cell">Нет данных</div></td>
          </tr>
        </tbody>
        <tbody v-else v-for="section in metathemeSections" :key="section.id">
          <tr class="el-table__row expanded el-table__row--level-0" v-if="section.metathemes.length !== 0">
            <td rowspan="1" colspan="7" class="el-table_8_column_51"><div class="cell">{{ section.name }}</div></td>
          </tr>
          <tr class="el-table__row el-table__row--striped el-table__row--level-1" v-for="theme in section.metathemes" :key="theme.id">
            <td rowspan="1" colspan="1" class="el-table_8_column_50">
              <div class="cell">{{ theme.date_start }}</div>
              <div class="cell">{{ theme.date_start }}</div>
            </td>
            <td rowspan="1" colspan="1" class="el-table_8_column_51"><div class="cell">{{ theme.name }}</div></td>
            <td rowspan="1" colspan="1" class="el-table_8_column_51"><div class="cell">{{ theme.address }}</div></td>
            <td rowspan="1" colspan="1" class="el-table_8_column_51"><div class="cell"></div></td>
            <td rowspan="1" colspan="1" class="el-table_8_column_51"><div class="cell"></div></td>
            <td rowspan="1" colspan="1" class="el-table_8_column_51"><div class="cell"></div></td>
            <td rowspan="1" colspan="1" class="el-table_8_column_51"><div class="cell"></div></td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- <el-table
      ref="table"
      class="planning-table"
      :data="metathemeSections"
      stripe
      border
      row-key="id"
      :tree-props="{children: 'metathemes'}"
      default-expand-all
      :span-method="arraySpanMethod"
    >
      <el-table-column
        prop="date_start"
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
        prop="metatheme_aether_plans.name"
        label="Эф план">
      </el-table-column>
      <el-table-column
        prop="metatheme_aethers.name"
        label="Перегоны, включения">
      </el-table-column>
      <el-table-column
        label="Статус">
      </el-table-column>
    </el-table> -->
  </div>
</template>

<script>
export default {
  name: 'planning',
  data() {
    return {
      loading: true,
      activeName: 'all',
      metathemeSections: []
    }
  },
  async mounted() {
    this.metathemeSections = await this.$store.dispatch('fetchMetathemeSections')
    this.loading = false
    console.log(this.metathemeSections)
  },
  methods: {
    arraySpanMethod({ row, column, rowIndex, columnIndex }) {
      if (row.metathemes) {
        return [1, 6]
      }
    }
  }
}
</script>

<style lang="scss">
.planning-table th > .cell {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.planning-table .el-table__row--level-0 {
  font-size: 20px;
  font-weight: bold;
  background-color: rgba(120, 89, 223, 0.2);
}
.planning-table .el-table__row--level-0 td,
.planning-table .no-data td {
  text-align: center;
}
</style>