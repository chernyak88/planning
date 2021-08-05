<template>
  <div v-loading="loading" class="employees">
    <div class="heading">
      <div class="heading__left">
        <h1>Сотрудники. Страница управления</h1>
        <el-tooltip
          class="item"
          effect="dark"
          content="Добавить сотрудника"
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
        <el-dropdown
          size="medium"
          split-button type="primary"
          :hide-on-click="false"
        >
          <i class="el-icon-s-operation"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.nameColumn">ФИО</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.locationColumn">Локация</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.roleColumn">Роль</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.phoneColumn">Телефон</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="columnsFilter.actionColumn">Действие</el-checkbox>
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
    <el-table
      ref="table"
      :data="employees"
      border
      stripe
      @sort-change="sortByColumn"
      @filter-change="filterByColumn"
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
          <div class="comment">
              <div>Комментарий:</div>
              <div v-html="props.row.comment"></div>
          </div>
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
        label="ФИО"
        width="350"
        prop="surname"
        :formatter="formatNameColumn"
        sortable="custom"
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.locationColumn"
        label="Локация"
        prop="location.name"
        sortable="custom"
        :filters="[{ text: 'Москва', value: 'Москва' }, { text: 'Санкт-Петербург', value: 'Санкт-Петербург' }, { text: 'Регионы', value: 'Регионы' }, { text: 'Мир', value: 'Мир' }]"
        :filter-multiple="false"
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.roleColumn"
        label="Роль"
        prop="employee_role.name"
        sortable="custom"
        :filters="[{ text: 'Home', value: 'Home' }, { text: 'Office', value: 'Office' }]"
        :filter-multiple="false"
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.phoneColumn"
        label="Телефон"
        prop="phone"
        :formatter="formatPhoneColumn"
        sortable="custom"
        width="140"
        :filters="[{ text: 'Home', value: 'Home' }, { text: 'Office', value: 'Office' }]"
        :filter-multiple="false"
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
            content="Редактировать информацию"
            placement="bottom"
          >
            <el-button
              type="primary"
              icon="el-icon-edit"
              size="mini"
              circle
              @click="fetchEmployeeById(scope.row.id)"
            >
            </el-button>
          </el-tooltip>
          <el-tooltip
            class="item"
            effect="dark"
            content="Календарь сотрудника"
            placement="bottom"
          >
            <el-button
              type="success"
              icon="el-icon-date"
              size="mini"
              circle
              @click="$router.push(`/employee/${scope.row.id}`)"
            >
            </el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
      background
      layout="total, sizes, prev, pager, next, jumper"
      :current-page.sync="pagination.page"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="queries.limit"
      :total="pagination.total"
      @size-change="handleSizeChange"
      @current-change="handlerPageChange"
    >
    </el-pagination>

    <el-dialog
      title="Добавление сотрудника"
      :visible.sync="createFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
    >
      <CreateEmployee
        @hideCreateForm="hideCreateForm"
        @created="updateEmployee"
      />
    </el-dialog>

    <el-dialog
      title="Редактирование информации"
      :visible.sync="editFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
    >
      <EditEmployee
        :currentEmployee="currentEmployee"
        @hideEditForm="hideEditForm"
        @edited="updateEmployee"
      />
    </el-dialog>
  </div>
</template>

<script>
import qs from 'qs'
import CreateEmployee from '@/components/employees/CreateEmployee'
import EditEmployee from '@/components/employees/EditEmployee'

export default {
  name: 'employee',
  components: {
    CreateEmployee,
    EditEmployee
  },
  data() {
    return {
      loading: true,
      employees: [],
      createFormVisible: false,
      editFormVisible: false,
      currentEmployee: null,
      searchField: null,
      queries: {
        start: 0,
        limit: 20,
        sort: 'id:asc',
        filter: null,
        locationFilter: null,
        roleFilter: null,
        phoneFilter: null
      },
      pagination: {
        page: +this.$route.query.page || 1,
        total: 0
      },
      columnsFilter: {
        nameColumn: true,
        locationColumn: true,
        roleColumn: true,
        phoneColumn: true,
        actionColumn: true
      }
    }
  },
  async mounted() {
    const total = await this.$http.get(`${this.$store.state.url}/employees/count`)
    this.pagination.total = total.data
  },
  watch: {
    queries: {
      immediate: true,
      deep: true,
      async handler() {
        this.fetchEmployees()
      }
    }
  },
  methods: {
    formatNameColumn(row) {
      const surname = row.surname ? row.surname : ''
      const name = row.name ? row.name : ''
      const patronymic = row.patronymic ? row.patronymic : ''
      return `${surname} ${name} ${patronymic}`
    },
    formatPhoneColumn(row) {
      const phone = row.phone ? row.phone : ''
      const phone_2 = row.phone_2 ? row.phone_2 : ''
      return `${phone} ${phone_2}`
    },
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
      const total = await this.$http.get(`${this.$store.state.url}/employees/count`)
      this.pagination.total = total.data
    },
    filterByColumn() {
      const columns = this.$refs.table.columns
      for (let i = 0; i < columns.length; i++) {
        if (columns[i].property === 'location.name') {
          this.queries.locationFilter = columns[i].filteredValue[0]
        }
        if (columns[i].property === 'employee_role.name') {
          this.queries.roleFilter = columns[i].filteredValue[0]
        }
        if (columns[i].property === 'phone') {
          this.queries.phoneFilter = columns[i].filteredValue[0]
        }
      }
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
    async fetchEmployees() {
      this.loading = true
      this.queries.start = this.queries.limit * this.pagination.page - this.queries.limit || 0
      let query = ''
      if (this.queries.filter) {
        query = qs.stringify({ _where: {
          _or: [
              { 'id_contains': this.queries.filter },
              { 'surname_contains': this.queries.filter },
              { 'name_contains': this.queries.filter },
              { 'patronymic_contains': this.queries.filter },
              { 'location.name_contains': this.queries.filter },
              { 'employee_role.name_contains': this.queries.filter },
              { 'phone_contains': this.queries.filter }
            ],
          }
        })
        const total = await this.$http.get(`${this.$store.state.url}/employees/count?${query}`)
        this.pagination.total = total.data
      }
      const employees = await this.$http({
        method: 'get',
        url: `${this.$store.state.url}/employees?${query}`, 
        params: {
          _start: this.queries.start,
          _limit: this.queries.limit,
          _sort: this.queries.sort
        }
      })
      this.employees = employees.data
      this.loading = false
    },
    async fetchEmployeeById(id) {
      this.loading = true
      this.currentEmployee = await this.$store.dispatch('fetchEmployeeById', id)
      this.loading = false
      this.editFormVisible = true
    },
    updateEmployee() {
      this.createFormVisible = false
      this.editFormVisible = false
      this.loading = true
      this.fetchEmployees()
      this.loading = false
    }
  }
}
</script>

<style lang="scss">
.employees {
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
    & .comment {
      background-color: #ecf5ff;
      padding: 10px;
      padding-bottom: 20px;
    }
  }
  & .add {
    margin-left: 10px;
  }
  & .search-field {
    width: 320px;
    margin-right: 20px;
  }
  & .el-pagination {
    margin-top: 30px;
  }
}
</style>