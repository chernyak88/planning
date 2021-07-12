<template>
    <div>
      <el-date-picker
        v-model="$store.state.metathemes.date"
        class="planning-picker"
        type="date"
        :editable="false"
        :clearable="false"
        format="dd-MM-yyyy"
        :picker-options="{ firstDayOfWeek: 1 }"
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
      createFormTitle: 'Добавление новой темы'
    }
  },
  methods: {
    handleChangeDate(newDate) {
      this.$store.commit('setDate', newDate)
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
      this.$store.commit('setDate', new Date())
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
</style>