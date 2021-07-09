<template>
  <div v-loading="loading">
    <div class="planning-tabs">
      <el-tabs v-model="activeTab" @tab-click="handleTabClick">
        <el-tab-pane label="Все" name="all"></el-tab-pane>
        <el-tab-pane label="Планирование" name="planning"></el-tab-pane>
        <el-tab-pane label="Санкт-Петербург" name="spb"></el-tab-pane>
        <el-tab-pane label="Регионы" name="regions"></el-tab-pane>
        <el-tab-pane label="Зарубежка" name="foreign"></el-tab-pane>
        <el-tab-pane label="Продюсеры" name="producers"></el-tab-pane>
        <el-tab-pane label="IZ.TV" name="iztv"></el-tab-pane>
      </el-tabs>
    </div>
    <div class="planning-heading">
      <el-input
        size="medium"
        class="search-field"
        v-model="searchField"
        placeholder="Поиск"
        :clearable="true"
      >
        <el-button
          slot="append"
          icon="el-icon-search"
        >
        </el-button>
      </el-input>
      <el-tooltip
        class="item"
        effect="dark"
        content="Экспорт в PDF"
      >
        <el-button
          class="pdf"
          type="danger"
          icon="el-icon-document"
          size="medium"
          @click="exportToPdf"
        >
        </el-button>
      </el-tooltip>
      <el-tooltip
        class="item"
        effect="dark"
        content="Печать"
      >
        <el-button
          v-print="print"
          class="print"
          type="primary"
          icon="el-icon-printer"
          size="medium"
        >
        </el-button>
      </el-tooltip>
    </div>
    <div class="el-table planning-table el-table--border">
      <table id="table" ref="table" cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 100%;">
        <thead>
          <tr class="sticky">
            <th colspan="1" rowspan="1" width="44"><div class="cell"></div></th>
            <th colspan="1" rowspan="1" width="80">
              <div class="cell">
                Нач.
                <span class="caret-wrapper">
                  <i class="sort-caret ascending"></i>
                  <i class="sort-caret descending"></i>
                </span>
              </div>
            </th>
            <th colspan="1" rowspan="1" width="350"><div class="cell">Тема</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Адрес</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Корреспонденты</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Эф план</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Перегоны, включения</div></th>
            <th colspan="1" rowspan="1" width="80"><div class="cell">Статус</div></th>
          </tr>
        </thead>
        <tbody v-if="metathemes.length === 0">
          <tr class="el-table__row no-data">
            <td rowspan="1" colspan="8"><div class="cell">Нет данных</div></td>
          </tr>
        </tbody>
        <tbody v-else v-for="(themes, section) in grouped" :key="section">
          <tr class="el-table__row el-table__row--level-0">
            <td rowspan="1" colspan="8"><div class="cell bold">{{ section }}</div></td>
          </tr>
          <tbody class="contents" v-for="theme in themes" :key="theme.id">
            <tr class="el-table__row el-table__row--level-1">
              <td rowspan="1" colspan="1" class="el-table__expand-column">
                <div class="cell">
                  <div class="el-table__expand-icon" :class="{ rotate: theme.expand_row }" @click="theme.expand_row = !theme.expand_row">
                    <i class="el-icon el-icon-arrow-right"></i>
                  </div>
                </div>
              </td>
              <td class="center" rowspan="1" colspan="1">
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
                  <div v-html="theme.short_description"></div>
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
              <td rowspan="1" colspan="1">
                <div class="cell status-btn">
                  <el-tooltip v-if="theme.status_coord === 'new'" class="item" effect="dark" content="Координация статус" placement="bottom">
                    <el-button type="info" size="mini" @click="theme.status_coord='coord'">
                      К <i class="el-icon-minus"></i>
                    </el-button>
                  </el-tooltip>
                  <el-tooltip v-if="theme.status_coord === 'coord'" class="item" effect="dark" content="Координация статус" placement="bottom">
                    <el-button type="warning" size="mini" @click="theme.status_coord='done'">
                      К <i class="el-icon-warning"></i>
                    </el-button>
                  </el-tooltip>
                  <el-tooltip v-if="theme.status_coord === 'done'" class="item" effect="dark" content="Координация статус" placement="bottom">
                    <el-button type="success" size="mini" @click="theme.status_coord='new'">
                      К <i class="el-icon-success"></i>
                    </el-button>
                  </el-tooltip>
                  <el-tooltip v-if="theme.status_log === false || theme.status_log === null" class="item" effect="dark" content="Лог" placement="bottom">
                    <el-button type="info" size="mini" @click="theme.status_log=true">
                      Л
                    </el-button>
                  </el-tooltip>
                  <el-tooltip v-if="theme.status_log === true" class="item" effect="dark" content="Лог" placement="bottom">
                    <el-button type="success" size="mini" @click="theme.status_log=false">
                      Л
                    </el-button>
                  </el-tooltip>
                </div>
              </td>
            </tr>
            <tr v-if="theme.expand_row === true">
              <td rowspan="1" colspan="8">
                <div class="cell">
                  <p class="bold">Прибытие: <span style="font-weight: normal;">{{ moment(theme.date_start).format('YYYY-MM-DD HH:mm:ss') }}</span></p>
                  <p class="bold">Подробнее:</p>
                  <p class="theme-description" v-html="theme.description"></p>
                </div>
              </td>
            </tr>
          </tbody>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import pdfMixin from '@/mixins/pdf.mixin.js'

