<template>
  <div>
    <el-button
      class="planning-shooting-add-btn"
      type="primary"
      size="mini"
      @click="showCreateShootingForm(theme)"
    >
      Добавить группу
    </el-button>
    <div class="el-table planning-shooting-table el-table--border" v-if="theme.shootings.length > 0">
      <table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 100%;">
        <thead>
          <tr>
            <th colspan="1" rowspan="1" width="44"><div class="cell"></div></th>
            <th colspan="1" rowspan="1" width="80" class="ascending">
              <div class="cell">
                Нач.
                <span class="caret-wrapper">
                  <i class="sort-caret ascending"></i>
                  <i class="sort-caret descending"></i>
                </span>
              </div>
            </th>
            <th colspan="1" rowspan="1" width="88" class="ascending">
              <div class="cell">
                Окон.
                <span class="caret-wrapper">
                  <i class="sort-caret ascending"></i>
                  <i class="sort-caret descending"></i>
                </span>
              </div>
            </th>
            <th colspan="1" rowspan="1" width="350"><div class="cell">Группа выезда</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Адрес</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Корреспонденты</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Съемочная группа</div></th>
            <th colspan="1" rowspan="1"><div class="cell">Машины</div></th>
            <th colspan="1" rowspan="1" width="100"><div class="cell">Статус</div></th>
          </tr>
        </thead>
        <tbody v-for="item in theme.shootings" :key="item.id">
          <tr class="el-table__row el-table__row--level-1">
            <td rowspan="1" colspan="1" class="el-table__expand-column">
              <div class="cell">
                <div class="el-table__expand-icon" :class="{ rotate: item.expand_row }" @click="item.expand_row = !item.expand_row">
                  <i class="el-icon el-icon-arrow-right"></i>
                </div>
              </div>
            </td>
            <td class="center" rowspan="1" colspan="1">
              <div class="cell bold">{{ moment(item.date_start).format('HH:mm') }}</div>
              <div class="cell">{{ moment(item.date_start).format('DD/MM') }}</div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell bold">{{ moment(item.date_end).format('HH:mm') }}</div>
              <div class="cell">{{ moment(item.date_end).format('DD/MM') }}</div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell shooting-name">
                <el-tooltip class="item" effect="dark" content="Редактировать группу" placement="bottom">
                  <el-popover
                    placement="top-start"
                    width="200"
                    trigger="hover"
                    :content="`${item.name} (${itemReserved(item.reserved)})`">
                    <el-button slot="reference" type="warning">{{ item.name }} ({{ itemReserved(item.reserved) }})</el-button>
                  </el-popover>
                </el-tooltip>
                <el-tooltip class="item" effect="dark" content="Добавить группу" placement="bottom">
                  <el-button type="info" size="mini" @click="showCreateShootingForm(theme)">
                    <i class="el-icon-circle-plus"></i>
                  </el-button>
                </el-tooltip>
                <el-tooltip class="item" effect="dark" content="Редактировать группу" placement="bottom">
                  <el-button type="info" size="mini">
                    <i class="el-icon-edit"></i>
                  </el-button>
                </el-tooltip>
              </div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell">{{ item.address }}</div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell centered">
                <el-link type="primary">добавить</el-link>
              </div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell centered">
                <el-link type="primary">добавить</el-link>
              </div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell centered">
                <el-link type="primary">добавить</el-link>
              </div>
            </td>
            <td rowspan="1" colspan="1">
              <div class="cell status-btn">
                <el-tooltip class="item" effect="dark" content="Координация статус" placement="bottom">
                  <el-button type="info" size="mini">
                    К <i class="el-icon-minus"></i>
                  </el-button>
                </el-tooltip>
                <el-tooltip class="item" effect="dark" content="Аккредитация статус" placement="bottom">
                  <el-button type="info" size="mini">
                    А <i class="el-icon-minus"></i>
                  </el-button>
                </el-tooltip>
              </div>
            </td>
          </tr>
          <tr v-if="item.expand_row === true">
            <td rowspan="1" colspan="9">
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
      class="planning-shooting-create-form"
      :title="createFormTitle"
      :visible.sync="createFormVisible"
      :destroy-on-close="true"
      :close-on-press-escape="false"
      :close-on-click-modal="false"
      @close="hideCreateShootingForm"
    >
      <CreateShooting
        :theme="theme"
        @hideCreateShootingForm="hideCreateShootingForm"
        @created="addNewShooting"
      />
    </el-dialog>
  </div>
</template>
<script>
import CreateShooting from '@/components/planning/CreateShooting'

export default {
  name: 'planningshooting',
  components: {
    CreateShooting
  },
  props: {
    theme: {
      type: Object,
      required: false
    }
  },
  data() {
    return {
      createFormVisible: false,
      createFormTitle: null
    }
  },
  methods: {
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
    showCreateShootingForm(theme) {
      this.createFormTitle = `Создание Съемки в теме "${theme.name}"`
      this.createFormVisible = true
    },
    hideCreateShootingForm() {
      this.createFormTitle = null
      this.createFormVisible = false
    },
    addNewShooting() {
      this.createFormTitle = null
      this.createFormVisible = false
    }
  }
}
</script>
<style lang="scss">
.planning-shooting-table {
  & th, & td {
    background: #ecf5ff;
  }
  & .shooting-name .el-button {
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
}
.planning-shooting-add-btn {
  margin-bottom: 10px;
}
.planning-shooting-create-form .el-dialog {
  width: 950px;
}
</style>