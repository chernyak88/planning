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
        <el-tab-pane label="112" name="aether_112"></el-tab-pane>
        <el-tab-pane label="РенТВ" name="rentv"></el-tab-pane>
        <el-tab-pane label="Газета IZ" name="gazetaiz"></el-tab-pane>
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
    <div ref="table" class="el-table planning-table el-table--border">
      <table id="table" cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 100%;">
        <thead>
          <tr class="sticky">
            <th colspan="1" rowspan="1" width="44" class="no-print"><div class="cell"></div></th>
            <th colspan="1" rowspan="1" width="80" :class="sortClass">
              <div class="cell">
                Нач.
                <span class="caret-wrapper" @click="handleChangeSort">
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
            <th colspan="1" rowspan="1" width="80" class="no-print"><div class="cell">Статус</div></th>
          </tr>
        </thead>
        <tbody v-if="metathemes.length === 0">
          <tr class="el-table__row">
            <td rowspan="1" colspan="8" class="centered">
              <div class="cell">
                <NoData />
              </div>
            </td>
          </tr>
        </tbody>
        <tbody v-else v-for="(themes, section) in grouped" :key="section">
          <template v-if="$store.state.metathemes.filter === section || $store.state.metathemes.filter === 'all'">
            <tr class="el-table__row el-table__row--level-0 metatheme-section-print">
              <td rowspan="1" colspan="8"><div class="cell bold">{{ section }}</div></td>
            </tr>
            <tbody class="contents" v-for="theme in themes" :key="theme.id">
              <tr class="el-table__row el-table__row--level-1">
                <td rowspan="1" colspan="1" class="el-table__expand-column no-print">
                  <div class="cell">
                    <div class="el-table__expand-icon" :class="{ rotate: theme.expand_row }" @click="showExpandRow(theme)">
                      <i class="el-icon el-icon-arrow-right"></i>
                    </div>
                  </div>
                </td>
                <td class="center" rowspan="1" colspan="1">
                  <div class="cell bold">{{ moment(theme.date_start).format('HH:mm') }}</div>
                  <div class="cell">{{ moment(theme.date_start).format('DD/MM') }}</div>
                </td>
                <td rowspan="1" colspan="1" @dblclick="showEditForm(theme)">
                  <div class="cell">
                    <div class="bold theme-name">
                      <el-tooltip class="item" effect="dark" content="Поменять тему местами" placement="bottom">
                        <el-button icon="el-icon-sort" :class="{ red: theme.replaced }" type="info" size="small" @click="replaceMetatheme(theme)"></el-button>
                      </el-tooltip>
                      <span>
                        {{ theme.name }}
                      </span>
                      <el-tooltip class="item" effect="dark" content="Добавить тему" placement="bottom">
                        <i class="el-icon-circle-plus theme-icon" @click="showCreateForm(theme.metatheme_section)"></i>
                      </el-tooltip>
                      <el-tooltip class="item" effect="dark" content="Копировать тему" placement="bottom">
                        <i class="el-icon-document-copy theme-icon" @click="copyMetatheme(theme)"></i>
                      </el-tooltip>
                      <el-tooltip class="item" effect="dark" content="Редактировать тему" placement="bottom">
                        <i class="el-icon-edit theme-icon" @click="showEditForm(theme)"></i>
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
                <td rowspan="1" colspan="1" class="no-print">
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
                    <el-tooltip class="item" effect="dark" content="Лог" placement="bottom">
                      <el-button
                        :class="{ 'el-button--success': theme.status_log, 'el-button--info': !theme.status_log }"
                        size="mini"
                        @click="handleChangeLogStatus(theme)">
                        Л
                      </el-button>
                    </el-tooltip>
                  </div>
                </td>
              </tr>
              <tr v-if="theme.expand_row === true" class="no-print">
                <td rowspan="1" colspan="8">
                  <div class="cell">
                    <p class="bold">Прибытие: <span style="font-weight: normal;">{{ moment(theme.date_start).format('YYYY-MM-DD HH:mm:ss') }}</span></p>
                    <p v-if="theme.description" class="bold">Подробнее:</p>
                    <p v-if="theme.description" class="theme-description" v-html="theme.description"></p>
                    <PlanningShooting
                      :theme="theme"
                    />
                  </div>
                </td>
              </tr>
            </tbody>
          </template>
        </tbody>
      </table>
    </div>

    <el-dialog
      class="planning-create-form"
      :title="createFormTitle"
      :visible.sync="createFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
      @close="hideCreateForm"
    >
      <CreateMetatheme
        :curSection="curSection"
        :curTheme="curTheme"
        @hideCreateForm="hideCreateForm"
        @created="addNewMetateheme"
      />
    </el-dialog>

    <el-dialog
      class="planning-edit-form"
      :title="editFormTitle"
      :visible.sync="editFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
      @close="hideEditForm"
    >
      <EditMetatheme
        :editingTheme="editingTheme"
        @hideEditForm="hideEditForm"
        @edited="editMetateheme"
      />
    </el-dialog>

  </div>
