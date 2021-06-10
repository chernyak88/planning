<template>
  <div class="login" v-loading="loading">
    <el-card>
      <h1>Обновить пароль</h1>
      <el-form
        :model="resetPasswordForm"
        :rules="rules"
        ref="resetPasswordForm"
      >
        <el-form-item
          label="Введите новый пароль"
          prop="password"
        >
          <el-input
            type="password"
            v-model="resetPasswordForm.password"
            show-password
          >
          </el-input>
        </el-form-item>
                <el-form-item
          label="Подтверждение пароля"
          prop="password"
        >
          <el-input
            type="password"
            v-model="resetPasswordForm.confirmPassword"
            show-password
          >
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="handleSubmit('resetPasswordForm')"
          >
            Обновить пароль
          </el-button>
        </el-form-item>
        <router-link
          to="/login"
          class="el-link el-link--primary is-underline"
          v-if="success"
        >
          Войти в систему с новым паролем
        </router-link>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'resetpassword',
  data: () => ({
    loading: false,
    success: false,
    resetPasswordForm: {
      password: null,
      confirmPassword: null
    },
    rules: {
      password: [
        {
          required: true,
          message: 'Введите пароль',
          trigger: 'blur'
        },
        {
          min: 8,
          message: 'Пароль должен быть не менее 8 символов',
          trigger: 'blur'
        }
      ],
      confirmPassword: [
        {
          required: true,
          message: 'Введите пароль',
          trigger: 'blur'
        },
        {
          min: 8,
          message: 'Пароль должен быть не менее 8 символов',
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
            let password = this.resetPasswordForm.password
            let confirmPassword = this.resetPasswordForm.confirmPassword
            await this.$store.dispatch('resetPassword', { password, confirmPassword })
            .then(() => {
              this.loading = false
              this.$message.success('Теперь вы можете войти с новым паролем')
              this.success = true
            })
          } catch (e) {
            this.loading = false
            this.$message.error('Произошла ошибка!')
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