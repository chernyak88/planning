<template>
    <div class="urgent-departures-header">
      <el-dropdown trigger="click" @command="range" class="urgent-departures-header__dropdown">
        <el-button type="primary">
          <i class="el-icon-date"></i>
          <i class="el-icon-arrow-down el-icon--right"></i>
        </el-button>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command="day" :class="{ 'is-disabled': $store.state.urgentdepartures.rangeUrgentDepartures === 0 }">Сутки</el-dropdown-item>
          <el-dropdown-item command="week" :class="{ 'is-disabled': $store.state.urgentdepartures.rangeUrgentDepartures === 7 }">Неделя</el-dropdown-item>
          <el-dropdown-item command="month" :class="{ 'is-disabled': $store.state.urgentdepartures.rangeUrgentDepartures > 7 }">Месяц</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-date-picker
        class="urgent-departures-header__picker"
        v-model="$store.state.urgentdepartures.dateUrgentDepartures"
        type="date"
        :editable="false"
        :clearable="false"
        format="dd-MM-yyyy"
        :picker-options="pickerOptions"
        @change="handleChangeDate"
      >
      </el-date-picker>
      <el-select
        class="urgent-departures-header__addtheme"
        value=""
        placeholder="Добавить тему"
        @change="handleChangeMetatheme($event)"
      >
        <el-option
          v-for="item in metatheme_sections"
          :key="item.id"
          :label="item.name"
          :value="item.id">
        </el-option>
      </el-select>
      <el-button type="danger" @click="createUrgentDepartureVisible = true">Срочный выезд!</el-button>

    <el-dialog
      class="urgent-departures-header__create-metatheme"
      :title="createFormTitle"
      :visible.sync="createFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
      @close="hideCreateForm"
    >
      <CreateMetatheme
        :curSection="curSection"
        @hideCreateForm="hideCreateForm"
        @created="hideCreateForm"
      />
    </el-dialog>

    <el-dialog
      class="urgent-departures-header__create-departure"
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
import CreateMetatheme from '@/components/planning/CreateMetatheme'
import CreateUrgentDeparture from '@/components/urgentdepartures/CreateUrgentDeparture'

export default {
  name: 'urgentdeparturesheader',
  components: {
    CreateMetatheme,
    CreateUrgentDeparture
  },
  data() {
    return {
      createFormVisible: false,
      createFormTitle: null,
      createUrgentDepartureVisible: false,
      metatheme_sections: [],
      curSection: null,
      pickerOptions: {
        firstDayOfWeek: 1,
        shortcuts: [{
          text: '',
          onClick(picker) {
            picker.$emit('pick', new Date())
          }
        }]
      }
    }
  },
  async mounted() {
    if (this.$route.query.date && this.$route.query.date_finish) {
      const date = this.moment(this.$route.query.date, "DD-MM-YYYY")
      const date_finish = this.moment(this.$route.query.date_finish, "DD-MM-YYYY")
      const diff = date_finish.diff(date, 'days')
      switch (true) {
        case diff >= 0 && diff <= 1:
          this.$store.commit('setDateUrgentDepartures', this.moment(new Date(date)).format())
          break
        case diff > 1 && diff <= 7:
          this.$store.commit('setDateUrgentDepartures', this.moment(new Date(date)).format())
          this.$store.commit('setRangeUrgentDepartures', 'week')
          break
        case diff > 7:
          this.$store.commit('setDateUrgentDepartures', this.moment(new Date(date)).format())
          this.$store.commit('setRangeUrgentDepartures', 'month')
          break
        default:
          this.$store.commit('setDateUrgentDepartures', this.moment(new Date()).format())
      }
      this.$store.commit('urgentDeparturesUpdated')
    } else if (this.$route.query.date) {
      const date = this.moment(this.$route.query.date, "DD-MM-YYYY")
      this.$store.commit('setDateUrgentDepartures', this.moment(new Date(date)).format())
      this.$store.commit('urgentDeparturesUpdated')
    }
    this.metatheme_sections = await this.$store.dispatch('fetchMetathemeSections')
  },
  methods: {
    handleChangeDate(newDate) {
      this.$store.commit('setDateUrgentDepartures', newDate)
      this.$store.commit('urgentDeparturesUpdated')
    },
    handleChangeMetatheme(id) {
      this.metatheme_sections.forEach((item) => {
        if(item.id === id) {
          this.curSection = item
          this.createFormTitle = `Добавление новой темы в раздел ${item.name}`
        }
      })
      this.createFormVisible = true
    },
    hideCreateForm() {
      this.curSection = null
      this.createFormVisible = false
    },
    hideCreateUrgentDeparture() {
      this.createUrgentDepartureVisible = false
    },
    addNewUrgentDeparture() {
      this.createUrgentDepartureVisible = false
      this.$store.commit('urgentDeparturesUpdated')
    },
    range(newRange) {
      this.$store.commit('setRangeUrgentDepartures', newRange)
      this.$store.commit('urgentDeparturesUpdated')
    }
  },
  beforeDestroy() {
    this.$store.commit('setDateUrgentDepartures', this.moment(new Date()).format())
    let query = Object.assign({}, this.$route.query)
    delete query.date
    delete query.date_finish
    this.$router.replace({ query })
  }
}
</script>

<style lang="scss">
.urgent-departures-header {
  &__dropdown.el-dropdown .el-button {
    padding: 12px 5px;
    margin-right: 2px;
    & .el-icon-date {
      font-size: 18px;
    }
  }
  &__picker.el-date-editor {
    width: 115px;
    margin-right: 10px;
    & .el-input__inner {
      padding-right: 10px;
      cursor: pointer;
      background: #ecf5ff;
    }
  }
  &__addtheme {
    width: 145px;
    margin-right: 10px;

    & .el-input .el-select__caret {
      color: #fff;
    }
    & .el-input__inner {
      color: #fff;
      background: #409EFF;
      border: 1px solid #409EFF;
      text-overflow: ellipsis;
        &::placeholder {
        color: #fff;
      }
    }
  }
  &__create-metatheme .el-dialog,
  &__create-departure .el-dialog {
    width: 950px;
  }
}
</style>