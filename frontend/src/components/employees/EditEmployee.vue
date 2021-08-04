<template>
  <div>

    <span
      slot="footer"
      class="dialog-footer"
    >
      <el-button
        @click="$emit('hideEditForm')"
      >
        Отмена
      </el-button>
      <!-- <el-button
        type="primary"
        @click="handleSubmit('editEmployeeForm')"
      >
        Обновить
      </el-button> -->
    </span>
  </div>
</template>

<script>
import { VueEditor } from "vue2-editor"
import textEditorMixin from '@/mixins/texteditor.mixin.js'

export default {
  name: 'editemployee',
  components: {
    VueEditor
  },
  mixins: [textEditorMixin],
  props: {
    currentEmployee: {
      type: Object,
      required: true
    }
  },
  data: () => ({
    statuses: [],
    locations: [],
    currentEmployeeId: null,
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
    this.locations = await this.$store.dispatch('fetchLocations')
  },
  watch: { 
    currentEmployee: {
      immediate: true,
      deep: true,
      handler(obj) {
        this.currentEmployeeId = obj.id
        this.form.name = obj.name
        this.form.type = obj.type
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
              id: this.currentEmployeeId,
              name: this.form.name,
              type: this.form.type,
              status: this.form.status,
              location: this.form.location,
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
    }
  }
}
</script>