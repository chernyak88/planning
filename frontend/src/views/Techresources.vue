<template>
  <div v-loading="loading">
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
          @clear="filterTable"
        >
          <el-button
            slot="append"
            icon="el-icon-search"
            @click="filterTable"
          >
          </el-button>
        </el-input>
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
      :data="techresources"
      style="width: 100%"
      border
      stripe
      @sort-change="sortByColumn"
    >
      <el-table-column
        type="expand"
      >
        <template
          slot-scope="props"
        >
          <p>{{ props.row.comment }}</p>
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
    >
      <CreateTechresource
        @hideCreateForm="hideCreateForm"
        @created="addNewTechresource"
      />
    </el-dialog>

    <el-dialog
      title="Редактирование ресурса"
      :visible.sync="editFormVisible"
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
import CreateTechresource from '@/components/techresources/CreateTechresource'
import EditTechresource from '@/components/techresources/EditTechresource'

export default {
  name: 'techresources',
  components: {
    CreateTechresource,
    EditTechresource
  },
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
      }
    }
  },
  watch: {
    queries: {
      immediate: true,
      deep: true,
      async handler() {
        this.queries.start = this.queries.limit * this.pagination.page - this.queries.limit || 0
        const query = qs.stringify({ _where: {
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
    async filterTable() {
      if (this.$route.query.page && +this.$route.query.page !== 1) {
        this.$router.push(`${this.$route.path}?page=1`)
        this.pagination.page = 1
      }
      this.queries.filter = this.searchField
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
    async addNewTechresource() {
      this.createFormVisible = false
      this.loading = true
      this.techresources = await this.$store.dispatch('fetchTechResources')
      this.loading = false
    },
    async deleteTechresource(id) {
      try {
        await this.$store.dispatch('deleteTechresource', id)
        this.techresources = await this.$store.dispatch('fetchTechResources')
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
    async editTechresource() {
      this.editFormVisible = false
      this.loading = true
      this.techresources = await this.$store.dispatch('fetchTechResources')
      this.loading = false
    }
  }
}
</script>

<style lang="scss" scoped>
.heading {
  display: flex;
  align-items: center;
  justify-content: space-between;

  &__left {
    display: flex;
    align-items: center;
  }
}
.add {
  margin-left: 10px;
}
.search-field {
  width: 320px;
  margin-right: 20px;
}
.edit {
  margin-right: 10px;
}
.el-pagination {
  margin-top: 30px;
}
</style>