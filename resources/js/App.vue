<template>
  <div>
        <!-- header-default start -->
    <header class="header-style-3">
        <!-- Start Desktop Menu -->
        <div class="menubox">
            <div class="container-fluid">
                <div class="row d-lg-none d-block">
                    <div class="mobile-menu ">
                        <div class="mobile-menu__menu-top border-bottom-0">
                            <div class="container">
                                <div class="row">
                                    <div class="menu-info d-flex justify-content-between align-items-center">
                                        <div class="menubar"> <span></span> <span></span> <span></span> </div> 
                                        <router-link to="/" class="logo"> 
                                            <img src="/assets/images/logo/logo.png" alt=""> 
                                        </router-link>
                                        <div class="cart-holder">
                                            <a @click.prevent="getCart();getTotalCart()" href="#0" class="number cart cart-icon position-relative">
                                                <i class="flaticon-shopping-cart"></i>
                                                <span v-if="getCartCount > 0" class="count mobile-cart-count">({{ getCartCount }})</span> 
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="menu-closer"></div>
                        <div class="mobile-menu__sidebar-menu">
                            <div class="menu-closer two"> 
                                <span> Close Menu</span> 
                                <span class="cross">
                                    <i class="flaticon-cross"></i>
                                </span>
                            </div>
                            <div class="search-box-holder">
                                <div class="search-box menu d-flex align-items-center justify-content-center" style="padding:10px"> 
                                    <input type="text" v-model="searchValue" class="form-control"
                                        placeholder="Знайти товари">
                                    <div class="menu-closer-item">
                                        <router-link v-if="searchValue !== ''" :to="{name: 'products.search', params: {searchVal: searchValue}}">  
                                            <span class="search-icon"> <i class="flaticon-loupe"></i> </span> 
                                        </router-link>
                                        <div v-else>
                                            <span class="search-icon"> <i class="flaticon-loupe"></i> </span> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="page-dropdown-menu">
                                <li class="dropdown-list menu-closer-item"> 
                                    <router-link v-if="token" :to="{name: 'user.account'}">
                                        <i class="flaticon-account"></i>
                                        <span class="description-list">{{ this.userName }}</span>
                                    </router-link>    
                                    <router-link v-else :to="{name: 'user.login'}">
                                        <i class="flaticon-account"></i> 
                                        <span class="description-list">Вхід</span>
                                    </router-link>
                                </li>
                                <li class="dropdown-list menu-closer-item">
                                    <a @click.prevent="checkCompare()" :class="[getCompareCategoryCount > 0 ? 'number popup_link' : 'number']" :href="[getCompareCategoryCount > 0 ? '#popupCompare' : '']">
                                        <i class="flaticon-left-and-right-arrows"></i> 
                                        <span class="description-list">Порівняння</span>
                                        <span v-if="getCompareCount > 0" class="count">({{ getCompareCount }})</span>
                                    </a> 
                                </li>
                                <li class="dropdown-list menu-closer-item">
                                    <template v-if="token">
                                        <router-link @click.prevent="setIsLikeFromMainPage(true)" :to="{name: 'user.account'}" class="number">
                                            <i class="flaticon-heart"></i>
                                            <span class="description-list">Обране</span>
                                            <span v-if="getLikeCount > 0" class="count">({{ getLikeCount }})</span>
                                        </router-link>
                                    </template>
                                    <template v-else>
                                        <router-link :to="{name: 'user.login'}" class="number">
                                            <i class="flaticon-heart"></i>
                                            <span class="description-list">Обране</span> 
                                        </router-link>
                                    </template>
                                </li>
                                <li class="dropdown-list menu-closer-item">
                                    <a @click.prevent="getCart();getTotalCart()" href="#0" class="number cart-icon"> 
                                        <i class="flaticon-shopping-cart"></i>
                                        <span class="description-list">Корзина</span>
                                        <span v-if="getCartCount > 0" class="count">({{ getCartCount }})</span> 
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="d-lg-block d-none">
                    <div class="row g-0 position-relative">
                        <div class="col-lg-3 d-flex align-items-center justify-content-center border-rit ">
                            <div class="logo"> 
                                <router-link to="/">
                                    <img src="/assets/images/logo/logo.png" alt="">
                                </router-link>
                            </div>
                        </div>
                        <div class="col-lg-9 g-0 p-0">
                            <div class="row g-0 holder">
                                <div class="col-12">
                                    <div class="some-info">
                                        <p class="d-flex align-items-center"> <span class="icon"> <i
                                                    class="flaticon-power"></i> </span> Вітаємо в інтернет – магазині Karte</p>
                                        <div class="right d-flex align-items-center ">
                                            <router-link v-if="token" :to="{name: 'user.account'}">{{ this.userName }}</router-link>
                                            <router-link v-else :to="{name: 'user.login'}">Вхід</router-link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="border-one"> </div>
                            <div class="row g-0 holder">
                                <div class="col-12">
                                    <div class="mega-menu-default mega-menu d-lg-block d-none">
                                        <div class=" d-flex align-items-center justify-content-between ">
                                            <nav>
                                                <ul class="page-dropdown-menu d-flex align-items-center justify-content-center">
                                                    <!-- <li class="dropdown-list"> <router-link to="/"> <span>Home</span></router-link></li>
                                                    <li class="dropdown-list"> <router-link to="/products"> <span>Продукти</span></router-link></li> -->
                                                    <li class="dropdown-list"> 
                                                        <div class="search-box menu d-flex align-items-center justify-content-center" style="padding:10px"> 
                                                            <input type="text" v-model="searchValue" class="form-control"
                                                                placeholder="Знайти товари">
                                                            <template v-if="searchValue !== ''">
                                                                <router-link :to="{name: 'products.search', params: {searchVal: searchValue}}">  
                                                                    <span class="search-icon"> <i class="flaticon-loupe"></i> </span> 
                                                                </router-link>
                                                            </template>
                                                            <template v-else>
                                                                <span class="search-icon"> <i class="flaticon-loupe"></i> </span> 
                                                            </template>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </nav>
 
                                            <div class="right d-flex align-items-center justify-content-end">
                                                <ul class="main-menu__widge-box d-flex align-items-center ">
                                                    <li class="d-lg-block d-none">
                                                        <a @click.prevent="checkCompare()" :class="[getCompareCategoryCount > 0 ? 'number popup_link' : 'number']" :href="[getCompareCategoryCount > 0 ? '#popupCompare' : '']">
                                                            <i class="flaticon-left-and-right-arrows"></i> 
                                                            <span v-if="getCompareCount > 0" class="count">({{ getCompareCount }})</span> 
                                                        </a> 
                                                    </li>
                                                    <li class="d-lg-block d-none">
                                                        <template v-if="token">
                                                            <router-link @click.prevent="setIsLikeFromMainPage(true)" :to="{name: 'user.account'}" class="number">
                                                                <i class="flaticon-heart"></i> 
                                                                <span v-if="getLikeCount > 0" class="count">({{ getLikeCount }})</span>
                                                            </router-link>
                                                        </template>
                                                        <template v-else>
                                                            <router-link :to="{name: 'user.login'}" class="number">
                                                                <i class="flaticon-heart"></i> 
                                                            </router-link>
                                                        </template>
                                                    </li>
                                                    <li class="cartm"> 
                                                        <a @click.prevent="getCart();getTotalCart()" href="#0" class="number cart-icon"> 
                                                            <i class="flaticon-shopping-cart"></i>
                                                            <span v-if="getCartCount > 0" class="count">({{ getCartCount }})</span> 
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <a href="shop-grid.html" class="offer-link"> Offer </a>
                    </div>
                </div>
            </div>
        </div>

        <div id="popupCompare" class="product-gird__quick-view-popup mfp-hide popup-width">
            <CategoryCompare />                                    
        </div>


        <div class="sticy-header">
            <div class="mobile-menu d-lg-none d-block">
                <div class="mobile-menu__menu-top border-bottom-0">
                    <div class="container">
                        <div class="row">
                            <div class="menu-info d-flex justify-content-between align-items-center">
                                <div class="menubar"> <span></span> <span></span> <span></span> </div> 
                                <router-link to="/" class="logo"> 
                                    <img src="/assets/images/logo/logo.png" alt=""> 
                                </router-link>
                                <div class="cart-holder">
                                    <a @click.prevent="getCart();getTotalCart()" href="#0" class="number cart cart-icon position-relative">
                                        <i class="flaticon-shopping-cart"></i>
                                        <span v-if="getCartCount > 0" class="count mobile-cart-count">({{ getCartCount }})</span> 
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container position-relative d-lg-block d-none">
                <div class="d-flex align-items-center justify-content-between"> 
                    <router-link to="/" class="logo me-2"> 
                        <img src="/assets/images/logo/logo.png" alt=""> 
                    </router-link>
                    
                    <nav>
                        <ul class="page-dropdown-menu d-flex align-items-center justify-content-center">
                            <!-- <li class="dropdown-list"> <router-link to="/"> <span>Home</span></router-link></li>
                            <li class="dropdown-list"> <router-link to="/products"> <span>Продукти</span></router-link></li> -->
                            <li class="dropdown-list"> 
                                <div class="search-box menu d-flex align-items-center justify-content-center" style="padding:10px"> 
                                    <input type="text" v-model="searchValue" class="form-control"
                                        placeholder="Знайти товари">
                                    <template v-if="searchValue !== ''">
                                        <router-link :to="{name: 'products.search', params: {searchVal: searchValue}}">  
                                            <span class="search-icon"> <i class="flaticon-loupe"></i> </span> 
                                        </router-link>
                                    </template>
                                    <template v-else>
                                        <span class="search-icon"> <i class="flaticon-loupe"></i> </span> 
                                    </template>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    
                    <div class="right d-flex align-items-center justify-content-end">
                        <ul class="main-menu__widge-box d-flex align-items-center ">
                            <li class="d-lg-block d-none">
                                <a @click.prevent="checkCompare()" :class="[getCompareCategoryCount > 0 ? 'number popup_link' : 'number']" :href="[getCompareCategoryCount > 0 ? '#popupCompare' : '']">
                                    <i class="flaticon-left-and-right-arrows"></i> 
                                    <span v-if="getCompareCount > 0" class="count">({{ getCompareCount }})</span> 
                                </a> 
                            </li>
                            <li class="d-lg-block d-none">
                                <template v-if="token">
                                    <router-link @click.prevent="setIsLikeFromMainPage(true)" :to="{name: 'user.account'}" class="number">
                                        <i class="flaticon-heart"></i> 
                                        <span v-if="getLikeCount > 0" class="count">({{ getLikeCount }})</span>
                                    </router-link>
                                </template>
                                <template v-else>
                                    <router-link :to="{name: 'user.login'}" class="number">
                                        <i class="flaticon-heart"></i> 
                                    </router-link>
                                </template>
                            </li>
                            <li class="cartm"> 
                                <a @click.prevent="getCart();getTotalCart()" href="#0" class="number cart-icon"> 
                                    <i class="flaticon-shopping-cart"></i>
                                    <span v-if="getCartCount > 0" class="count">({{ getCartCount }})</span> 
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="side-cart-closer"></div>
        <div class="side-cart d-flex flex-column justify-content-between">
            <SideCart />
        </div>

    </header>
    <router-view :key="$route.fullPath">
    </router-view>
    

    <!--  Footer Three start -->
    <footer class="footer-default footer-3 "> 
        <div class="footer_bottom position-relative">
            <div class="container">
                <div class="footer_bottom_content">
                    <div class="copyright wow fadeInUp animated">
                        <p>© 2023 <router-link to="/">Karte</router-link></p>
                    </div>
                    <div class="footer-payment wow fadeInUp animated" style="margin-right: 3%">
                        <a href="https://www.visa.com.ua/uk_UA"> <img src="/assets/images/home-four/method-1.jpg" alt="payment"> </a>
                        <a href="https://www.mastercard.ua/uk-ua.html"> <img src="/assets/images/home-four/method-2.jpg" alt="payment"> </a>
                        <a href="https://support.apple.com/uk-ua"> <img src="/assets/images/home-four/method-3.jpg" alt="payment"> </a>
                        <a href="https://www.paypal.com/"> <img src="/assets/images/home-four/method-4.jpg" alt="payment"> </a>  
                    </div> 
                </div>
            </div>
        </div>
    </footer>
  </div>
