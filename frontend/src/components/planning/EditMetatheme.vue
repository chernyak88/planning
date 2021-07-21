<template>
  <div class="planning-edit" v-loading="loading">
    <el-form
      :model="form"
      :rules="rules"
      ref="editMetaThemeForm"
      :inline="true"
      label-position="top"
    >
      <div class="form-row">
        <el-form-item
          label="Название"
          prop="name"
        >
          <el-input
            v-model="form.name"
            placeholder="Краткое название"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          v-if="!formLayout.zr && !formLayout.reg"
          label="Раздел"
          prop="metatheme_section"
        >
          <el-select
            v-model="form.metatheme_section"
            placeholder=""
            filterable
            @change="handleChangeSection"
          >
            <el-option
              v-for="item in metatheme_sections"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          v-if="formLayout.zr || formLayout.reg"
          label="Страна/Регион"
          prop="country"
        >
          <el-input
            v-model="form.country"
            placeholder="Краткое название"
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
            default-time="12:00:00"
            format="dd-MM-yyyy HH:mm"
            :picker-options = "pickerOptions"
            @blur="checkDateStart()">
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
            default-time="12:00:00"
            format="dd-MM-yyyy HH:mm"
            :picker-options = "pickerOptions"
            @blur="checkDateEnd()">
          </el-date-picker>
        </el-form-item>
      </div>
      <div class="form-row description" v-if="!formLayout.zr">
        <el-form-item
          label="Краткое описание"
          prop="short_description"
        >
          <vue-editor
            v-model="form.short_description"
            :editorToolbar="textEditorToolbar"
          >
          </vue-editor>
        </el-form-item>
        <el-form-item
          label="Описание"
          prop="description"
        >
          <vue-editor
            v-model="form.description"
            :editorToolbar="textEditorToolbar"
          >
          </vue-editor>
        </el-form-item>
      </div>
      <div class="form-row">
        <el-form-item
          v-if="!formLayout.zr && !formLayout.reg"
          label="Адрес"
          prop="address"
        >
          <el-input
            class="address"
            type="textarea"
            v-model="form.address"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          v-if="!formLayout.zr && !formLayout.reg"
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
            class="comment"
            type="textarea"
            placeholder="Комментарий"
            v-model="form.comment_inclusions"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Эфир"
          prop="metatheme_aether"
        >
          <el-select v-model="form.metatheme_aethers" multiple filterable placeholder="">
            <el-option
              v-for="item in metatheme_aethers"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
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
            class="comment"
            type="textarea"
            placeholder="Комментарий"
            v-model="form.comment_aether_plans"
          >
          </el-input>
        </el-form-item>
      </div>
      <div class="form-row" v-if="formLayout.showStatus">
        <el-form-item
          label="Координация"
          prop="status_coord"
        >
          <el-select v-model="form.status_coord" placeholder="">
            <el-option
              label="Без"
              value="new">
            </el-option>
            <el-option
              label="Требуется"
              value="coord">
            </el-option>
          </el-select>
          <el-input
            v-if="form.status_coord === 'coord'"
            class="comment"
            style="width: 99%"
            type="textarea"
            placeholder="Комментарий"
            v-model="form.comment_coord"
          >
          </el-input>
        </el-form-item>
      </div>
    </el-form>
    <span
      slot="footer"
      class="dialog-footer"
    >
      <el-popconfirm
        title="Вы уверены?"
        @confirm="deleteMetatheme()"
      >
        <el-button
          slot="reference"
          type="danger"
        >
          Удалить
        </el-button>
      </el-popconfirm>
      <el-button
        @click="$emit('hideEditForm')"
        style="margin: 0 10px;"
      >
        Отменить
      </el-button>
      <el-popconfirm
        title="Вы уверены?"
        @confirm="handleSubmit('editMetaThemeForm')"
        style="margin-right: 10px;"
      >
        <el-button
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
import { VueEditor } from 'vue2-editor'
import textEditorMixin from '@/mixins/texteditor.mixin.js'

