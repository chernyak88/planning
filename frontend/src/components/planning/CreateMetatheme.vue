<template>
  <div class="planning-create" v-loading="loading">
    <el-form
      :model="form"
      :rules="rules"
      ref="createMetaThemeForm"
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
            :picker-options = "pickerOptions"
            @blur="checkDateStart">
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
            :picker-options = "pickerOptions"
            @blur="checkDateEnd">
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
      <el-button
        @click="$emit('hideCreateForm')"
      >
        Отменить
      </el-button>
      <el-button
        type="primary"
        @click="handleSubmit('createMetaThemeForm')"
      >
        Добавить
      </el-button>
    </span>
  </div>
</template>

<script>
import { VueEditor } from 'vue2-editor'
import textEditorMixin from '@/mixins/texteditor.mixin.js'

export default {
  name: 'createmetatheme',
  components: {
    VueEditor
  },
  mixins: [textEditorMixin],
  data: () => ({
    loading: true,
    metatheme_sections: [],
    metatheme_inclusions: [],
    metatheme_aethers: [],
    metatheme_aether_plans: [],
    pickerOptions: {
      firstDayOfWeek: 1,
      disabledDate(time) {
        return time.getTime() < Date.now() - 8.64e7
      }
    },
    form: {
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
  }),
  async mounted() {
    this.metatheme_sections = await this.$store.dispatch('fetchMetathemeSections')
    this.metatheme_inclusions = await this.$store.dispatch('fetchMetathemeInclusions')
    this.metatheme_aethers = await this.$store.dispatch('fetchMetathemeAethers')
    this.metatheme_aether_plans = await this.$store.dispatch('fetchMetathemeAetherPlans')
    this.loading = false
  },
  methods: {
    handleChangeSection(id) {
      this.metatheme_sections.forEach( (item) => {
        if(item.id === id) this.$emit('handleChangeTitle', item.name)
      })
      switch (id) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
          this.formLayout.showStatus = true
          break
        case 6:
        case 7:
        case 8:
        case 9:
          this.formLayout.reg = true
          this.formLayout.showStatus = true
          this.form.metatheme_inclusions = null
          this.form.comment_inclusions = null
          break
        case 10:
        case 11:
        case 12:
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
        case 21:
        case 22:
        case 23:
        case 24:
          this.formLayout.showStatus = false
          this.form.status_coord = 'new'
          break
      }
    },
    checkDateStart() {
      if((!this.form.date_end) || (this.form.date_end && (this.form.date_end < this.form.date_start))) {
        this.form.date_end = this.moment(this.form.date_start).add(4, 'hours').format()
      }
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
            await this.$store.dispatch('createMetatheme', formData)
            .then(() => {
              this.$emit('created')
              this.loading = false
              this.$message.success('Тема добавлена')
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
.planning-create .form-row {
  display: flex;
}
.planning-create .form-row .el-form-item {
  width: 25%;

  &:last-child {
    margin-right: 0;
  }
}
.planning-create .form-row.description .el-form-item {
  width: 50%;

  & .ql-container {
    height: 150px;
  }
}
.planning-create .form-row .address.el-textarea .el-textarea__inner {
  height: 100px !important;
  resize: none;
}
.planning-create .form-row .comment.el-textarea .el-textarea__inner {
  height: 60px !important;
  resize: none;
}
.planning-create .el-form--label-top .el-form-item__label {
  padding: 0;
}
.planning-create .dialog-footer {
  display: block;
  text-align: right;
}
</style>