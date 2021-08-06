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
    path: '/urgentdepartures',
    name: 'urgentdepartures',
    meta: {layout: 'main'},
    component: () => import('../views/UrgentDepartures.vue'),
    beforeEnter: ifAuthenticated,
  },
  {
    path: '/employeeschedule',
    name: 'employeeschedule',
    meta: {layout: 'main'},
    component: () => import('../views/EmployeeSchedule.vue'),
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
    path: '/log/:logDate',
    name: 'logsaved',
    meta: {layout: 'main'},
    component: () => import('../components/log/LogSaved.vue'),
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
    path: '/employee/:id',
    name: 'employeecalendar',
    meta: {layout: 'main'},
    component: () => import('../components/employees/EmployeeCalendar.vue'),
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