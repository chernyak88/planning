<template>
  <div v-loading="loading">
    <div class="urgentdepartures-heading">
      <el-input
        size="medium"
        class="search-field"
        v-model="searchField"
        placeholder="Поиск"
        :clearable="true"
      >
        <el-button
          slot="append"
          icon="el-icon-search"
        >
        </el-button>
      </el-input>
      <el-tooltip class="item" effect="dark" content="Обновить" placement="bottom">
        <el-button
          class="refresh-btn"
          type="primary"
          size="medium"
          icon="el-icon-refresh"
          @click="fetchUrgentDepartures"
        >
        </el-button>
      </el-tooltip>
      <el-dropdown
        size="medium"
        split-button type="primary"
        :hide-on-click="false"
      >
        <i class="el-icon-s-operation"></i>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>
            <el-checkbox v-model="columnsFilter.dateStartColumn">Начало</el-checkbox>
          </el-dropdown-item>
          <el-dropdown-item>
            <el-checkbox v-model="columnsFilter.dateReturnColumn">Возвр.</el-checkbox>
          </el-dropdown-item>
          <el-dropdown-item>
            <el-checkbox v-model="columnsFilter.nameColumn">Название съемки</el-checkbox>
          </el-dropdown-item>
          <el-dropdown-item>
            <el-checkbox v-model="columnsFilter.commentColumn">Комментарий</el-checkbox>
          </el-dropdown-item>
          <el-dropdown-item>
            <el-checkbox v-model="columnsFilter.orderColumn">Заказ</el-checkbox>
          </el-dropdown-item>
          <el-dropdown-item>
            <el-checkbox v-model="columnsFilter.corrsColumn">Корреспонденты</el-checkbox>
          </el-dropdown-item>
          <el-dropdown-item>
            <el-checkbox v-model="columnsFilter.shootingColumn">Съемочная группа</el-checkbox>
          </el-dropdown-item>
          <el-dropdown-item>
            <el-checkbox v-model="columnsFilter.carsColumn">Машины</el-checkbox>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    <div class="el-table urgentdepartures-table el-table--border">
      <table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 100%;">
        <thead>
          <tr>
            <th colspan="1" rowspan="1" width="44"><div class="cell"></div></th>
            <th v-if="columnsFilter.dateStartColumn" colspan="1" rowspan="1" width="100" :class="dateStartClass" @click="dateStartSort">
              <div class="cell">
                Начало
                <span class="caret-wrapper">
                  <i class="sort-caret ascending"></i>
                  <i class="sort-caret descending"></i>
                </span>
              </div>
            </th>
            <th v-if="columnsFilter.dateReturnColumn" colspan="1" rowspan="1" width="96" :class="dateEndClass" @click="dateEndSort">
              <div class="cell">
                Возвр.
                <span class="caret-wrapper">
                  <i class="sort-caret ascending"></i>
                  <i class="sort-caret descending"></i>
                </span>
              </div>
            </th>
            <th v-if="columnsFilter.nameColumn" colspan="1" rowspan="1"><div class="cell">Название съемки</div></th>
            <th v-if="columnsFilter.commentColumn" colspan="1" rowspan="1" width="120"><div class="cell">Комментарий</div></th>
            <th v-if="columnsFilter.orderColumn" colspan="1" rowspan="1" width="120"><div class="cell">Заказ</div></th>
            <th v-if="columnsFilter.corrsColumn" colspan="1" rowspan="1" width="140"><div class="cell">Корреспонденты</div></th>
            <th v-if="columnsFilter.shootingColumn" colspan="1" rowspan="1" width="155"><div class="cell">Съемочная группа</div></th>
            <th v-if="columnsFilter.carsColumn" colspan="1" rowspan="1" width="120"><div class="cell">Машины</div></th>
          </tr>
        </thead>
        <tbody v-if="urgentdepartures.length === 0">
          <tr class="el-table__row">
            <td rowspan="1" colspan="9" class="centered">
              <div class="cell">
                <NoData />
              </div>
            </td>
          </tr>
        </tbody>
        <tbody v-else v-for="item in urgentdepartures" :key="item.id">
          <tr class="el-table__row el-table__row--level-1">
            <td rowspan="1" colspan="1" class="el-table__expand-column">
              <div class="cell">
                <div class="el-table__expand-icon" :class="{ rotate: item.expand_row }" @click="showExpandRow(item)">
                  <i class="el-icon el-icon-arrow-right"></i>
                </div>
              </div>
            </td>
            <td v-if="columnsFilter.dateStartColumn" class="center" rowspan="1" colspan="1">
              <div v-if="item.date_start" class="cell bold">{{ moment(item.date_start).format('HH:mm') }}</div>
              <div v-if="item.date_start" class="cell">{{ moment(item.date_start).format('DD/MM') }}</div>
            </td>
            <td v-if="columnsFilter.dateReturnColumn" rowspan="1" colspan="1">
              <div v-if="item.date_return" class="cell bold">{{ moment(item.date_return).format('HH:mm') }}</div>
              <div v-if="item.date_return" class="cell">{{ moment(item.date_return).format('DD/MM') }}</div>
            </td>
            <td v-if="columnsFilter.nameColumn" rowspan="1" colspan="1">
              <div class="cell urgentdeparture-name">
                <el-tooltip class="item" effect="dark" content="Редактировать срочный выезд" placement="bottom">
                  <el-popover
                    placement="top-start"
                    width="200"
                    trigger="hover"
                    :content="`${item.name} (${itemReserved(item.reserved)})`">
                    <el-button slot="reference" type="warning" @click="showEditUrgentDepartureForm(item)">{{ item.name }} ({{ itemReserved(item.reserved) }})</el-button>
                  </el-popover>
                </el-tooltip>
                <el-tooltip class="item" effect="dark" content="Добавить срочный выезд" placement="bottom">
                  <el-button type="info" size="mini" @click="createUrgentDepartureVisible = true">
                    <i class="el-icon-circle-plus"></i>
                  </el-button>
                </el-tooltip>
                <el-tooltip class="item" effect="dark" content="Редактировать срочный выезд" placement="bottom">
                  <el-button type="info" size="mini" @click="showEditUrgentDepartureForm(item)">
                    <i class="el-icon-edit"></i>
                  </el-button>
                </el-tooltip>
                <div class="cell urgentdeparture-address" v-if="item.address">
                  {{ item.address }}
                </div>
              </div>
            </td>
            <td v-if="columnsFilter.commentColumn" rowspan="1" colspan="1">
              <div class="cell">{{ item.comment }}</div>
            </td>
            <td v-if="columnsFilter.orderColumn" rowspan="1" colspan="1">
              <div class="cell">
                <el-tag size="mini" v-for="elem in item.metatheme_aether_plans" :key="'AP'+elem.id">{{ elem.name }}</el-tag>
                <p>{{ item.comment_aether_plans }}</p>
              </div>
            </td>
            <td v-if="columnsFilter.corrsColumn" rowspan="1" colspan="1">
              <div class="cell centered">
                <el-link type="primary">добавить</el-link>
              </div>
            </td>
            <td v-if="columnsFilter.shootingColumn" rowspan="1" colspan="1">
              <div class="cell">
                
              </div>
            </td>
            <td v-if="columnsFilter.carsColumn" rowspan="1" colspan="1">
              <div class="cell">
                
              </div>
            </td>
          </tr>
          <tr v-if="item.expand_row === true">
            <td rowspan="1" :colspan="expandRowColspan">
              <div class="cell">
                <p class="bold">Комплектовка: {{ item.comment_tech }}</p>
                <p class="bold">Транспорт: {{ item.comment_car }}</p>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <el-dialog
      class="urgent-departures__create-departure"
      title='Создание Съемки в теме "Срочные выезды"'
      :visible.sync="createUrgentDepartureVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
      @close="hideCreateUrgentDeparture"
    >
      <CreateUrgentDeparture
        @hideCreateUrgentDeparture="hideCreateUrgentDeparture"
        @created="addNewUrgentDeparture"
      />
    </el-dialog>

    <el-dialog
      class="urgent-departures__edit-departure"
      :title="editFormTitle"
      :visible.sync="editUrgentDepartureVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
      @close="hideEditUrgentDeparture"
    >
      <EditUrgentDeparture
        :curUrgentDeparture="curUrgentDeparture"
        @hideEditUrgentDeparture="hideEditUrgentDeparture"
        @edited="editUrgentDeparture"
      />
    </el-dialog>
  </div>
