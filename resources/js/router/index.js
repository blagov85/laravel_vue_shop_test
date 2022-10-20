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
      path: '/search/:searchVal',
      name: 'products.search',
      component: () => import('../views/product/Search.vue')
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
  next();

  const accessToken = localStorage.getItem('access_token');

  // if(!accessToken){
  //   if(to.name === 'user.login' || to.name === 'user.registration'){
  //     return next();
  //   }else{
  //     return next({
  //       name: 'user.login'
  //     }); 
  //   }
  // }
  // if(to.name === 'user.login' || to.name === 'user.registration' && accessToken){
  //   return next({
  //     name:'products.index'
  //   });
  // }

});

export default router
