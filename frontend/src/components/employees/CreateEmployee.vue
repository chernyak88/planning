<template>
  <div class="employee-create">
    <el-form
      :model="form"
      :rules="rules"
      ref="createEmployeeForm"
      :inline="true"
      label-position="top"
    >
      <div class="form-row">
        <el-form-item
          label="Фамилия"
          prop="surname"
        >
          <el-input
            v-model="form.surname"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Имя"
          prop="name"
        >
          <el-input
            v-model="form.name"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Отчество"
          prop="patronymic"
        >
          <el-input
            v-model="form.patronymic"
          >
          </el-input>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          label="Телефон"
          prop="phone"
        >
          <el-input
            v-model="form.phone"
            suffix-icon="el-icon-phone"
            placeholder="+7 999 999-99-99"
            v-mask="'+7 ### ###-##-##'"
            @focus="phoneFocus"
          >
          </el-input>
          <el-checkbox
            v-model="phone_2"
          >
            Дополнительный телефон
          </el-checkbox>
          <el-input
            v-if="phone_2"
            v-model="form.phone_2"
            suffix-icon="el-icon-phone"
            placeholder="+7 999 999-99-99"
            v-mask="'+7 ### ###-##-##'"
            @focus="phoneFocus"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Роль"
          prop="employee_role"
        >
          <el-select
            v-model="form.employee_role"
            placeholder="Выберите роль"
          >
            <el-option
              v-for="role in roles"
              :key="role.id"
              :label="role.name"
              :value="role.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          label="Локация"
          prop="location"
        >
          <el-select
            v-model="form.location"
            placeholder="Выберите локацию"
          >
            <el-option
              v-for="location in locations"
              :key="location.id"
              :label="location.name"
              :value="location.id">
            </el-option>
          </el-select>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          label="Общий комментарий"
          prop="comment"
        >
          <vue-editor
            v-model="form.comment"
            :editorToolbar="textEditorToolbar"
          >
          </vue-editor>
        </el-form-item>
      </div>
    </el-form>
    <span
      slot="footer"
      class="dialog-footer"
    >
      <el-button
        @click="$emit('hideCreateForm')"
      >
        Отмена
      </el-button>
      <el-button
        type="primary"
        @click="handleSubmit('createEmployeeForm')"
      >
        Добавить
      </el-button>
    </span>
  </div>
</template>

<script>
import { mask } from 'vue-the-mask'
import { VueEditor } from 'vue2-editor'
import textEditorMixin from '@/mixins/texteditor.mixin.js'

export default {
  name: 'createemployee',
  components: {
    VueEditor
  },
  directives: {
    mask
  },
  mixins: [textEditorMixin],
  data: () => ({
    roles: [],
    locations: [],
    phone_2: false,
    form: {
      name: null,
      surname: null,
      patronymic: null,
      phone: null,
      phone_2: null,
      employee_role: null,
      location: null,
      comment: null
    },
    rules: {
      name: [
        {
          required: true,
          message: "Введите имя",
          trigger: "blur",
        }
      ],
      surname: [
        {
          required: true,
          message: "Введите фамилию",
          trigger: "blur",
        }
      ],
      employee_role: [
        {
          required: true,
          message: "Выберите роль",
          trigger: "blur",
        }
      ],
      location: [
        {
          required: true,
          message: "Выберите локацию",
          trigger: "blur",
        }
      ]
    }
  }),
  async mounted() {
    this.roles = await this.$store.dispatch('fetchEmployeesRoles')
    this.locations = await this.$store.dispatch('fetchLocations')
  },
  watch: {
    phone_2: {
      handler: function () {
        if (!this.phone_2) {
          this.form.phone_2 = null
        }
      }
    },
  },
  methods: {
    phoneFocus(e) {
      if (!e.srcElement.value) {
        e.srcElement.value = '+7 '
      }
    },
    handleSubmit(form) {
     this.$refs[form].validate( async (valid) => {
        if (!valid) {
          return false
        } else {
          try {
            let formData = {
              name: this.form.name,
              surname: this.form.surname,
              patronymic: this.form.patronymic,
              phone: this.form.phone,
              phone_2: this.form.phone_2,
              location: this.form.location,
              employee_role: this.form.employee_role,
              comment: this.form.comment
            }
            await this.$store.dispatch('createEmployee', formData)
            .then(() => {
              this.$emit('created')
              this.$message.success('Сотрудник добавлен')
              this.$refs[form].resetFields()
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
.employee-create {
  & .el-form--label-top .el-form-item__label {
    padding: 0;
  }
  & .form-row {
    display: flex;
    & .el-form-item {
      width: 33%;
      &:last-child {
        margin-right: 0;
      }
    }
    &:last-child .el-form-item {
      width: 100%;
    }
  }
  .el-checkbox__label {
    padding-left: 5px;
    font-size: 12px;
  }
}
</style>