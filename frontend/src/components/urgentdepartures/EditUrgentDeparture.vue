<template>
  <div class="urgent-departure-edit" v-loading="loading">
    <el-form
      :model="form"
      :rules="rules"
      ref="EditUrgentDepartureForm"
      :inline="true"
      label-position="top"
    >
      <div class="form-row">
        <el-form-item
          class="name"
          label="Название"
          prop="name"
        >
          <el-input
            v-model="form.name"
            placeholder="Название выезда"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Формат привязки"
          prop="reserved"
        >
          <el-select v-model="form.reserved" placeholder="">
            <el-option label="Обычный" value="ordinary"></el-option>
            <el-option label="Резерв" value="reserve"></el-option>
            <el-option label="Срочно" value="urgently"></el-option>
          </el-select>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          label="Отъезд"
          prop="date_departure"
        >
          <el-date-picker
            v-model="form.date_departure"
            type="datetime"
            :editable="false"
            placeholder="Выберите дату и время"
            format="dd-MM-yyyy HH:mm"
            :picker-options = "pickerOptions">
          </el-date-picker>
        </el-form-item>
        <el-form-item
          label="Прибытие"
          prop="date_arrival"
        >
          <el-date-picker
            v-model="form.date_arrival"
            type="datetime"
            :editable="false"
            placeholder="Выберите дату и время"
            format="dd-MM-yyyy HH:mm"
            :picker-options = "pickerOptions">
          </el-date-picker>
        </el-form-item>
        <el-form-item
          label="Начало"
          prop="date_start"
        >
          <el-date-picker
            v-model="form.date_start"
            type="datetime"
            :editable="false"
            placeholder="Выберите дату и время"
            format="dd-MM-yyyy HH:mm"
            :picker-options = "pickerOptions">
          </el-date-picker>
        </el-form-item>
        <el-form-item
          label="Окончание"
          prop="date_end"
        >
          <el-date-picker
            v-model="form.date_end"
            type="datetime"
            :editable="false"
            placeholder="Выберите дату и время"
            format="dd-MM-yyyy HH:mm"
            :picker-options = "pickerOptions">
          </el-date-picker>
        </el-form-item>
        <el-form-item
          label="Возвращение"
          prop="date_return"
        >
          <el-date-picker
            v-model="form.date_return"
            type="datetime"
            :editable="false"
            placeholder="Выберите дату и время"
            format="dd-MM-yyyy HH:mm"
            :picker-options = "pickerOptions">
          </el-date-picker>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          class="address"
          label="Адрес"
          prop="address"
        >
          <el-input
            v-model="form.address"
            type="textarea"
          >
          </el-input>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          label="Эфирный план"
          prop="metatheme_inclusion"
        >
          <el-select v-model="form.metatheme_aether_plans" multiple filterable placeholder="">
            <el-option
              v-for="item in metatheme_aether_plans"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
          <el-input
            type="textarea"
            placeholder="Комментарий"
            v-model="form.comment_aether_plans"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Перегоны, включения"
          prop="metatheme_inclusion"
        >
          <el-select v-model="form.metatheme_inclusions" multiple filterable placeholder="">
            <el-option
              v-for="item in metatheme_inclusions"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
          <el-input
            type="textarea"
            placeholder="Комментарий"
            v-model="form.comment_inclusions"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Комментарий"
          prop="comment"
        >
          <el-input
            class="comment"
            type="textarea"
            placeholder="Комментарий"
            v-model="form.comment"
          >
          </el-input>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          label="Комплектовка"
          prop="comment_tech"
        >
          <el-input
            class="comment"
            type="textarea"
            v-model="form.comment_tech"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Транспорт"
          prop="comment_car"
        >
          <el-input
            class="comment"
            type="textarea"
            v-model="form.comment_car"
          >
          </el-input>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          label="Сотрудники"
          prop="employees"
        >
        </el-form-item>
      </div>
    </el-form>
    <span
      slot="footer"
      class="dialog-footer"
    >
      <el-popconfirm
        title="Вы уверены?"
        @confirm="deleteUrgentDeparture"
      >
        <el-button
          class="delete-btn"
          slot="reference"
          type="danger"
        >
          Удалить
        </el-button>
      </el-popconfirm>
      <el-button
        @click="$emit('hideEditUrgentDepartureForm')"
      >
        Отменить
      </el-button>
      <el-button
        type="primary"
      >
        Сотрудники
      </el-button>
      <el-popconfirm
        title="Вы уверены?"
        @confirm="handleSubmit('EditUrgentDepartureForm')"
      >
        <el-button
          class="edit-btn"
          slot="reference"
          type="primary"
        >
          Изменить
        </el-button>
      </el-popconfirm>
    </span>
  </div>
</template>

