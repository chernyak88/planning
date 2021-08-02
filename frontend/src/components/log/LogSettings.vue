<template>
  <div class="log-settings" v-loading="loading">
    <el-row>
      <el-col>
        <draggable group="sections" @start="drag = true" @end="drag = false">
          <el-card
            v-for="section in sections"
            :key="section.id"
            shadow="hover"
          >
            {{ section.name }}
          </el-card>
        </draggable>
      </el-col>
    </el-row>
    <span
      slot="footer"
      class="dialog-footer"
    >
      <el-button
        type="primary"
        @click="$emit('hideLogSettings')"
      >
        Сохранить порядок
      </el-button>
      <el-button
        type="danger"
        @click="$emit('hideLogSettings')"
      >
        Отмена
      </el-button>
    </span>
  </div>
</template>

<script>
import draggable from 'vuedraggable'

export default {
  name: 'logsettings',
  components: {
    draggable
  },
  data: () => ({
    loading: true,
    sections: []
  }),
  async mounted() {
    this.sections = await this.$store.dispatch('fetchMetathemeSections')
    this.loading = false
    console.log(this.sections)
  },
  methods: {

  }
}
</script>
<style lang="scss">
.log-settings {
  & .el-row {
    margin-bottom: 10px;
  }
  .el-card {
    cursor: move;
    margin-bottom: 5px;
    &__body {
      padding: 10px 15px;
    }
  }
  & .dialog-footer {
    display: block;
    text-align: right;
  }
  .el-col {
    height: 525px;
    overflow: auto;

    & > div {
      column-count:2;
    }
  }
}
</style>