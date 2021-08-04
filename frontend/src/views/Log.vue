<template>
  <div v-loading="loading">
    <div class="log-tabs">
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
    <div class="el-table log-table el-table--border">
      <table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 100%;">
        <thead>
          <tr class="sticky">
            <th colspan="1" rowspan="1" width="44"><div class="cell"></div></th>
            <th colspan="1" rowspan="1"><div class="cell">Тема</div></th>
            <th colspan="1" rowspan="1" width="75"><div class="cell">Начало</div></th>
            <th colspan="1" rowspan="1" width="150"><div class="cell">Перегоны,<br>включения</div></th>
            <th colspan="1" rowspan="1" width="150"><div class="cell">Корреспонденты</div></th>
            <th colspan="1" rowspan="1" width="150"><div class="cell">Эф план</div></th>
          </tr>
        </thead>
        <tbody v-if="metathemes.length === 0">
          <tr class="el-table__row">
            <td rowspan="1" colspan="6" class="centered">
              <div class="cell">
                <NoData />
              </div>
            </td>
          </tr>
        </tbody>
        <tbody v-else v-for="(themes, section) in grouped" :key="section">
          <template>
            <tr class="el-table__row el-table__row--level-0 metatheme-section-print">
              <td rowspan="1" colspan="6"><div class="cell bold">{{ section }}</div></td>
            </tr>
            <tbody class="contents" v-for="theme in themes" :key="theme.id">
              <tr class="el-table__row el-table__row--level-1">
                <td rowspan="1" colspan="1" class="el-table__expand-column">
                  <div class="cell">
                    <div class="el-table__expand-icon" :class="{ rotate: theme.expand_row }" @click="showExpandRow(theme)">
                      <i class="el-icon el-icon-arrow-right"></i>
                    </div>
                  </div>
                </td>
                <td class="center" rowspan="1" colspan="1">
                  <div class="cell">
                    <div class="bold theme-name">
                      <span>
                        {{ theme.name }}
                      </span>
                    </div>
                    <div v-html="theme.short_description"></div>
                  </div>
                </td>
                <td rowspan="1" colspan="1">
                  <div class="cell bold">{{ moment(theme.date_start).format('HH:mm') }}</div>
                  <div class="cell">{{ moment(theme.date_start).format('DD/MM') }}</div>
                </td>
                <td rowspan="1" colspan="1">
                  <div class="cell centered">
                    <el-tag size="mini" v-for="item in theme.metatheme_inclusions" :key="'I'+item.id">{{ item.name }}</el-tag>
                    <p>{{ theme.comment_inclusions }}</p>
                    <el-tag size="mini" v-for="item in theme.metatheme_aethers" :key="'A'+item.id">{{ item.name }}</el-tag>
                  </div>
                </td>
                <td rowspan="1" colspan="1">
                  <div class="cell">
                    ФИО сотрудников
                  </div>
                </td>
                <td rowspan="1" colspan="1">
                  <div class="cell">
                    <el-tag size="mini" v-for="item in theme.metatheme_aether_plans" :key="'AP'+item.id">{{ item.name }}</el-tag>
                    <p>{{ theme.comment_aether_plans }}</p>
                  </div>
                </td>
              </tr>
              <tr v-if="theme.expand_row === true">
                <td rowspan="1" colspan="6">
                  <div class="cell">
                    <p class="theme-description" v-html="theme.description"></p>
                  </div>
                </td>
              </tr>
            </tbody>
          </template>
        </tbody>
      </table>
    </div>

  </div>
</template>

<script>
import qs from 'qs'

export default {
  name: 'log',
  data() {
    return {
      loading: true,
      activeTab: 'all',
      metathemes: []
    }
  },
  async mounted() {
    this.rerender()
  },
  watch: {
  '$store.state.log.logDate': function () {
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
              { 'status_log': true },
              { 'date_start_lte': this.moment(this.$store.state.log.logDate).set({hour:23,minute:59,second:59,millisecond:0}).format() },
              { 'date_end_gte': this.moment(this.$store.state.log.logDate).set({hour:0,minute:0,second:0,millisecond:0}).format() }
            ]
          ]
        }
      })
      this.metathemes = await this.$store.dispatch('fetchMetathemes', {query, params})
      this.loading = false
    },
    rerender() {
      let params = {
        _sort: `metatheme_section.id:asc,sortParam:asc`
      }
      this.activeTab === 'all' ? this.fetchMetathemes(undefined, params) : this.fetchMetathemes(this.activeTab, params)
    },
    handleTabClick(tab, event) {
      tab.name === 'all' ? this.fetchMetathemes() : this.fetchMetathemes(tab.name)
    },
    showExpandRow(theme) {
      theme.expand_row ? this.$set(theme, 'expand_row', false) : this.$set(theme, 'expand_row', true)
    }
  }
}
</script>

<style lang="scss">
.log-table {
  overflow: inherit;
  & .bold {
    font-weight: bold;
  }
  & .centered {
    text-align: center;
  }
  & .sticky {
    position: sticky;
    top: 60px;
    z-index: 2;
  }
  & .contents {
    display: contents;
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
  & .theme-name {
    margin-bottom: 10px;
  }
  & .el-table__expand-icon {
    transition: transform .2s ease-in-out;
    &.rotate {
      transform: rotate(90deg);
    }
  }
  & .el-tag {
    display: block;
    margin-bottom: 5px;
  }
  & .theme-description {
    background: #ecf5ff;
    padding: 15px;
  }
}
</style>