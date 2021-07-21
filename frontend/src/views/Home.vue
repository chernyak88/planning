<template>
  <div class="home">
    <h1>Ваша система планирования</h1>
    <div class="block block__main">
      <h2>Основные</h2>
      <router-link
        to="/planning"
        class="el-button el-button--primary"
      >
        Отделы
      </router-link>
      <router-link
        to="/coordination"
        class="el-button el-button--primary"
      >
        Координация
      </router-link>
      <router-link
        to="/producers"
        class="el-button el-button--primary"
      >
        Продюссеры
      </router-link>
    </div>
    <div class="block">
      <h2>Процессы</h2>
      <router-link
        to="/employeeschedule"
        class="el-button el-button--primary"
      >
        График сотрудников
      </router-link>
      <router-link
        to="/aetherplan"
        class="el-button el-button--primary"
      >
        Эфирный план
      </router-link>
      <router-link
        to="/log"
        class="el-button el-button--primary"
      >
        ЛОГ
      </router-link>
    </div>
    <div class="block">
      <h2>Управление</h2>
      <router-link
        to="/employee"
        class="el-button el-button--primary"
      >
        Управление сотрудниками
      </router-link>
      <router-link
        to="/techresources"
        class="el-button el-button--primary"
      >
        Управление техническими ресурсами
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Home'
}
</script>

<style lang="scss" scoped>
.home {
  display: grid;
  grid-gap: 30px;
}
h1, h2 {
  width: 100%;
  font-size: 24px;
  margin: 0;
}
h2 {
  font-weight: normal;
  margin-bottom: 15px;
}
.block {
  display: flex;
  flex-wrap: wrap;

  &__main a {
    height: 150px;
  }
}
a {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 32%;
  height: 75px;
  text-decoration: none;
}
</style>
