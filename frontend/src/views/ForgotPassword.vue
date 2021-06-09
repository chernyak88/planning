<template>
  <div class="login" v-loading="loading">
    <el-card>
      <h1>Сброс пароля</h1>
      <el-form
        :model="forgotPasswordForm"
        :rules="rules"
        ref="forgotPasswordForm"
      >
        <el-form-item
          label="Введите e-mail"
          prop="email"
        >
          <el-input
            v-model="forgotPasswordForm.email"
          >
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="handleSubmit('forgotPasswordForm')"
          >
            Сбросить пароль
          </el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'forgotpassword',
  data: () => ({
    loading: false,
    forgotPasswordForm: {
      email: localStorage.getItem('userEmail') || ''
    },
    rules: {
      email: [
        {
          required: true,
          message: 'Введите email',
          trigger: 'blur'
        },
        { 
          type: 'email',
          message: 'Некорректный email',
          trigger: 'blur'
        }
      ]
    }
  }),
  methods: {
    handleSubmit(form) {
     this.$refs[form].validate( async (valid) => {
        if (!valid) {
          return false
        } else {
          try {
            this.loading = true
            let email = this.forgotPasswordForm.email 
            await this.$store.dispatch('forgotPassword', { email })
            .then(() => {
              this.loading = false
              this.$message.success('На Ваш email отправлена ссылка для сброса пароля')
            })
          } catch (e) {
            this.loading = false
            this.$message.error('Некорректный email')
            console.log(e)
          }
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
h1 {
  font-size: 26px;
  padding-bottom: 20px;
}
.login {
  min-height: 100vh;
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}
.el-card {
  width: 320px;
  display: flex;
  justify-content: center;
  padding-top: 0;
  padding-bottom: 30px;
}
</style>