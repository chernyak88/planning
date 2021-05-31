<template>
  <div>
    <h1>Главная страница</h1>
    <router-link
      to="/techresources"
      class="el-button el-button--primary"
    >
      Управление Тех ресурсами
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'Home'
}
</script>

<style lang="scss" scoped>
a {
  text-decoration: none;
}
</style>
