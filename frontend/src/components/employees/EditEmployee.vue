<template>
  <div class="employee-edit">
    <el-form
      :model="form"
      :rules="rules"
      ref="editEmployeeForm"
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
          label="Дата рождения"
          prop="birthdate"
        >
          <el-input
            v-model="form.birthdate"
            v-mask="'##.##.####'"
            placeholder="__.__.____"
          >
          </el-input>
        </el-form-item>
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
        </el-form-item>
        <el-form-item
          label="Доп. телефон"
          prop="phone_2"
        >
          <el-input
            v-model="form.phone_2"
            suffix-icon="el-icon-phone"
            placeholder="+7 999 999-99-99"
            v-mask="'+7 ### ###-##-##'"
            @focus="phoneFocus"
          >
          </el-input>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          label="Должность"
          prop="rank"
        >
          <el-input
            v-model="form.rank"
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
          label="Паспорт"
          prop="passport"
        >
          <el-input
            v-model="form.passport"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Заграничный паспорт"
          prop="foreign_passport"
        >
          <el-input
            v-model="form.foreign_passport"
          >
          </el-input>
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
      <el-popconfirm
        title="Вы уверены?"
        @confirm="deleteEmployee"
      >
        <el-button
          slot="reference"
          type="danger"
        >
          Удалить
        </el-button>
      </el-popconfirm>
      <el-button
        class="cancel-btn"
        @click="$emit('hideEditForm')"
      >
        Отмена
      </el-button>
      <el-popconfirm
        title="Вы уверены?"
        @confirm="handleSubmit('editEmployeeForm')"
      >
        <el-button
          slot="reference"
          type="primary"
        >
          Обновить
        </el-button>
      </el-popconfirm>
    </span>
  </div>
</template>

<script>
import { mask } from 'vue-the-mask'
import { VueEditor } from 'vue2-editor'
import textEditorMixin from '@/mixins/texteditor.mixin.js'

export default {
  name: 'editemployee',
  components: {
    VueEditor
  },
  directives: {
    mask
  },
  mixins: [textEditorMixin],
  props: {
    currentEmployee: {
      type: Object,
      required: true
    }
  },
  data: () => ({
    roles: [],
    locations: [],
    currentEmployeeId: null,
    form: {
      name: null,
      surname: null,
      patronymic: null,
      birthdate: null,
      phone: null,
      phone_2: null,
      rank: null,
      employee_role: null,
      location: null,
      passport: null,
      foreign_passport: null,
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
    currentEmployee: {
      immediate: true,
      deep: true,
      handler(obj) {
        this.currentEmployeeId = obj.id
        this.form.name = obj.name
        this.form.surname = obj.surname
        this.form.patronymic = obj.patronymic
        this.form.birthdate = obj.birthdate
        this.form.phone = obj.phone
        this.form.phone_2 = obj.phone_2
        this.form.rank = obj.rank
        this.form.employee_role = obj.employee_role.id
        this.form.location = obj.location.id
        this.form.passport = obj.passport
        this.form.foreign_passport = obj.foreign_passport
        this.form.comment = obj.comment
      }
    }
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
              id: this.currentEmployeeId,
              name: this.form.name,
              surname: this.form.surname,
              patronymic: this.form.patronymic,
              birthdate: this.form.birthdate,
              phone: this.form.phone,
              phone_2: this.form.phone_2,
              rank: this.form.rank,
              employee_role: this.form.employee_role,
              location: this.form.location,
              passport: this.form.passport,
              foreign_passport: this.form.foreign_passport,
              comment: this.form.comment
            }
            await this.$store.dispatch('editEmployee', formData)
            .then(() => {
              this.$emit('edited')
              this.$message.success('Информация обновлена')
            })
          } catch (e) {
            this.$message.error('Недостаточно прав для выполнения данной операции')
            console.log(e)
          }
        }
      })
    },
    async deleteEmployee() {
      try {
        await this.$store.dispatch('deleteEmployee', this.currentEmployeeId)
        .then(() => {
          this.$emit('edited')
          this.$message.success('Сотрудник удален')
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
.employee-edit {
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
    &:nth-last-child(2) .el-form-item {
      width: 50%;
    }
    &:last-child .el-form-item {
      width: 100%;
    }
  }
  .cancel-btn {
    margin: 0 10px;
  }
}
</style>