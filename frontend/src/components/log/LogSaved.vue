<template>
  <div v-loading="loading">
    <h1>Лог от {{$route.params.logDate}}</h1>
    <div class="log-saved-heading">
      <el-page-header @back="$router.push(`/log`)">
      </el-page-header>
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
    <div ref="table" class="el-table log-saved-table el-table--border">
      <table id="table" cellspacing="0" cellpadding="0" border="0" class="el-table__header log-saved-table__print" style="width: 100%;">
        <thead>
          <tr class="sticky">
            <th colspan="1" rowspan="1" width="44" class="no-print"><div class="cell"></div></th>
            <th colspan="1" rowspan="1"><div class="cell">Тема</div></th>
            <th colspan="1" rowspan="1" width="75"><div class="cell">Начало</div></th>
            <th colspan="1" rowspan="1" width="150"><div class="cell">Перегоны,<br>включения</div></th>
            <th colspan="1" rowspan="1" width="150"><div class="cell">Корреспонденты</div></th>
            <th colspan="1" rowspan="1" width="150"><div class="cell">Эф план</div></th>
          </tr>
        </thead>
        <tbody v-if="!metathemes || metathemes.length === 0">
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
                <td rowspan="1" colspan="1" class="el-table__expand-column no-print">
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
              <tr v-if="theme.expand_row === true" class="no-print">
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
import pdfMixin from '@/mixins/pdf.mixin.js'

export default {
  name: 'logsaved',
  mixins: [pdfMixin],
  data() {
    return {
      loading: true,
      metathemes: [],
      print: {
        id: 'table',
        popTitle: 'Известия_Лог'
      }
    }
  },
  async mounted() {
    const query = qs.stringify({ _where: {_or: [[{ 'logDate': this.$route.params.logDate }]]}})
    const response = await this.$store.dispatch('fetchLogs', query)
    if (response.length) {
      this.metathemes = response[0].themes
    }
    this.loading = false
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
        await this.exportToPdfMixin(this.$refs.table, 'Известия_Лог')
      } catch (e) {
        console.log(e)
        this.$message.error('Ошибка экспорта')
      }
      this.loading = false
    },
    showExpandRow(theme) {
      theme.expand_row ? this.$set(theme, 'expand_row', false) : this.$set(theme, 'expand_row', true)
    }
  }
}
</script>

<style lang="scss">
.log-saved-heading {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 15px;
  & .el-page-header {
    flex: 1;
    align-items: center;
  }
}
.log-saved-table {
  overflow: inherit;
  & .bold {
    font-weight: bold;
  }
  & .centered {
    text-align: center;
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