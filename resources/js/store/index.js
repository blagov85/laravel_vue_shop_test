import { createApp } from 'vue'
import { createStore } from 'vuex'

import indexProductsModule from './modules/indexProducts';
import productOneModule from './modules/productOne';
import popupProductModule from './modules/popupProduct';
import productsModule from './modules/products';
import accountModule from './modules/account';
import likeModule from './modules/like';
import compareModule from './modules/compare';
import cartModule from './modules/cart';
import orderModule from './modules/order';
import feedbackModule from './modules/feedback';


const store = createStore({
  modules: {
    indexProductsModule,
    productOneModule,
    popupProductModule,
    accountModule,
    productsModule,
    likeModule,
    compareModule,
    cartModule,
    orderModule,
    feedbackModule
  }
})

export default store