</template>

<script>
import qs from 'qs'
import CreateUrgentDeparture from '@/components/urgentdepartures/CreateUrgentDeparture'
import EditUrgentDeparture from '@/components/urgentdepartures/EditUrgentDeparture'

export default {
  name: 'urgentdepartures',
  components: {
    CreateUrgentDeparture,
    EditUrgentDeparture
  },
  data() {
    return {
      loading: false,
      urgentdepartures: [],
      createUrgentDepartureVisible: false,
      editUrgentDepartureVisible: false,
      editFormTitle: null,
      curUrgentDeparture: null,
      searchField: null,
      dateStartClass: 'ascending',
      dateEndClass: null,
      columnsFilter: {
        dateStartColumn: true,
        dateReturnColumn: true,
        nameColumn: true,
        commentColumn: true,
        orderColumn: true,
        corrsColumn: true,
        shootingColumn: true,
        carsColumn: true
      }
    }
  },
  async mounted() {
    if (!this.$route.query.date) {
      this.fetchUrgentDepartures()
    }
  },
  watch: {
  '$store.state.urgentdepartures.urgentUpdated': function () {
    this.fetchUrgentDepartures()
   }
  },
  computed: {
    expandRowColspan() {
      let cols = 1
      for (let key in this.columnsFilter) {
        if (this.columnsFilter[key]) {
          cols++
        }
      }
      return cols
    }
  },
  methods: {
    async fetchUrgentDepartures() {
      this.loading = true
      const query = qs.stringify({ _where: {
        _or: [
            [
              { 'date_start_gte': this.$store.state.urgentdepartures.dateUrgentDepartures },
              { 'date_start_lte': this.moment(this.$store.state.urgentdepartures.dateUrgentDepartures).add(this.$store.state.urgentdepartures.rangeUrgentDepartures, 'days').set({hour:23,minute:59,second:59,millisecond:0}).format() }
            ]
          ]
        }
      })
      this.urgentdepartures = await this.$store.dispatch('fetchUrgentDepartures', {query})
      this.loading = false
    },
    showExpandRow(item) {
      item.expand_row ? this.$set(item, 'expand_row', false) : this.$set(item, 'expand_row', true)
    },
    dateStartSort() {
      this.dateEndClass = null
      if (this.dateStartClass === 'ascending') {
        this.dateStartClass = 'descending'
        this.$store.commit('setSortUrgentDepartures', 'date_start:desc')
        this.fetchUrgentDepartures()
      } else {
        this.dateStartClass = 'ascending'
        this.$store.commit('setSortUrgentDepartures', 'date_start:asc')
        this.fetchUrgentDepartures()
      }
    },
    dateEndSort() {
      this.dateStartClass = null
      if (this.dateEndClass === 'ascending') {
        this.dateEndClass = 'descending'
        this.$store.commit('setSortUrgentDepartures', 'date_return:desc')
        this.fetchUrgentDepartures()
      } else {
        this.dateEndClass = 'ascending'
        this.$store.commit('setSortUrgentDepartures', 'date_return:asc')
        this.fetchUrgentDepartures()
      }
    },
    itemReserved(reserved) {
      switch (reserved) {
        case 'ordinary':
          return 'Обычный'
        case 'reserve':
          return 'Резерв'
        case 'urgently':
          return 'Срочно'
      }
    },
    showEditUrgentDepartureForm(item) {
      this.curUrgentDeparture = item
      this.editFormTitle = `Изменение срочного выезда "${item.name}"`
      this.editUrgentDepartureVisible = true
    },
    hideCreateUrgentDeparture() {
      this.createUrgentDepartureVisible = false
    },
    hideEditUrgentDeparture() {
      this.editUrgentDepartureVisible = false
    },
    addNewUrgentDeparture() {
      this.createUrgentDepartureVisible = false
      this.fetchUrgentDepartures()
    },
    editUrgentDeparture() {
      this.editUrgentDepartureVisible = false
      this.fetchUrgentDepartures()
    }
  }
}
</script>

<style lang="scss">
.urgentdepartures-heading {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 15px;
  & .search-field {
    width: 320px;
    margin-right: 20px;
  }
  & .refresh-btn {
    margin-right: 1px;
  }
}
.urgentdepartures-table {
  & .bold {
    font-weight: bold;
  }
  & .centered {
    text-align: center;
  }
  & .cell {
    word-break: keep-all;
  }
  & .el-table__expand-icon {
    transition: transform .2s ease-in-out;
    &.rotate {
      transform: rotate(90deg);
    }
  }
  & .urgentdeparture-name .el-button {
    max-width: 300px;
    overflow: hidden;
    white-space: nowrap;
    display: inline-block;
    text-overflow: ellipsis;
    font-size: 12px;
    padding: 7px 8px;
    margin: 0;
    &:nth-child(1) {
      border-radius: 3px 0 0 3px;
    }
    &:nth-child(2) {
      border-radius: 0;
    }
    &:nth-child(3) {
      border-radius: 0 3px 3px 0;
    }
  }
  .urgentdeparture-address {
    background: #ecf5ff;
    padding: 10px;
  }
}
.urgent-departures__create-departure .el-dialog,
.urgent-departures__edit-departure .el-dialog {
  width: 950px;
}
</style>