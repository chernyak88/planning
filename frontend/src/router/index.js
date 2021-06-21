import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const ifAuthenticated = (to, from, next) => {
  if (Vue.cookie.get('token')) {
    next()
    return
  } else {
    router.push('/login')
  }
}

const routes = [
  {
    path: '/login',
    name: 'login',
    meta: {layout: 'empty'},
    component: () => import('../views/Login.vue')
  },
  {
    path: '/forgotpassword',
    name: 'forgotpassword',
    meta: {layout: 'empty'},
    component: () => import('../views/ForgotPassword.vue')
  },
  {
    path: '/resetpassword',
    name: 'resetpassword',
    meta: {layout: 'empty'},
    component: () => import('../views/ResetPassword.vue')
  },
  {
    path: '/',
    name: 'home',
    meta: {layout: 'main'},
    component: () => import('../views/Home.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/planning',
    name: 'planning',
    meta: {layout: 'main'},
    component: () => import('../views/Planning.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/coordination',
    name: 'coordination',
    meta: {layout: 'main'},
    component: () => import('../views/Coordination.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/producers',
    name: 'producers',
    meta: {layout: 'main'},
    component: () => import('../views/Producers.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/employeeschedule',
    name: 'employeeschedule',
    meta: {layout: 'main'},
    component: () => import('../views/Employeeschedule.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/aetherplan',
    name: 'aetherplan',
    meta: {layout: 'main'},
    component: () => import('../views/Aetherplan.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/log',
    name: 'log',
    meta: {layout: 'main'},
    component: () => import('../views/Log.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/employee',
    name: 'employee',
    meta: {layout: 'main'},
    component: () => import('../views/Employee.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/techresources',
    name: 'techresources',
    meta: {layout: 'main'},
    component: () => import('../views/Techresources.vue'),
    beforeEnter: ifAuthenticated,
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router