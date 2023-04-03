import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'products.index',
      component: () => import('../views/product/Index.vue')
    },
    {
      path: '/product/:id',
      name: 'product.show',
      component: () => import('../views/product/Show.vue')
    },
    {
      path: '/compare',
      name: 'products.compare',
      component: () => import('../views/product/Compare.vue')
    },
    {
      path: '/compare/:id',
      name: 'products.compareId',
      component: () => import('../views/product/Compare.vue')
    },
    {
      path: '/cart',
      name: 'cart.index',
      component: () => import('../views/cart/Index.vue')
    },
    {
      path: '/user/login',
      name: 'user.login',
      component: () => import('../views/user/Login.vue')
    },
    {
      path: '/user/registration',
      name: 'user.registration',
      component: () => import('../views/user/Registration.vue')
    },
    {
      path: '/user/account',
      name: 'user.account',
      component: () => import('../views/user/Account.vue')
    },
    {
      path: '/user/wishlist',
      name: 'user.wishlist',
      component: () => import('../components/LikeList.vue')
    },
    { 
      path: '/search/:searchVal',
      name: 'products.search',
      component: () => import('../views/product/Index.vue')
    },
    { 
      path: '/order/index',
      name: 'order.index',
      component: () => import('../views/order/Index.vue'),
      props: true
    },
    { 
      path: '/user/password/forgot',
      name: 'user.password.request',
      component: () => import('../views/user/ForgotPassword.vue'),
    },
    { 
      path: '/user/reset-password/:token',
      name: 'user.password.request.token',
      component: () => import('../views/user/ResetPassword.vue'),
    }
    // {
    //   path: '*',
    //   name: '404',
    //   component: () => import('../views/product/Index.vue')
    // }
  ]
})

router.beforeEach((to, from, next) => {
  console.log("YYYY");
  console.log(to.name);
  console.log(from.name);

  const accessToken = localStorage.getItem('x_xsrf_token');  

  if((to.name === 'user.login' || to.name === 'user.registration' || 
      to.name === 'user.password.request' || to.name === 'user.password.request.token') && accessToken){
    return next({
      name:'products.index'
    });
  }

  if((to.name === 'user.wishlist' || to.name === 'user.account') && (!accessToken)){
    return next({
      name:'user.login'
    });
  }
  
  next();
  
});

export default router
