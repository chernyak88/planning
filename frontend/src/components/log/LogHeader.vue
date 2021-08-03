<template>
    <div class="log-header">
      <el-date-picker
        class="log-header__picker"
        v-model="$store.state.log.logDate"
        type="date"
        :editable="false"
        :clearable="false"
        format="dd-MM-yyyy"
        :picker-options="pickerOptions"
        @change="handleChangeDate"
      >
      </el-date-picker>
      <el-tooltip class="item" effect="dark" content="Настройки вывода на печать" placement="bottom">
        <el-button
          class="log-header__settings-btn"
          type="warning"
          icon="el-icon-s-tools"
          @click="logSettingsVisible = true"
        >
        </el-button>
      </el-tooltip>
      <el-button
        v-if="$store.state.log.logDate === moment(new Date()).set({hour:0,minute:0,second:0,millisecond:0}).format()"
        type="warning"
        @click="saveLog(moment(new Date()).format('DD-MM-YYYY'))"
      >
        Сохранить лог
      </el-button>
      <el-date-picker
        class="log-header__picker log-header__picker_loadlog"
        v-model="loadLogDate"
        placeholder="Загрузить лог"
        prefix-icon=""
        type="date"
        :editable="false"
        :clearable="false"
        format="dd-MM-yyyy"
        :picker-options="pickerOptionsLoadLog"
        @change="loadLog"
      >
      </el-date-picker>
      <el-button-group class="log-header__button-group">
        <el-button
          type="primary"
          v-for="(btn, index) in buttonGroup"
          :key="index"
          @click="handleChangeDate(btn.value)"
        >
          {{ btn.text }}
        </el-button>
      </el-button-group>
      <el-button
        type="danger"
        @click="createUrgentDepartureVisible = true"
      >
        Срочный выезд!
      </el-button>

      <el-dialog
        class="log-header__show-settings"
        title="Настройки вывода на печать"
        :visible.sync="logSettingsVisible"
        :destroy-on-close="true"
        :close-on-press-escape="false"
        :close-on-click-modal="false"
        @close="hideLogSettings"
      >
        <LogSettings
          @hideLogSettings="hideLogSettings"
          @changeLogSettings="hideLogSettings"
        />
      </el-dialog>

      <el-dialog
        class="log-header__create-departure"
        title='Создание Съемки в теме "Срочные выезды"'
        :visible.sync="createUrgentDepartureVisible"
        :destroy-on-close="true"
        :close-on-press-escape="false"
        :close-on-click-modal="false"
        @close="hideCreateUrgentDeparture"
      >
      <CreateUrgentDeparture
        @hideCreateUrgentDeparture="hideCreateUrgentDeparture"
        @created="addNewUrgentDeparture"
      />
    </el-dialog>
  </div>
</template>

<script>
import qs from 'qs'
import LogSettings from '@/components/log/LogSettings'
import CreateUrgentDeparture from '@/components/planning/CreateUrgentDeparture'

export default {
  name: 'logheader',
  components: {
    LogSettings,
    CreateUrgentDeparture
  },
  data() {
    return {
      pickerOptions: {
        firstDayOfWeek: 1,
        shortcuts: [{
          text: '',
          onClick(picker) {
            picker.$emit('pick', new Date())
          }
        }]
      },
      pickerOptionsLoadLog: {
        firstDayOfWeek: 1,
        disabledDate(time) {
          return time.getTime() > Date.now()
        },
        shortcuts: [{
          text: '',
          onClick(picker) {
            picker.$emit('pick', new Date())
          }
        }]
      },
      loadLogDate: null,
      logMetathemes: null,
      logSettingsVisible: false,
      createUrgentDepartureVisible: false,
    }
  },
  computed: {
    buttonGroup() {
      const buttons = []
      for (let i = 0; i < 8; i++) {
        buttons.push({
          text: this.moment(new Date()).add(i, 'days').format('DD.MM'),
          value: this.moment(new Date()).add(i, 'days').format()
        })
      }
      return buttons
    }
  },
  methods: {
    handleChangeDate(newDate) {
      this.$store.commit('setLogDate', newDate)
    },
    async saveLog(date) {
      this.loading = true
      let queryLog = qs.stringify({ _where: {
        _or: [
            [
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
      const params = {
        _sort: `metatheme_section.sortLogParam:asc,sortParam:asc`
      }
      this.logMetathemes = await this.$store.dispatch('fetchMetathemes', {query: queryLog, params})

      const query = qs.stringify({ _where: {_or: [[{ 'logDate': date }]]}})
      const response = await this.$store.dispatch('fetchLogs', query)
      if (!response.length) {
        try {
          let data = {
            logDate: date,
            themes: this.logMetathemes
          }
          await this.$store.dispatch('saveLog', data)
          .then(() => {
            this.loading = false
            this.$router.push(`/log/${date}`)
            this.$message.success('Лог сохранен')
          })
        } catch (e) {
          this.$message.error('Недостаточно прав для выполнения данной операции')
          console.log(e)
        }
      } else {
        try {
          let data = {
            id: response[0].id,
            logDate: date,
            themes: this.logMetathemes
          }
          await this.$store.dispatch('updateLog', data)
          .then(() => {
            this.loading = false
            this.$router.push(`/log/${date}`)
            this.$message.success('Лог сохранен')
          })
        } catch (e) {
          this.$message.error('Недостаточно прав для выполнения данной операции')
          console.log(e)
        }
      }
    },
    loadLog() {
      const date = this.moment(this.loadLogDate).format('DD-MM-YYYY')
      this.$router.push(`/log/${date}`)
      this.loadLogDate = null
    },
    hideLogSettings() {
      this.logSettingsVisible = false
    },
    hideCreateUrgentDeparture() {
      this.createUrgentDepartureVisible = false
    },
    addNewUrgentDeparture() {
      this.createUrgentDepartureVisible = false
    }
  },
  beforeDestroy() {
    this.$store.commit('setLogDate', this.moment(new Date()).format())
  }
}
</script>

<style lang="scss">
.log-header {
  &__picker.el-date-editor {
    width: 115px;
    margin-right: 5px;
    & .el-input__inner {
      padding-right: 10px;
      cursor: pointer;
      background: #ecf5ff;
    }
  }
  &__settings-btn {
    padding: 12px 10px;
    &+.el-button {
      margin-left: 5px;
    }
  }
  &__picker_loadlog.el-date-editor {
    width: 130px;
    margin: 0 5px;
    & .el-input__prefix {
      display: none;
    }
    & .el-input__inner {
      color: #fff;
      padding: 12px 20px;
      cursor: pointer;
      background: #E6A23C;
      border: 1px solid #E6A23C;
      text-align: center;
      outline: none;
      &:hover {
        background: #ebb563;
        border-color: #ebb563;
        color: #FFF;
      }
      &::placeholder {
        color: #fff;
      }
    }
  }
  &__button-group {
    margin-right: 5px;
    & .el-button {
      padding: 11px 5px;
    }
  }
  &__show-settings .el-dialog {
    width: 500px;
  }
  &__create-departure .el-dialog {
    width: 950px;
  }
}
</style>