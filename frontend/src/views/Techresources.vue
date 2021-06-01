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
          class="search"
          v-model="search"
          placeholder="Поиск"
          :clearable="true"
        >
          <el-button
            slot="append"
            icon="el-icon-search"
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
      @sort-change="sort"
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
        sortable
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.typeColumn"
        label="Тип"
        prop="type"
        sortable
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.locationColumn"
        label="Локация"
        prop="location.name"
        sortable
      >
      </el-table-column>
      <el-table-column
        v-if="columnsFilter.statusColumn"
        label="Статус"
        prop="status.name"
        sortable
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
      layout="total, prev, pager, next, jumper"
      :current-page="pagination.page"
      :page-size="pagination.limit"
      :total="pagination.total"
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
      search: '',
      createFormVisible: false,
      editFormVisible: false,
      currentTechresource: null,
      pagination: {
        page: +this.$route.query.page || 1,
        total: 0,
        limit: 5,
        start: 0
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
  async mounted() {
    this.pagination.total = await this.$store.dispatch('fetchTechResourcesCount')
    this.techresources = await this.$store.dispatch('fetchTechResources', {
      _start: this.pagination.start,
      _limit: this.pagination.limit
    })
    this.loading = false
  },
  watch: { 
    pagination: {
      immediate: true,
      deep: true,
      handler() {
        this.pagination.start = this.pagination.limit * this.pagination.page - this.pagination.limit || 0
      }
    }
  },
  methods: {
    async sort(e) {
      this.techresources = await this.$store.dispatch('fetchTechResources', {
        _sort: `${e.prop}:desc`,
        _start: this.pagination.start,
        _limit: this.pagination.limit
      })
    },
    hideCreateForm() {
      this.createFormVisible = false
    },
    hideEditForm() {
      this.editFormVisible = false
    },
    async handlerPageChange(page) {
      this.loading = true
      this.$router.push(`${this.$route.path}?page=${page}`)
      this.pagination.start = this.pagination.limit * page - this.pagination.limit
      this.techresources = await this.$store.dispatch('fetchTechResources', {
        _start: this.pagination.start,
        _limit: this.pagination.limit
      })
      this.loading = false
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
.search {
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