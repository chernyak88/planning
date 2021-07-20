<template>
  <div class="urgent-departure-create" v-loading="loading">
    <el-form
      :model="form"
      :rules="rules"
      ref="CreateUrgentDeparture"
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
      <el-button
        @click="$emit('hideCreateUrgentDeparture')"
      >
        Отменить
      </el-button>
      <el-button
        type="primary"
      >
        Сотрудники
      </el-button>
      <el-button
        type="primary"
        @click="handleSubmit('CreateUrgentDeparture')"
      >
        Создать
      </el-button>
    </span>
  </div>
</template>

<script>
export default {
  name: 'createurgentdeparture',
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
      date_start: new Date(),
      address: null,
      metatheme_aether_plans: null,
      comment_aether_plans: null,
      metatheme_inclusions: null,
      comment_inclusions: null,
      comment: null
    },
    rules: {
      name: [
        {
          required: true,
          message: "Введите название выезда",
          trigger: "blur",
        }
      ],
      date_start: [
        {
          required: true,
          message: "Выберите дату и время",
          trigger: "blur",
        }
      ]
    }
  }),
  async mounted() {
    this.metatheme_inclusions = await this.$store.dispatch('fetchMetathemeInclusions')
    this.metatheme_aether_plans = await this.$store.dispatch('fetchMetathemeAetherPlans')
    this.loading = false
  },
  methods: {
    handleSubmit(form) {
      this.$emit('hideCreateUrgentDeparture')
    }
  }
}
</script>
<style lang="scss">
.urgent-departure-create {

  & .form-row {
    display: flex;

    & .name, & .address {
      flex: 1;
    }

    &:nth-child(3) {
      & .el-form-item {
        width: 33%;
      }
      & .el-select {
        width: 100%;
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
    height: 70px;
  }

  & .dialog-footer {
    display: block;
    text-align: right;
  }

}
</style>