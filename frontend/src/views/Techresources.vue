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
          class="search"
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
              <el-checkbox v-model="nameColumn">Название</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="typeColumn">Тип</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="locationColumn">Локация</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="statusColumn">Статус</el-checkbox>
            </el-dropdown-item>
            <el-dropdown-item>
              <el-checkbox v-model="actionColumn">Действие</el-checkbox>
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
        type="index"
        width="50"
      >
      </el-table-column>
      <el-table-column
        v-if="nameColumn"
        label="Название"
        prop="name"
        sortable
      >
      </el-table-column>
      <el-table-column
        v-if="typeColumn"
        label="Тип"
        prop="type"
        sortable
      >
      </el-table-column>
      <el-table-column
        v-if="locationColumn"
        label="Локация"
        prop="location.name"
        sortable
      >
      </el-table-column>
      <el-table-column
        v-if="statusColumn"
        label="Статус"
        prop="status.name"
        sortable
      >
      </el-table-column>
      <el-table-column
        v-if="actionColumn"
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
import CreateTechresource from '@/components/techresources/CreateTechresource'
import EditTechresource from '@/components/techresources/EditTechresource'

export default {
  name: 'techresources',
  components: {
    CreateTechresource,
    EditTechresource
  },
  data: () => ({
    loading: true,
    techresources: [],
    createFormVisible: false,
    editFormVisible: false,
    currentTechresource: null,
    nameColumn: true,
    typeColumn: true,
    locationColumn: true,
    statusColumn: true,
    actionColumn: true,
  }),
  async mounted() {
    this.techresources = await this.$store.dispatch('fetchTechResources', {_limit: -1})
    this.loading = false
  },
  methods: {
    hideCreateForm() {
      this.createFormVisible = false
    },
    hideEditForm() {
      this.editFormVisible = false
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