<script>
export default {
  name: 'editurgentdeparture',
  props: {
    curUrgentDeparture: {
      type: Object,
      required: false
    }
  },
  data: () => ({
    loading: true,
    metatheme_inclusions: [],
    metatheme_aether_plans: [],
    pickerOptions: {
      firstDayOfWeek: 1,
      disabledDate(time) {
        return time.getTime() < Date.now() - 8.64e7
      }
    },
    form: {
      name: null,
      reserved: null,
      date_departure: null,
      date_arrival: null,
      date_start: null,
      date_end: null,
      date_return: null,
      address: null,
      metatheme_aether_plans: null,
      comment_aether_plans: null,
      metatheme_inclusions: null,
      comment_inclusions: null,
      comment: null,
      comment_tech: null,
      comment_car: null
    },
    rules: {
      name: [
        {
          required: true,
          message: "Введите название выезда",
          trigger: "blur",
        }
      ]
    }
  }),
  async mounted() {
    this.metatheme_aether_plans = await this.$store.dispatch('fetchMetathemeAetherPlans')
    this.metatheme_inclusions = await this.$store.dispatch('fetchMetathemeInclusions')
    this.loading = false
  },
  watch: {
    curUrgentDeparture: {
      immediate: true,
      handler: function () {
        if (!this.curUrgentDeparture) {
          return
        }
        let metatheme_aether_plans = []
        let metatheme_inclusions = []
        for(let i = 0; i < this.curUrgentDeparture.metatheme_aether_plans.length; i++) {
          metatheme_aether_plans.push(this.curUrgentDeparture.metatheme_aether_plans[i].id)
        }
        for(let i = 0; i < this.curUrgentDeparture.metatheme_inclusions.length; i++) {
          metatheme_inclusions.push(this.curUrgentDeparture.metatheme_inclusions[i].id)
        }
        this.form.name = this.curUrgentDeparture.name
        this.form.reserved = this.curUrgentDeparture.reserved
        this.form.date_departure = this.curUrgentDeparture.date_departure
        this.form.date_arrival = this.curUrgentDeparture.date_arrival
        this.form.date_start = this.curUrgentDeparture.date_start
        this.form.date_end = this.curUrgentDeparture.date_end
        this.form.date_return = this.curUrgentDeparture.date_return
        this.form.address = this.curUrgentDeparture.address
        this.form.metatheme_aether_plans = metatheme_aether_plans
        this.form.comment_aether_plans = this.curUrgentDeparture.comment_aether_plans
        this.form.metatheme_inclusions = metatheme_inclusions
        this.form.comment_inclusions = this.curUrgentDeparture.comment_inclusions
        this.form.comment = this.curUrgentDeparture.comment
        this.form.comment_tech = this.curUrgentDeparture.comment_tech
        this.form.comment_car = this.curUrgentDeparture.comment_car
      }
    }
  },
  methods: {
    handleSubmit(form) {
      this.$refs[form].validate( async (valid) => {
        if (!valid) {
          return false
        } else {
          try {
            this.loading = true
            let formData = {
              id: this.curUrgentDeparture.id,
              name: this.form.name,
              reserved: this.form.reserved,
              date_departure: this.form.date_departure,
              date_arrival: this.form.date_arrival,
              date_start: this.form.date_start,
              date_end: this.form.date_end,
              date_return: this.form.date_return,
              address: this.form.address,
              metatheme_aether_plans: this.form.metatheme_aether_plans,
              comment_aether_plans: this.form.comment_aether_plans,
              metatheme_inclusions: this.form.metatheme_inclusions,
              comment_inclusions: this.form.comment_inclusions,
              comment: this.form.comment,
              comment_tech: this.form.comment_tech,
              comment_car: this.form.comment_car
            }
            await this.$store.dispatch('editUrgentDeparture', formData)
            .then(async () => {
              this.$emit('edited')
              this.loading = false
              this.$message.success('Срочный выезд обновлен')
            })
          } catch (e) {
            this.$message.error('Недостаточно прав для выполнения данной операции')
            console.log(e)
          }
        }
      })
    },
    async deleteUrgentDeparture() {
      try {
        this.loading = true
        await this.$store.dispatch('deleteUrgentDeparture', this.curUrgentDeparture.id)
        .then(() => {
          this.$emit('edited')
          this.loading = false
          this.$message.success('Срочный выезд удален')
        })
      } catch (e) {
        this.$message.error('Недостаточно прав для выполнения данной операции')
        console.log(e)
      }
    }
  }
}
</script>
<style lang="scss">
.urgent-departure-edit {
  & .form-row {
    display: flex;
    & .name, & .address {
      flex: 1;
    }
    &:nth-child(2) {
      & .el-form-item {
        width: 20%;
        & .el-date-editor.el-input, & .el-date-editor.el-input__inner {
          width: auto;
        }
      }
    }
    &:nth-child(4) {
      & .el-form-item {
        width: 33%;
      }
      & .el-select {
        width: 100%;
      }
    }
    &:nth-child(5) {
      & .el-form-item {
        width: 50%;
      }
    }
  }
  & textarea {
    resize: none;
  }
  & .comment textarea {
    height: 94px;
  }
  & .address textarea {
    height: 55px;
  }
  & .dialog-footer {
    display: block;
    text-align: right;
    & .delete-btn {
      margin-right: 10px;
    }
    & .edit-btn {
      margin-left: 10px;
    }
  }
}
</style>