export default {
  name: 'editmetatheme',
  components: {
    VueEditor
  },
  mixins: [textEditorMixin],
  props: {
    editingTheme: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      loading: true,
      metatheme_sections: [],
      metatheme_inclusions: [],
      metatheme_aethers: [],
      metatheme_aether_plans: [],
      pickerOptions: {
        firstDayOfWeek: 1
      },
      form: {
        id: null,
        name: null,
        metatheme_section: null,
        date_start: null,
        date_end: null,
        short_description: null,
        description: null,
        address: null,
        metatheme_inclusions: null,
        comment_inclusions: null,
        metatheme_aethers: null,
        metatheme_aether_plans: null,
        comment_aether_plans: null,
        status_coord: 'new',
        comment_coord: null,
        country: null
      },
      formLayout: {
        zr: false,
        reg: false,
        showStatus: false
      },
      rules: {
        name: [
          {
            required: true,
            message: "Введите название темы",
            trigger: "blur",
          }
        ],
        metatheme_section: [
          {
            required: true,
            message: "Выберите раздел",
            trigger: "change",
          }
        ],
        date_start: [
          {
            required: true,
            message: "Выберите дату и время",
            trigger: "blur",
          }
        ],
        date_end: [
          {
            required: true,
            message: "Выберите дату и время",
            trigger: "blur",
          }
        ],
      }
    }
  },
  async mounted() {
    this.metatheme_inclusions = await this.$store.dispatch('fetchMetathemeInclusions')
    this.metatheme_aethers = await this.$store.dispatch('fetchMetathemeAethers')
    this.metatheme_aether_plans = await this.$store.dispatch('fetchMetathemeAetherPlans')
    this.loading = false
  },
  watch: {
    editingTheme: {
      immediate: true,
      handler: function () {
        let metatheme_inclusions = []
        let metatheme_aethers = []
        let metatheme_aether_plans = []
        for(let i = 0; i < this.editingTheme.metatheme_inclusions.length; i++) {
          metatheme_inclusions.push(this.editingTheme.metatheme_inclusions[i].id)
        }
        for(let i = 0; i < this.editingTheme.metatheme_aethers.length; i++) {
          metatheme_aethers.push(this.editingTheme.metatheme_aethers[i].id)
        }
        for(let i = 0; i < this.editingTheme.metatheme_aether_plans.length; i++) {
          metatheme_aether_plans.push(this.editingTheme.metatheme_aether_plans[i].id)
        }
        this.form.id = this.editingTheme.id
        this.form.name = this.editingTheme.name
        this.form.metatheme_section = this.editingTheme.metatheme_section.id
        this.form.date_start = this.editingTheme.date_start
        this.form.date_end = this.editingTheme.date_end
        this.form.short_description = this.editingTheme.short_description
        this.form.description = this.editingTheme.description
        this.form.address = this.editingTheme.address
        this.form.metatheme_inclusions = metatheme_inclusions
        this.form.comment_inclusions = this.editingTheme.comment_inclusions
        this.form.metatheme_aethers = metatheme_aethers
        this.form.metatheme_aether_plans = metatheme_aether_plans
        this.form.comment_aether_plans = this.editingTheme.comment_aether_plans
        this.form.status_coord = this.editingTheme.status_coord
        this.form.comment_coord = this.editingTheme.comment_coord
        this.form.country = this.editingTheme.country
        this.handleChangeSection(this.editingTheme.metatheme_section.id)
      }
    }
  },
  methods: {
    async handleChangeSection(id) {
      this.loading = true
      let group = null
      this.metatheme_sections = await this.$store.dispatch('fetchMetathemeSections')
      this.metatheme_sections.forEach((item) => {
        if(item.id === id) {
          group = item.group
          this.$emit('handleChangeTitle', item.name)
        }
      })
      switch (group) {
        case 'planning':
        case 'spb':
        case 'producers':
        case 'iztv':
        case 'aether_78':
        case 'aether_112':
          this.formLayout.reg = false
          this.formLayout.zr = false
          this.formLayout.showStatus = true
          break
        case 'regions':
          this.formLayout.zr = false
          this.formLayout.reg = true
          this.formLayout.showStatus = true
          this.form.metatheme_inclusions = null
          this.form.comment_inclusions = null
          break
        case 'foreign':
          this.formLayout.reg = false
          this.formLayout.zr = true
          this.formLayout.showStatus = false
          this.form.short_description = null
          this.form.description = null
          this.form.address = null
          this.form.metatheme_inclusions = null
          this.form.comment_inclusions = null
          this.form.status_coord = 'new'
          this.form.comment_coord = null
          break
        default:
          this.formLayout.reg = false
          this.formLayout.zr = false
          this.formLayout.showStatus = false
          this.form.status_coord = 'new'
          break
      }
      this.loading = false
    },
    checkDateStart() {
      this.form.date_end = this.moment(this.form.date_start).add(4, 'hours').format()
    },
    checkDateEnd() {
      if (this.form.date_start && (this.form.date_end < this.form.date_start)) {
        this.form.date_start = null
      }
    },
    handleSubmit(form) {
      this.$refs[form].validate( async (valid) => {
        if (!valid) {
          return false
        } else {
          try {
            this.loading = true
            let formData = {
              id: this.form.id,
              name: this.form.name,
              metatheme_section: this.form.metatheme_section,
              date_start: this.moment(this.form.date_start).format(),
              date_end: this.moment(this.form.date_end).format(),
              short_description: this.form.short_description,
              description: this.form.description,
              address: this.form.address,
              metatheme_inclusions: this.form.metatheme_inclusions,
              comment_inclusions: this.form.comment_inclusions,
              metatheme_aethers: this.form.metatheme_aethers,
              metatheme_aether_plans: this.form.metatheme_aether_plans,
              comment_aether_plans: this.form.comment_aether_plans,
              status_coord: this.form.status_coord,
              comment_coord: this.form.comment_coord,
              country: this.form.country
            }
            await this.$store.dispatch('editMetatheme', formData)
            .then(() => {
              this.$emit('edited')
              this.loading = false
              this.$message.success('Тема обновлена')
            })
          } catch (e) {
            this.$message.error('Недостаточно прав для выполнения данной операции')
            console.log(e)
          }
        }
      })
    },
    async deleteMetatheme() {
      try {
        this.loading = true
        await this.$store.dispatch('deleteMetatheme', this.form.id)
        .then(() => {
          this.$emit('edited')
          this.loading = false
          this.$message.success('Тема удалена')
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
.planning-edit {

  & .form-row {
    display: flex;

    & .el-form-item {
      width: 25%;
      
      &:last-child {
        margin-right: 0;
      }
    }

    & .address.el-textarea .el-textarea__inner {
      height: 100px !important;
      resize: none;
    }

    & .comment.el-textarea .el-textarea__inner {
      height: 60px !important;
      resize: none;
    }
  }

  & .form-row.description .el-form-item {
    width: 50%;

    & .ql-container {
      height: 150px;
    }
  }

  & .el-form--label-top .el-form-item__label {
    padding: 0;
  }

  & .el-select {
    width: 100%;
  }

  & .dialog-footer {
    display: block;
    text-align: right;
  }
  
}
</style>