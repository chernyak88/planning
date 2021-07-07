<template>
  <div>
    <el-form
      :model="form"
      :rules="rules"
      ref="editTechResourceForm"
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
        @click="$emit('hideEditForm')"
      >
        Отмена
      </el-button>
      <el-button
        type="primary"
        @click="handleSubmit('editTechResourceForm')"
      >
        Обновить
      </el-button>
    </span>
  </div>
</template>

<script>
import { VueEditor } from "vue2-editor"
import textEditorMixin from '@/mixins/texteditor.mixin.js'

export default {
  name: 'editmetatheme',
  components: {
    VueEditor
  },
  mixins: [textEditorMixin],
  props: {
    currentTechresource: {
      type: Object,
      required: true
    }
  },
  data: () => ({
    statuses: [],
    locations: [],
    currentTechresourceId: null,
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
  watch: { 
    currentTechresource: {
      immediate: true,
      deep: true,
      handler(obj) {
        this.currentTechresourceId = obj.id
        this.form.name = obj.name
        this.form.type = obj.type
        this.form.status = obj.status.id
        this.form.location = obj.location.id
        this.form.comment = obj.comment
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
            let formData = {
              id: this.currentTechresourceId,
              name: this.form.name,
              type: this.form.type,
              status: this.form.status,
              location: this.form.location,
              comment: this.form.comment
            }
            await this.$store.dispatch('editTechresource', formData)
            .then(() => {
              this.$emit('edited')
              this.$message.success('Тех. ресурс обновлен')
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