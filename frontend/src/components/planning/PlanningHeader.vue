<template>
    <div>
      <el-dropdown trigger="click" @command="range">
        <el-button type="primary" style="padding: 12px 5px; margin-right: 2px;">
          <i class="el-icon-date" style="font-size: 18px;"></i>
          <i class="el-icon-arrow-down el-icon--right"></i>
        </el-button>
        <el-dropdown-menu slot="dropdown" class="planning-dropdown">
          <el-dropdown-item command="day" :class="{ active: $store.state.metathemes.range === 0 }">Сутки</el-dropdown-item>
          <el-dropdown-item command="week" :class="{ active: $store.state.metathemes.range === 7 }">Неделя</el-dropdown-item>
          <el-dropdown-item command="month" :class="{ active: $store.state.metathemes.range > 7 && $store.state.metathemes.range <= 31 }">Месяц</el-dropdown-item>
          <el-dropdown-item command="all" divided :class="{ active: $store.state.metathemes.range > 31 }">Все</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-date-picker
        v-model="$store.state.metathemes.date"
        class="planning-picker"
        type="date"
        :editable="false"
        :clearable="false"
        format="dd-MM-yyyy"
        :picker-options="pickerOptions"
        @change="handleChangeDate"
      >
      </el-date-picker>
      <el-select
        v-if="grouped.length > 1"
        v-model="$store.state.metathemes.filter"
        style="margin-right: 10px;"
        @change="handleChangeFilter"
      >
        <el-option
          label="Все"
          value="all">
        </el-option>
        <el-option
          v-for="item in grouped"
          :key="item"
          :label="item"
          :value="item">
        </el-option>
      </el-select>
      <el-button type="primary" @click="createFormVisible = true">Добавить тему</el-button>
      <el-button type="danger" @click="createUrgentDepartureVisible = true">Срочный выезд!</el-button>
      <el-tooltip class="item" effect="dark" content="Статус сотрудников" placement="bottom">
        <el-button type="primary" icon="el-icon-user-solid" @click="showEmployeesVisible = true"></el-button>
      </el-tooltip>

    <el-dialog
      :title="createFormTitle"
      width="950px"
      :visible.sync="createFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
      @close="hideCreateForm"
    >
      <CreateMetatheme
        @hideCreateForm="hideCreateForm"
        @created="addNewMetateheme"
        @handleChangeTitle="handleChangeTitle"
      />
    </el-dialog>

    <el-dialog
      title='Создание Съемки в теме "Срочные выезды"'
      width="950px"
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

    <el-dialog
      class="show-employees-dialog"
      :visible.sync="showEmployeesVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
      :show-close="false"
    >
      <ShowEmployees
        @hideEmployees="hideEmployees"
      />
    </el-dialog>
  </div>
</template>

<script>
import CreateMetatheme from '@/components/planning/CreateMetatheme'
import CreateUrgentDeparture from '@/components/planning/CreateUrgentDeparture'
import ShowEmployees from '@/components/planning/ShowEmployees'

export default {
  name: 'planningheader',
  components: {
    CreateMetatheme,
    CreateUrgentDeparture,
    ShowEmployees
  },
  data() {
    return {
      createFormVisible: false,
      createFormTitle: 'Добавление новой темы',
      createUrgentDepartureVisible: false,
      showEmployeesVisible: false,
      grouped: [],
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
  mounted() {
    if (this.$route.query.date && this.$route.query.date_finish) {
      const date = this.moment(this.$route.query.date, "DD-MM-YYYY")
      const date_finish = this.moment(this.$route.query.date_finish, "DD-MM-YYYY")
      const diff = date_finish.diff(date, 'days')
      switch (true) {
        case diff >= 0 && diff <= 1:
          this.$store.commit('setDate', this.moment(new Date(date)).format())
          break
        case diff > 1 && diff <= 7:
          this.$store.commit('setDate', this.moment(new Date(date)).format())
          this.$store.commit('setRange', 'week')
          break
        case diff > 7 && diff <= 31:
          this.$store.commit('setDate', this.moment(new Date(date)).format())
          this.$store.commit('setRange', 'month')
          break
        case diff > 31:
          this.$store.commit('setDate', this.moment(new Date(date)).format())
          this.$store.commit('setRange', 'all')
          break
        default:
          this.$store.commit('setDate', this.moment(new Date()).format())
      }
      this.$store.commit('metathemesUpdated')
    } else if (this.$route.query.date) {
      const date = this.moment(this.$route.query.date, "DD-MM-YYYY")
      this.$store.commit('setDate', this.moment(new Date(date)).format())
      this.$store.commit('metathemesUpdated')
    }
  },
  watch: {
  '$store.state.metathemes.grouped': function () {
    this.grouped = this.$store.state.metathemes.grouped
   }
  },
  methods: {
    handleChangeDate(newDate) {
      this.$store.commit('setDate', newDate)
      this.$store.commit('metathemesUpdated')
      this.$store.commit('setFilter', 'all')
    },
    handleChangeTitle(newTitle) {
      this.createFormTitle = `Добавление новой темы в раздел ${newTitle}`
    },
    handleChangeFilter(newFilter) {
      this.$store.commit('setFilter', newFilter)
    },
    hideCreateForm() {
      this.createFormVisible = false
      this.createFormTitle = 'Добавление новой темы'
    },
    hideCreateUrgentDeparture() {
      this.createUrgentDepartureVisible = false
    },
    hideEmployees() {
      this.showEmployeesVisible = false
    },
    addNewMetateheme() {
      this.createFormVisible = false
      this.$store.commit('metathemesUpdated')
    },
    addNewUrgentDeparture() {
      this.createUrgentDepartureVisible = false
    },
    range(newRange) {
      this.$store.commit('setRange', newRange)
      this.$store.commit('metathemesUpdated')
      this.$store.commit('setFilter', 'all')
    }
  },
  beforeDestroy() {
    this.$store.commit('setDate', this.moment(new Date()).format())
    let query = Object.assign({}, this.$route.query)
    delete query.date
    delete query.date_finish
    this.$router.replace({ query })
  }
}
</script>

<style lang="scss">
.planning-dropdown .el-dropdown-menu__item.active {
  background-color: #ecf5ff;
  color: #66b1ff;
}
.planning-picker.el-input {
  width: 115px;
  margin-right: 10px;

  & .el-input__inner {
    padding-right: 10px;
    cursor: pointer;
    background: #ecf5ff;
  }
}
.el-date-picker.has-sidebar {
  width: 322px;
}
.el-picker-panel [slot=sidebar]+.el-picker-panel__body, .el-picker-panel__sidebar+.el-picker-panel__body {
  margin-left: 0;
}
.el-picker-panel__sidebar {
  position: absolute;
  top: 15px;
  left: 65px;
  bottom: 0;
  width: 20px;
  height: 20px;
  border-right: none;
  box-sizing: border-box;
  padding-top: 0;
  background-color: #FFF;
  overflow: auto;
}
.el-picker-panel__shortcut {
  display: block;
  height: 100%;
  font-family: element-icons!important;
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  padding: 0;

  &::before {
    content: "\e7b9";
  }
}
.show-employees-dialog .el-dialog__header {
  display: none;
}
</style>