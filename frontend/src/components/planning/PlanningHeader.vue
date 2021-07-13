<template>
    <div>
      <el-dropdown>
        <el-button type="primary" style="padding: 12px 5px; margin-right: 2px;">
          <i class="el-icon-date" style="font-size: 18px;"></i>
          <i class="el-icon-arrow-down el-icon--right"></i>
        </el-button>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>Сутки</el-dropdown-item>
          <el-dropdown-item>Неделя</el-dropdown-item>
          <el-dropdown-item>Месяц</el-dropdown-item>
          <el-dropdown-item>Все</el-dropdown-item>
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
      <el-button type="primary" @click="createFormVisible = true">Добавить тему</el-button>
      <el-button type="danger">Срочный выезд!</el-button>
      <el-button type="primary" icon="el-icon-refresh"></el-button>

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
  </div>
</template>

<script>
import CreateMetatheme from '@/components/planning/CreateMetatheme'

export default {
  name: 'planningheader',
  components: {
    CreateMetatheme
  },
  data() {
    return {
      createFormVisible: false,
      createFormTitle: 'Добавление новой темы',
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
  methods: {
    handleChangeDate(newDate) {
      this.$store.commit('setDate', newDate)
      console.log(this)
    },
    handleChangeTitle(newTitle) {
      this.createFormTitle = `Добавление новой темы в раздел ${newTitle}`
    },
    hideCreateForm() {
      this.createFormVisible = false
      this.createFormTitle = 'Добавление новой темы'
    },
    addNewMetateheme() {
      this.createFormVisible = false
      this.$store.commit('metathemesUpdated')
    }
  }
}
</script>

<style lang="scss">
.planning-picker.el-input {
  width: 115px;
  margin-right: 10px;
}
.planning-picker.el-input .el-input__inner {
  padding-right: 10px;
  cursor: pointer;
  background: #ecf5ff;
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
</style>