</template>

<script>
import qs from 'qs'
import PlanningShooting from '@/components/planning/PlanningShooting'
import CreateMetatheme from '@/components/planning/CreateMetatheme'
import EditMetatheme from '@/components/planning/EditMetatheme'
import pdfMixin from '@/mixins/pdf.mixin.js'

export default {
  name: 'planning',
  components: {
    PlanningShooting,
    CreateMetatheme,
    EditMetatheme
  },
  mixins: [pdfMixin],
  data() {
    return {
      loading: true,
      activeTab: 'all',
      metathemes: [],
      searchField: null,
      sortClass: '',
      createFormVisible: false,
      createFormTitle: null,
      editFormVisible: false,
      editFormTitle: null,
      curSection: null,
      curTheme: null,
      editingTheme: null,
      print: {
        id: 'table',
        popTitle: 'Метатемы'
      }
    }
  },
  async mounted() {
    if (!this.$route.query.date) {
      this.rerender()
    }
  },
  watch: {
  '$store.state.metathemes.metaUpdated': function () {
    this.rerender()
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
    async fetchMetathemes(group, params) {
      this.loading = true
      const query = qs.stringify({ _where: {
        _or: [
            [
              { 'metatheme_section.group': group },
              { 'metatheme_section.group_ne': 'aether_5' },
              { 'metatheme_section.group_ne': 'aether_iz' },
              { 'metatheme_section.group_ne': 'aether_78' },
              { 'date_start_gte': this.$store.state.metathemes.date },
              { 'date_start_lte': this.moment(this.$store.state.metathemes.date).add(this.$store.state.metathemes.range, 'days').set({hour:23,minute:59,second:59,millisecond:0}).format() }
            ]
          ]
        }
      })
      this.metathemes = await this.$store.dispatch('fetchMetathemes', {query, params})
      this.$store.commit('setGrouped', Object.keys(this.grouped))
      this.loading = false
    },
    rerender() {
      let params = {
        _sort: `metatheme_section.id:asc,sortParam:asc`
      }
      this.sortClass = ''
      this.activeTab === 'all' ? this.fetchMetathemes(undefined, params) : this.fetchMetathemes(this.activeTab, params)
    },
    async exportToPdf() {
      this.loading = true
      try {
        await this.exportToPdfMixin(this.$refs.table, 'Метатемы')
      } catch (e) {
        console.log(e)
        this.$message.error('Ошибка экспорта')
      }
      this.loading = false
    },
    handleTabClick(tab, event) {
      this.sortClass = ''
      tab.name === 'all' ? this.fetchMetathemes() : this.fetchMetathemes(tab.name)
      this.$store.commit('setFilter', 'all')
    },
    handleChangeSort() {
      let activeTab
      let params
      this.activeTab !== 'all' ? activeTab = this.activeTab : activeTab = undefined
      switch (this.sortClass) {
        case '':
          this.sortClass = 'ascending'
          params = {
            _sort: `metatheme_section.id:asc,date_start:asc`
          }
          this.fetchMetathemes(activeTab, params)
          break
        case 'ascending':
          this.sortClass = 'descending'
          params = {
            _sort: `metatheme_section.id:asc,date_start:desc`
          }
          this.fetchMetathemes(activeTab, params)
          break
        case 'descending':
          this.sortClass = ''
          this.fetchMetathemes(activeTab)
          break
      }
    },
    async replaceMetatheme(theme) {
      let replacedTheme
      for (let i = 0; i < this.metathemes.length; i++) {
        if (this.metathemes[i].replaced) {
          replacedTheme = this.metathemes[i]
        }
      }
      if (!replacedTheme) {
        this.$set(theme, 'replaced', true)
      } else if (replacedTheme && theme.id === replacedTheme.id) {
        this.$set(theme, 'replaced', false)
      } else if (replacedTheme && theme.id !== replacedTheme.id && theme.metatheme_section.id !== replacedTheme.metatheme_section.id) {
        this.$set(theme, 'replaced', false)
        this.$set(replacedTheme, 'replaced', false)
        this.$message.error('Менять сортировку можно только в рамках одного раздела')
      } else {
        try {
          this.loading = true
          const themeSortParam = theme.sortParam
          const replacedThemeSortParam = replacedTheme.sortParam
          await this.$store.dispatch('editMetatheme', {id: theme.id, sortParam: replacedThemeSortParam})
          await this.$store.dispatch('editMetatheme', {id: replacedTheme.id, sortParam: themeSortParam})
          .then(() => {
            this.loading = false
            this.rerender()
            this.$message.success('Сортировка изменена')
          })
        } catch (e) {
          this.$message.error('Недостаточно прав для выполнения данной операции')
          console.log(e)
        }
      }
    },
    showExpandRow(theme) {
      theme.expand_row ? this.$set(theme, 'expand_row', false) : this.$set(theme, 'expand_row', true)
    },
    async handleChangeLogStatus(theme) {
      try {
        this.loading = true
        let status
        theme.status_log ? status = false : status = true
        await this.$store.dispatch('editMetatheme', {id: theme.id, status_log: status})
        .then(() => {
          this.loading = false
          this.rerender()
          status ? this.$message.success('Тема отправлена в Лог') : this.$message.success('Тема удалена из Лога')
        })
      } catch (e) {
        this.$message.error('Недостаточно прав для выполнения данной операции')
        console.log(e)
      }
    },
    showCreateForm(section) {
      this.curTheme = null
      this.curSection = section
      this.createFormTitle = `Добавление новой темы в раздел "${section.name}"`
      this.createFormVisible = true
    },
    hideCreateForm() {
      this.curSection = null
      this.curTheme = null
      this.createFormTitle = null
      this.createFormVisible = false
    },
    addNewMetateheme() {
      this.curSection = null
      this.curTheme = null
      this.createFormVisible = false
      this.rerender()
    },
    copyMetatheme(theme) {
      this.curTheme = theme
      this.createFormTitle = `Копирование темы "${theme.name}" в раздел "${theme.metatheme_section.name}"`
      this.createFormVisible = true
    },
    showEditForm(theme) {
      this.editingTheme = theme
      this.editFormTitle = `Изменение темы "${theme.name}" в разделе "${theme.metatheme_section.name}"`
      this.editFormVisible = true
    },
    hideEditForm() {
      this.editFormVisible = false
    },
    editMetateheme() {
      this.editingTheme = null
      this.editFormVisible = false
      this.rerender()
    }
  }
}
</script>

<style lang="scss">
.planning-heading {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 15px;
  & .search-field {
    width: 320px;
    margin-right: 20px;
  }
}
.planning-table {
  overflow: inherit;
  & .bold {
    font-weight: bold;
  }
  & .centered {
    text-align: center;
  }
  & .sticky {
    position: sticky;
    top: 0;
    z-index: 2;
  }
  & .contents {
    display: contents;
  }
  & .red {
    background-color: #ff4747;
    border-color: #ff4747;
  }
  & th > .cell {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  & .cell {
    word-break: normal;
  }
  & .el-table__row--level-0 {
    font-size: 20px;
    background-color: rgba(120, 89, 223, 0.2);
    & td {
      text-align: center;
    }
  }
  & .el-button--small {
    padding: 7px 7px;
  }
  & .theme-name {
    margin-bottom: 10px;
  }
  & .el-table__expand-icon {
    transition: transform .2s ease-in-out;
    &.rotate {
      transform: rotate(90deg);
    }
  }
  & .theme-icon {
    color: #409EFF;
    cursor: pointer;
    margin-left: 5px;
  }
  & .el-tag {
    display: block;
    margin-bottom: 5px;
  }
  & .status-btn {
    display: flex;
    & .el-button {
      padding: 7px 7px;
      &:first-child {
        border-radius: 3px 0 0 3px;
      }
      &:last-child {
        border-radius: 0 3px 3px 0;
      }
      &+.el-button {
        margin-left: 0;
      }
    }
  }
  & .theme-description {
    background: #ecf5ff;
    padding: 15px;
  }
}
.planning-create-form .el-dialog,
.planning-edit-form .el-dialog {
  width: 950px;
}
</style>