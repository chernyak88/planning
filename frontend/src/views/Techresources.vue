<template>
  <div v-loading="loading" class="techresources">
    <div class="heading">
      <div class="heading__left">
        <h1>Технические ресурсы</h1>
        <el-tooltip
          class="item"
          effect="dark"
          content="Добавить ресурс"
          placement="right"
        >
          <el-button
            class="add"
            type="primary"
            icon="el-icon-plus"
            size="mini"
            circle
            @click="createFormVisible = true"
          >
          </el-button>
        </el-tooltip>
      </div>
      <div class="heading__left">
        <el-input
          size="medium"
          class="search-field"
          v-model="searchField"
          placeholder="Поиск"
          :clearable="true"
          @clear="clearFilter"
        >
          <el-button
            slot="append"
            icon="el-icon-search"
            @click="filterTable"
          >
          </el-button>
        </el-input>
        <!-- <el-tooltip
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
        </el-tooltip> -->
        <el-dropdown
          size="medium"
          split-button type="primary"
          :hide-on-click="false"
        >
          <i class="el-icon-s-operation"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.nameColumn">Название</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.typeColumn">Тип</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.locationColumn">Локация</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.statusColumn">Статус</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.actionColumn">Действие</el-checkbox>
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
    <el-table
      id="table"
      ref="table"
      :data="techresources"
      border
      stripe
      @sort-change="sortByColumn"
    >
      <template
        slot="empty"
      >
        <NoData />
      </template>
      <el-table-column
        type="expand"
      >
        <template
          slot-scope="props"
        >
          <div v-html="props.row.comment"></div>
        </template>
      </el-table-column>
      <el-table-column
        label="ID"
        prop="id"
        width="60"
        sortable="custom"
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.nameColumn"
        label="Название"
        prop="name"
        sortable="custom"
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.typeColumn"
        label="Тип"
        prop="type"
        sortable="custom"
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.locationColumn"
        label="Локация"
        prop="location.name"
        sortable="custom"
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.statusColumn"
        label="Статус"
        prop="status.name"
        sortable="custom"
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.actionColumn"
        label="Действие"
        width="90"
      >
        <template
          slot-scope="scope"
        >
          <el-tooltip
            class="item edit"
            effect="dark"
            content="Изменить"
            placement="bottom"
          >
            <el-button
              type="primary"
              icon="el-icon-edit"
              size="mini"
              circle
              @click="fetchTechResourceById(scope.row.id)"
            >
            </el-button>
          </el-tooltip>
          <el-tooltip
            class="item"
            effect="dark"
            content="Удалить"
            placement="bottom"
          >
            <el-popconfirm
              title="Вы уверены?"
              @confirm="deleteTechresource(scope.row.id)"
            >
              <el-button
                slot="reference"
                type="danger"
                icon="el-icon-delete"
                size="mini"
                circle
              >
              </el-button>
            </el-popconfirm>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
      background
      layout="total, sizes, prev, pager, next, jumper"
      :current-page.sync="pagination.page"
      :page-sizes="[2, 5, 10, 20]"
      :page-size="queries.limit"
      :total="pagination.total"
      @size-change="handleSizeChange"
      @current-change="handlerPageChange"
    >
    </el-pagination>

    <el-dialog
      title="Добавление ресурса"
      :visible.sync="createFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
    >
      <CreateTechresource
        @hideCreateForm="hideCreateForm"
        @created="addNewTechresource"
      />
    </el-dialog>

    <el-dialog
      title="Редактирование ресурса"
      :visible.sync="editFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
    >
      <EditTechresource
        :currentTechresource="currentTechresource"
        @hideEditForm="hideEditForm"
        @edited="editTechresource"
      />
    </el-dialog>

  </div>
</template>

<script>
import qs from 'qs'
import pdfMixin from '@/mixins/pdf.mixin.js'
import CreateTechresource from '@/components/techresources/CreateTechresource'
import EditTechresource from '@/components/techresources/EditTechresource'

