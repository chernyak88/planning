<template>
    <div>
      <el-date-picker
        v-model="date"
        class="planning-picker"
        type="date"
        :editable="false"
        :clearable="false"
        format="dd-MM-yyyy"
        :picker-options="{ firstDayOfWeek: 1 }"
      >
      </el-date-picker>
      <el-button type="primary">Добавить тему</el-button>
      <el-button type="danger">Срочный выезд!</el-button>
      <el-button type="primary" icon="el-icon-refresh"></el-button>
  </div>
</template>

<script>
export default {
  name: 'planningheader',
  data() {
    return {
      date: new Date()
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