export default {
  name: 'planning',
  mixins: [pdfMixin],
  data() {
    return {
      loading: true,
      activeTab: 'all',
      metathemes: [],
      searchField: null,
      print: {
        id: "table",
        popTitle: 'Метатемы',
      }
    }
  },
  async mounted() {
    this.fetchMetathemes([...Array(16)].map((e, i) => i + 1))
  },
  watch: {
  '$store.state.metathemes.date': function () {
    this.activeTab = 'all'
    this.fetchMetathemes([...Array(16)].map((e, i) => i + 1))
   }
  },
  computed: {
    grouped() {
      return this.metathemes.reduce((acc, n) => {
        (acc[n.metatheme_section.name] = acc[n.metatheme_section.name] || []).push(n)
        return acc
      }, {})
    }
  },
  methods: {
    async exportToPdf() {
      this.loading = true
      try {
        await this.exportToPdfMixin(this.$refs.table, 'metathemes')
      } catch (e) {
        console.log(e)
        this.$message.error('Ошибка экспорта')
      }
      this.loading = false
    },
    changeCoordStatus(id) {
      console.log(id)
    },
    handleTabClick(tab, event) {
      switch (tab.name) {
        case 'all':
          this.fetchMetathemes([...Array(16)].map((e, i) => i + 1))
          break
        case 'planning':
          this.fetchMetathemes([1,2,3])
          break
        case 'spb':
          this.fetchMetathemes([4,5])
          break
        case 'regions':
          this.fetchMetathemes([6,7,8,9])
          break
        case 'foreign':
          this.fetchMetathemes([10,11,12])
          break
        case 'producers':
          this.fetchMetathemes([13,14])
          break
        case 'iztv':
          this.fetchMetathemes([15,16])
          break
      }
    },
    async fetchMetathemes(arr) {
      this.loading = true
      this.metathemes = await this.$store.dispatch('fetchMetathemes', arr)
      this.loading = false
      console.log(this.metathemes)
    }
  }
}
</script>

<style lang="scss">
.planning-heading {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 15px;
}
.planning-heading .search-field {
  width: 320px;
  margin-right: 20px;
}
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
.planning-table .contents {
  display: contents;
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
.planning-table .el-table__expand-icon {
  transition: transform .2s ease-in-out;
}
.planning-table .el-table__expand-icon.rotate {
  transform: rotate(90deg);
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
.planning-table .status-btn {
  display: flex;
}
.planning-table .status-btn .el-button {
  padding: 7px 7px;
}
.planning-table .status-btn .el-button:first-child {
  border-radius: 3px 0 0 3px;
}
.planning-table .status-btn .el-button:last-child {
  border-radius: 0 3px 3px 0;
}
.planning-table .status-btn .el-button+.el-button {
  margin-left: 0;
}
.planning-table .theme-description {
  background: #ecf5ff;
  padding: 15px;
}
</style>