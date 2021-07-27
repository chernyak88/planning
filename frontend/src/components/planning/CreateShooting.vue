<template>
  <div class="planning-shooting-create" v-loading="loading">
    <el-form
      :model="form"
      :rules="rules"
      ref="CreateShootingForm"
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
        @click="$emit('hideCreateShootingForm')"
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
        @click="handleSubmit('CreateShootingForm')"
      >
        Создать
      </el-button>
    </span>
  </div>
</template>

<script>
export default {
  name: 'createshooting',
  props: {
    theme: {
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
  watch: {
    theme: {
      immediate: true,
      handler: function () {
        if (!this.theme) {
          return
        }
        let metatheme_inclusions = []
        let metatheme_aether_plans = []
        for(let i = 0; i < this.theme.metatheme_inclusions.length; i++) {
          metatheme_inclusions.push(this.theme.metatheme_inclusions[i].id)
        }
        for(let i = 0; i < this.theme.metatheme_aether_plans.length; i++) {
          metatheme_aether_plans.push(this.theme.metatheme_aether_plans[i].id)
        }
        this.form.metatheme_inclusions = metatheme_inclusions
        this.form.comment_aether_plans = this.theme.comment_aether_plans
        this.form.metatheme_aether_plans = metatheme_aether_plans
        this.form.comment_inclusions = this.theme.comment_inclusions
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
              name: this.form.name,
              metatheme: this.theme.id,
              date_start: this.moment(this.form.date_start).format(),
              date_end: this.moment(this.form.date_start).add(4, 'hours').format(),
              address: this.form.address,
              metatheme_aether_plans: this.form.metatheme_aether_plans,
              comment_aether_plans: this.form.comment_aether_plans,
              metatheme_inclusions: this.form.metatheme_inclusions,
              comment_inclusions: this.form.comment_inclusions,
              comment: this.form.comment
            }
            await this.$store.dispatch('createShooting', formData)
            .then(async () => {
              this.$emit('created')
              this.loading = false
              this.$message.success('Съемка добавлена')
            })
          } catch (e) {
            this.$message.error('Недостаточно прав для выполнения данной операции')
            console.log(e)
          }
        }
      })
    }
  }
}
</script>
<style lang="scss">
.planning-shooting-create {
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