</template>

<script>

import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';
import CategoryCompare from './components/CategoryCompare';  
import SideCart from './components/SideCart';   
  export default {
    name: "App",
    components: {
        CategoryCompare,
        SideCart
    },
    mounted(){
        $(document).trigger('changed_'),
        this.getToken(),
        this.loadLikeProduct(),
        this.getCart(),
        this.getUserName()
        this.getCompare()
        this.getCompareCategory()
    },
    computed: {
            ...mapGetters('compareModule',[
                'getCompareCount',
                'getCompareCategoryCount'
            ]),
            ...mapGetters('cartModule',[
                'getCartCount'
            ]),
            ...mapState('accountModule',[
                'token',
                'userName'
            ]),
            ...mapState('likeModule',[
                'isChangeLike'
            ]),
            ...mapGetters('likeModule',[
                'getLikeCount'
            ]),
            searchValue: {
                get() {
                    return this.$store.state.indexProductsModule.searchText
                },
                set(value) {
                    this.$store.commit('indexProductsModule/setSearchText', value)
                }
            },
        },
    data() {
        return {
            productsInCart: [],
            productsCompare: [],
            total: 0,
            storageCategory: [],
            storageProductsMinCompare: [],
            visibled: "visible",
            displayed: "block"
        }
    },
    methods: {
        ...mapActions('likeModule',[
            'getProductsLike',
            'checkLoadLike'
        ]),
        ...mapActions('compareModule',[
            'getCompare',
            'getCompareCategory',
            'checkCompare'
        ]),
        ...mapActions('cartModule',[
            'getCart',
            'getTotalCart'
        ]),
        ...mapActions('accountModule',[
            'getToken',
            'getUserName'
        ]),
        ...mapMutations('likeModule',[
            'setIsLikeFromMainPage'
        ]),
        loadLikeProduct(){
            if(this.token){
                this.getProductsLike();
            }
        },
        setSearch(){
            if(this.searchValue === ''){
                this.searchValue = this.$route.params.searchVal;
            }
        },
        setSearchEmpty(){
            this.searchValue = '';     
        }
    }
  }
  
</script>

<style>
.search-box.menu .search-icon{
    top:50%;
    right:11px;
    color:white;
    background:green;
    width:50px;
    height:47px;
}
.search-icon{
    display:flex;
    justify-content: center;
    align-items: center;
    border-radius:5px;
}
.search-box.menu input{
   border-radius:5px; 
}
.dropdown-list .description-list{
    margin-left:5px;
    margin-right:2px;
}
.mobile-cart-count{
    font-size:9pt;
}
.mobile-search{
    width: 50px;
    height:47px;;
}
</style>