export default {
  name: 'techresources',
  components: {
    CreateTechresource,
    EditTechresource
  },
  mixins: [pdfMixin],
  data() {
    return {
      loading: true,
      techresources: [],
      createFormVisible: false,
      editFormVisible: false,
      currentTechresource: null,
      searchField: null,
      queries: {
        start: 0,
        limit: 5,
        sort: 'id:asc',
        filter: null
      },
      pagination: {
        page: +this.$route.query.page || 1,
        total: 0
      },
      columnsFilter: {
        nameColumn: true,
        typeColumn: true,
        locationColumn: true,
        statusColumn: true,
        actionColumn: true
      },
      print: {
        id: "table",
        popTitle: 'Технические ресурсы',
      }
    }
  },
  async mounted() {
    const total = await this.$http.get(`${this.$store.state.url}/tech-resources/count`)
    this.pagination.total = total.data
  },
  watch: {
    queries: {
      immediate: true,
      deep: true,
      async handler() {
        this.fetchTechResources()
      }
    }
  },
  methods: {
    hideCreateForm() {
      this.createFormVisible = false
    },
    hideEditForm() {
      this.editFormVisible = false
    },
    handlerPageChange(page) {
      this.$router.push(`${this.$route.path}?page=${page}`)
      this.pagination.page = page
      this.queries.start = this.queries.limit * page - this.queries.limit
    },
    handleSizeChange(size) {
      this.queries.limit = size
    },
    filterTable() {
      if (this.$route.query.page && +this.$route.query.page !== 1) {
        this.$router.push(`${this.$route.path}?page=1`)
        this.pagination.page = 1
      }
      this.queries.filter = this.searchField
    },
    async clearFilter() {
      this.searchField = null
      this.queries.filter = null
      const total = await this.$http.get(`${this.$store.state.url}/tech-resources/count`)
      this.pagination.total = total.data
    },
    sortByColumn(column) {
      if (column.order === 'ascending') {
        this.queries.sort = `${column.prop}:asc`
      } else if (column.order === 'descending') {
        this.queries.sort = `${column.prop}:desc`
      } else {
        this.queries.sort = 'id:asc'
      }
    },
    async exportToPdf() {
      this.loading = true
      try {
        await this.exportToPdfMixin(this.$refs.table.$el, 'Техресурсы')
      } catch (e) {
        console.log(e)
        this.$message.error('Ошибка экспорта')
      }
      this.loading = false
    },
    async fetchTechResources() {
      this.loading = true
      this.queries.start = this.queries.limit * this.pagination.page - this.queries.limit || 0
      let query = ''
      if (this.queries.filter) {
        query = qs.stringify({ _where: {
          _or: [
              { 'id_contains': this.queries.filter },
              { 'name_contains': this.queries.filter },
              { 'type_contains': this.queries.filter },
              { 'location.name_contains': this.queries.filter },
              { 'status.name_contains': this.queries.filter }
            ]
          }
        })
        const total = await this.$http.get(`${this.$store.state.url}/tech-resources/count?${query}`)
        this.pagination.total = total.data
      }
      const techresources = await this.$http({
        method: 'get',
        url: `${this.$store.state.url}/tech-resources?${query}`, 
        params: {
          _start: this.queries.start,
          _limit: this.queries.limit,
          _sort: this.queries.sort
        }
      })
      this.techresources = techresources.data
      this.loading = false
    },
    addNewTechresource() {
      this.createFormVisible = false
      this.loading = true
      this.fetchTechResources()
      this.loading = false
    },
    async deleteTechresource(id) {
      try {
        await this.$store.dispatch('deleteTechresource', id)
        this.fetchTechResources()
        this.$message.success('Тех. ресурс удален')
      } catch (e) {
        this.$message.error('Недостаточно прав для выполнения данной операции')
        console.log(e)
      }
    },
    async fetchTechResourceById(id) {
      this.loading = true
      this.currentTechresource = await this.$store.dispatch('fetchTechResourceById', id)
      this.loading = false
      this.editFormVisible = true
    },
    editTechresource() {
      this.editFormVisible = false
      this.loading = true
      this.fetchTechResources()
      this.loading = false
    }
  }
}
</script>

<style lang="scss">
.techresources {
  & .heading {
    display: flex;
    align-items: center;
    justify-content: space-between;

    &__left {
      display: flex;
      align-items: center;
    }
  }
  & .el-table {
    overflow: inherit;
    &__header-wrapper {
      position: sticky;
      top: 60px;
      z-index: 2;
    }
  }
  & .add {
    margin-left: 10px;
  }
  & .pdf {
    margin-right: 10px;
  }
  & .print {
    margin-right: 20px;
  }
  & .search-field {
    width: 320px;
    margin-right: 20px;
  }
  & .edit {
    margin-right: 10px;
  }
  & .el-pagination {
    margin-top: 30px;
  }
}
</style>