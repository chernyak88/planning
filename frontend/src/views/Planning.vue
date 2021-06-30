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
    <div class="el-table planning-table el-table--border">
      <table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 100%;">
        <thead>
          <tr class="sticky">
            <th colspan="1" rowspan="1" width="60"><div class="cell">Нач.</div></th>
            <th colspan="1" rowspan="1" width="350"><div class="cell">Тема</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Адрес</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Корреспонденты</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Эф план</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Перегоны, включения</div></th>
            <th colspan="1" rowspan="1" width="80"><div class="cell">Статус</div></th>
          </tr>
        </thead>
        <tbody v-if="metathemeSections.length === 0">
          <tr class="el-table__row no-data">
            <td rowspan="1" colspan="7"><div class="cell">Нет данных</div></td>
          </tr>
        </tbody>
        <tbody v-else v-for="section in metathemeSections" :key="section.id">
          <tr class="el-table__row el-table__row--level-0" v-if="section.metathemes.length !== 0">
            <td rowspan="1" colspan="7"><div class="cell bold">{{ section.name }}</div></td>
          </tr>
          <tr class="el-table__row el-table__row--level-1" v-for="theme in section.metathemes" :key="theme.id">
            <td rowspan="1" colspan="1">
              <div class="cell bold">{{ moment(theme.date_start).format('HH:mm') }}</div>
              <div class="cell">{{ moment(theme.date_start).format('DD/MM') }}</div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell">
                <div class="bold theme-name">
                  <el-tooltip class="item" effect="dark" content="Поменять тему местами" placement="bottom">
                    <el-button icon="el-icon-sort" type="info" size="small"></el-button>
                  </el-tooltip>
                  <span>
                    {{ theme.name }}
                  </span>
                  <el-tooltip class="item" effect="dark" content="Добавить тему" placement="bottom">
                    <i class="el-icon-circle-plus theme-icon"></i>
                  </el-tooltip>
                  <el-tooltip class="item" effect="dark" content="Копировать тему" placement="bottom">
                    <i class="el-icon-document-copy theme-icon"></i>
                  </el-tooltip>
                  <el-tooltip class="item" effect="dark" content="Редактировать тему" placement="bottom">
                    <i class="el-icon-edit theme-icon"></i>
                  </el-tooltip>
                  <el-tooltip class="item" effect="dark" content="Управление сотрудниками" placement="bottom">
                    <i class="el-icon-s-custom theme-icon"></i>
                  </el-tooltip>
                </div>
                <div>
                  {{ theme.short_description }}
                </div>
              </div>
            </td>
            <td rowspan="1" colspan="1"><div class="cell">{{ theme.address }}</div></td>
            <td rowspan="1" colspan="1">
              <div class="cell centered">
                <el-button type="primary" size="mini" round>Добавить</el-button>
              </div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell">
                <el-tag size="mini" v-for="item in theme.metatheme_aether_plans" :key="'AP'+item.id">{{ item.name }}</el-tag>
                <p>{{ theme.comment_aether_plans }}</p>
              </div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell">
                <el-tag size="mini" v-for="item in theme.metatheme_inclusions" :key="'I'+item.id">{{ item.name }}</el-tag>
                <p>{{ theme.comment_inclusions }}</p>
                <el-tag size="mini" v-for="item in theme.metatheme_aethers" :key="'A'+item.id">{{ item.name }}</el-tag>
              </div>
            </td>
            <td rowspan="1" colspan="1"><div class="cell"></div></td>
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
.planning-table {
  overflow: inherit;
}
.planning-table .bold {
  font-weight: bold;
}
.planning-table .centered {
  text-align: center;
}
.planning-table .sticky {
  position: sticky;
  top: 0;
  z-index: 2;
}
.planning-table th > .cell {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.planning-table .cell {
  word-break: normal;
}
.planning-table .el-table__row--level-0 {
  font-size: 20px;
  background-color: rgba(120, 89, 223, 0.2);
}
.planning-table .el-table__row--level-0 td,
.planning-table .no-data td {
  text-align: center;
}
.planning-table .el-button--small {
  padding: 7px 7px;
}
.planning-table .theme-name {
  margin-bottom: 10px;
}
.planning-table .theme-icon {
  color: #409EFF;
  cursor: pointer;
  margin-left: 5px;
}
.planning-table .el-tag {
  display: block;
  margin-bottom: 5px;
}
</style>