<template>
  <div class="planning-create" v-loading="loading">
    <el-form
      v-for="(form, index) in forms"
      :key="index"
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
      </div>
      <div class="form-row">
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
            @blur="checkDateStart(index)">
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
            @blur="checkDateEnd(index)">
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
        v-if="formLayout.zr"
        type="primary"
        @click="clone"
      >
        Клонировать
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
  props: {
    curSection: {
      type: Object,
      required: false
    },
    curTheme: {
      type: Object,
      required: false
    }
  },
  data() {
    return {
      loading: true,
      metatheme_inclusions: [],
      metatheme_aethers: [],
      metatheme_aether_plans: [],
      pickerOptions: {
        firstDayOfWeek: 1,
        disabledDate(time) {
          return time.getTime() < Date.now() - 8.64e7
        }
      },
      forms: [
        {
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
        }
      ],
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
    curSection: {
      immediate: true,
      handler: function () {
        if (!this.curSection) {
          return
        }
        for(let i = 0; i < this.forms.length; i++) {
          this.forms[i].metatheme_section = this.curSection.id
        }
        this.changeLayout(this.curSection.group)
      }
    },
    curTheme: {
      immediate: true,
      handler: function () {
        if (!this.curTheme) {
          return
        }
        let metatheme_inclusions = []
        let metatheme_aethers = []
        let metatheme_aether_plans = []
        for(let i = 0; i < this.curTheme.metatheme_inclusions.length; i++) {
          metatheme_inclusions.push(this.curTheme.metatheme_inclusions[i].id)
        }
        for(let i = 0; i < this.curTheme.metatheme_aethers.length; i++) {
          metatheme_aethers.push(this.curTheme.metatheme_aethers[i].id)
        }
        for(let i = 0; i < this.curTheme.metatheme_aether_plans.length; i++) {
          metatheme_aether_plans.push(this.curTheme.metatheme_aether_plans[i].id)
        }
        for(let i = 0; i < this.forms.length; i++) {
          this.forms[i].name = this.curTheme.name
          this.forms[i].metatheme_section = this.curTheme.metatheme_section.id
          this.forms[i].date_start = this.curTheme.date_start
          this.forms[i].date_end = this.curTheme.date_end
          this.forms[i].short_description = this.curTheme.short_description
          this.forms[i].description = this.curTheme.description
          this.forms[i].address = this.curTheme.address
          this.forms[i].metatheme_inclusions = metatheme_inclusions
          this.forms[i].comment_inclusions = this.curTheme.comment_inclusions
          this.forms[i].metatheme_aethers = metatheme_aethers
          this.forms[i].metatheme_aether_plans = metatheme_aether_plans
          this.forms[i].comment_aether_plans = this.curTheme.comment_aether_plans
          this.forms[i].status_coord = this.curTheme.status_coord
          this.forms[i].comment_coord = this.curTheme.comment_coord
          this.forms[i].country = this.curTheme.country
        }
        this.changeLayout(this.curTheme.metatheme_section.group)
      }
    }
  },
  methods: {
    changeLayout(group) {
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
          for(let i = 0; i < this.forms.length; i++) {
            this.forms[i].metatheme_inclusions = null
            this.forms[i].comment_inclusions = null
          }
          break
        case 'foreign':
          this.formLayout.reg = false
          this.formLayout.zr = true
          this.formLayout.showStatus = false
          for(let i = 0; i < this.forms.length; i++) {
            this.forms[i].short_description = null
            this.forms[i].description = null
            this.forms[i].address = null
            this.forms[i].metatheme_inclusions = null
            this.forms[i].comment_inclusions = null
            this.forms[i].status_coord = 'new'
            this.forms[i].comment_coord = null
          }
          break
        default:
          this.formLayout.reg = false
          this.formLayout.zr = false
          this.formLayout.showStatus = false
          for(let i = 0; i < this.forms.length; i++) {
            this.forms[i].status_coord = 'new'
          }
          break
      }
    },
    checkDateStart(index) {
      this.forms[index].date_end = this.moment(this.forms[index].date_start).add(4, 'hours').format()
    },
    checkDateEnd(index) {
      if (this.forms[index].date_start && (this.forms[index].date_end < this.forms[index].date_start)) {
        this.forms[index].date_start = null
      }
    },
    clone() {
      this.forms.push({
        name: null,
        metatheme_section: this.forms[0].metatheme_section,
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
      })
    },
    handleSubmit(form) {
      for(let i = 0; i < this.$refs[form].length; i++) {
        this.$refs[form][i].validate( async (valid) => {
          if (!valid) {
            return false
          } else {
            try {
              this.loading = true
              let formData = {
                name: this.forms[i].name,
                metatheme_section: this.forms[i].metatheme_section,
                date_start: this.moment(this.forms[i].date_start).format(),
                date_end: this.moment(this.forms[i].date_end).format(),
                short_description: this.forms[i].short_description,
                description: this.forms[i].description,
                address: this.forms[i].address,
                metatheme_inclusions: this.forms[i].metatheme_inclusions,
                comment_inclusions: this.forms[i].comment_inclusions,
                metatheme_aethers: this.forms[i].metatheme_aethers,
                metatheme_aether_plans: this.forms[i].metatheme_aether_plans,
                comment_aether_plans: this.forms[i].comment_aether_plans,
                status_coord: this.forms[i].status_coord,
                comment_coord: this.forms[i].comment_coord,
                country: this.forms[i].country
              }
              await this.$store.dispatch('createMetatheme', formData)
              .then(async (res) => {
                if (formData.status_coord === 'coord') {
                  let shootingData = {
                    name: formData.name,
                    metatheme: res.data.id,
                    date_departure: formData.date_start,
                    date_arrival: formData.date_start,
                    date_start: formData.date_start,
                    date_end: formData.date_end,
                    date_return: formData.date_end
                  }
                  await this.$store.dispatch('createShooting', shootingData)
                }
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
}
</script>
<style lang="scss">
.planning-create {
  & .form-row {
    display: flex;
    & .el-form-item {
      width: 25%;
      &:last-child {
        margin-right: 0;
      }
    }
    &:nth-child(1) .el-form-item {
      width: 100%;
    }
    &:nth-child(2) .el-form-item {
      width: auto;
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