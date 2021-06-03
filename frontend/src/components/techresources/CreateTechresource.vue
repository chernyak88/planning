<template>
  <div>
    <el-form
      :model="form"
      :rules="rules"
      ref="createTechResourceForm"
    >
      <el-form-item
        label="Название"
        prop="name"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="form.name"
        >
        </el-input>
      </el-form-item>
      <el-form-item
        label="Тип"
        prop="type"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="form.type"
        >
        </el-input>
      </el-form-item>
      <el-form-item
        label="Статус"
        prop="status"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="form.status"
          placeholder="Выберите статус"
        >
          <el-option
            v-for="status in statuses"
            :key="status.id"
            :label="status.name"
            :value="status.id">
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
      <el-button
        type="primary"
        @click="handleSubmit('createTechResourceForm')"
      >
        Создать
      </el-button>
    </span>
  </div>
</template>

<script>
import { VueEditor } from "vue2-editor"
import textEditorMixin from '@/mixins/texteditor.mixin.js'

export default {
  name: 'createtechresource',
  components: {
    VueEditor
  },
  mixins: [textEditorMixin],
  data: () => ({
    statuses: [],
    locations: [],
    form: {
      name: null,
      type: null,
      status: null,
      location: null,
      comment: null
    },
    formLabelWidth: '150px',
    rules: {
      name: [
        {
          required: true,
          message: "Введите название ресурса",
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
      status: [
        {
          required: true,
          message: "Выберите статус",
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
    this.statuses = await this.$store.dispatch('fetchTechResourcesStatuses')
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
            await this.$store.dispatch('createTechresource', formData)
            .then(() => {
              this.$emit('created')
              this.$message.success('Тех. ресурс добавлен')
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