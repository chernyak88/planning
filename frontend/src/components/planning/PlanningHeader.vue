<template>
    <div>
      <el-date-picker
        v-model="date"
        type="date"
        :editable="false"
        :clearable="false"
      >
      </el-date-picker>
      <el-button type="primary">Добавить тему</el-button>
      <el-button type="danger">Срочный выезд</el-button>
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

<style lang="scss" scoped>
.el-date-editor.el-input, .el-date-editor.el-input__inner {
  width: 135px;
  margin-right: 10px;
}
.el-input__inner {
  cursor: pointer;
}
</style>