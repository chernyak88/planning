<template>
  <div class="login" v-loading="loading">
    <el-card>
      <h1>Вход в систему</h1>
      <el-form
        :model="loginForm"
        :rules="rules"
        ref="loginForm"
      >
        <el-form-item
          label="E-mail"
          prop="email"
        >
          <el-input
            v-model="loginForm.email"
          >
          </el-input>
        </el-form-item>
        <el-form-item
          label="Пароль"
          prop="password"
        >
          <el-input
            type="password"
            v-model="loginForm.password"
            show-password
          >
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="handleSubmit('loginForm')"
          >
            Войти
          </el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'login',
  data: () => ({
    loading: false,
    loginForm: {
      email: localStorage.getItem('userEmail') || '',
      password: ''
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
      ],
      password: [
        {
          required: true,
          message: 'Введите пароль',
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
            let email = this.loginForm.email 
            let password = this.loginForm.password
            await this.$store.dispatch('login', { email, password })
            .then(() => {
              this.loading = false
              this.$router.push('/')
            })
          } catch (e) {
            this.loading = false
            this.$message.error('Ошибка входа')
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
.login-button {
  width: 100%;
  margin-top: 40px;
}
.login-form {
  width: 290px;
}
.el-card {
  width: 320px;
  display: flex;
  justify-content: center;
  padding-top: 0;
  padding-bottom: 30px;
}
</style>