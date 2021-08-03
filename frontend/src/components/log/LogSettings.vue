<template>
  <div class="log-settings" v-loading="loading">
    <el-row>
      <el-col>
        <draggable v-model="sections">
          <el-card
            v-for="section in sections"
            :key="section.id"
            shadow="hover"
          >
            {{section.sortLogParam}}. {{section.name}}
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
        @click="saveNewOrder"
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
import qs from 'qs'
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
    await this.fetchMetathemesSections()
    this.loading = false
  },
  methods: {
    async fetchMetathemesSections() {
      this.loading = true
      const query = qs.stringify({ _where: {
        _or: [
            [
              { 'group_ne': 'aether_5' },
              { 'group_ne': 'aether_iz' },
              { 'group_ne': 'aether_78' }
            ]
          ]
        }
      })
      const params = {
        _sort: `SortLogParam:asc`
      }
      this.sections = await this.$store.dispatch('fetchMetathemeSections', {query, params})
      this.loading = false
    },
    async saveNewOrder() {
      try {
        this.loading = true
        for(let i = 0; i < this.sections.length; i++) {
          if (this.sections[i].sortLogParam !== (i + 1)) {
            let formData = {
              id: this.sections[i].id,
              sortLogParam: i + 1
            }
            await this.$store.dispatch('editMetathemeSection', formData)
          }
        }
        this.loading = false
        this.$emit('hideLogSettings')
        this.$message.success('Настройки сохранены')
      } catch (e) {
        this.$message.error('Недостаточно прав для выполнения данной операции')
        this.$emit('hideLogSettings')
        console.log(e)
      }
    }
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
    min-height: 450px;
    overflow: auto;

    & > div {
      column-count:2;
    }
  }
}
</style>