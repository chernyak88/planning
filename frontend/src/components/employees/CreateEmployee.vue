<template>
  <div>
    <el-form
      :model="form"
      :rules="rules"
      ref="createEmplyeeForm"
    >
      <el-form-item
        label="Имя"
        prop="name"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="form.name"
        >
        </el-input>
      </el-form-item>
      <el-form-item
        label="Фамилия"
        prop="surname"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="form.surname"
        >
        </el-input>
      </el-form-item>
      <el-form-item
        label="Отчество"
        prop="patronymic"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="form.patronymic"
        >
        </el-input>
      </el-form-item>
      <el-form-item
        label="Телефон"
        prop="phone"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="form.phone"
          suffix-icon="el-icon-phone"
          placeholder="8 (999)-999-99-99"
          v-mask="'# (###)-###-##-##'"
        >
        </el-input>
      </el-form-item>
      <el-form-item
        label="Роль"
        prop="employee_role"
        :label-width="formLabelWidth"
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
        :label-width="formLabelWidth"
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
      <el-form-item
        label="Общий комментарий"
        prop="comment"
        :label-width="formLabelWidth"
      >
        <vue-editor
          v-model="form.comment"
          :editorToolbar="textEditorToolbar"
        >
        </vue-editor>
      </el-form-item>
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
      <!-- <el-button
        type="primary"
        @click="handleSubmit('createEmplyeeForm')"
      >
        Добавить
      </el-button> -->
    </span>
  </div>
</template>

<script>
import {mask} from 'vue-the-mask'
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
    form: {
      name: null,
      surname: null,
      patronymic: null,
      phone: null,
      employee_role: null,
      location: null,
      comment: null
    },
    formLabelWidth: '150px',
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
      type: [
        {
          required: true,
          message: "Введите тип ресурса",
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
  methods: {
    handleSubmit(form) {
     this.$refs[form].validate( async (valid) => {
        if (!valid) {
          return false
        } else {
          try {
            let formData = {
              name: this.form.name,
              type: this.form.type,
              status: this.form.status,
              location: this.form.location,
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