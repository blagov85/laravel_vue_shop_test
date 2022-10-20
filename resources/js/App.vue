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
                                        <div class="menubar"> <span></span> <span></span> <span></span> </div> <a
                                            href="index.html" class="logo"> <img src="/assets/images/logo/logo.png"
                                                alt=""> </a>
                                        <div class="cart-holder">
                                            <a href="#0" class="cart cart-icon position-relative">
                                                <i class="flaticon-shopping-cart"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="menu-closer"></div>
                        <div class="mobile-menu__sidebar-menu">
                            <div class="menu-closer two"> <span> Close Menu</span> <span class="cross"><i
                                        class="flaticon-cross"></i></span> </div>
                            <div class="search-box-holder">
                                <form action="#0">
                                    <div class="form-group search-box menu"> <input type="text" class="form-control"
                                            placeholder="Search for products"> <span class="search-icon"> <i
                                                class="flaticon-magnifying-glass"></i> </span> </div>
                                </form>
                            </div>
                            <ul class="page-dropdown-menu">
                                <li class="dropdown-list"> <router-link to="/"> <span>Home </span></router-link></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="d-lg-block d-none">
                    <div class="row g-0 position-relative">
                        <div class="col-lg-3 d-flex align-items-center justify-content-center border-rit ">
                            <div class="logo"> <router-link to="/"><img src="/assets/images/logo/logo.png" alt=""></router-link>
                            </div>
                        </div>
                        <div class="col-lg-9 g-0 p-0">
                            <div class="row g-0 holder">
                                <div class="col-12">
                                    <div class="some-info">
                                        <p class="d-flex align-items-center"> <span class="icon"> <i
                                                    class="flaticon-power"></i> </span> Welcome to Karte Online Shop</p>
                                        <div class="right d-flex align-items-center ">
                                            <router-link v-if="token" :to="{name: 'user.account'}">{{ this.userName }}</router-link>
                                            <router-link v-else :to="{name: 'user.login'}">Sign In / Register</router-link>
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
                                                                placeholder="Search for products">
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
                                                        <template v-if="storageCategory.length > 1">
                                                            <a class="number popup_link" href="#popupCompare">
                                                                <i class="flaticon-left-and-right-arrows"></i> 
                                                                <span v-if="storageProductsMinCompare" class="count">({{ storageProductsMinCompare.length }})</span> 
                                                            </a> 
                                                        </template>
                                                        <template v-else>
                                                            <router-link :to="{name: 'products.compare'}">
                                                                <a class="number">
                                                                    <i class="flaticon-left-and-right-arrows"></i> 
                                                                    <span v-if="storageProductsMinCompare" class="count">({{ storageProductsMinCompare.length }})</span> 
                                                                </a>
                                                            </router-link> 
                                                        </template>  
                                                    </li>
                                                    <li class="d-lg-block d-none">
                                                        <a href="wishlist.html" class="number">
                                                            <i class="flaticon-heart"></i> 
                                                            <span class="count">(2)</span> 
                                                        </a> 
                                                    </li>
                                                    <li class="cartm"> 
                                                        <a @click.prevent="getCartProducts()" href="#0" class="number cart-icon"> 
                                                            <i class="flaticon-shopping-cart"></i>
                                                            <span v-if="productsInCart" class="count">({{ productsInCart.length }})</span> 
                                                        </a> 
                                                    </li>
                                                    <li class="d-lg-block d-none"> 
                                                        <a @click.prevent="logout()" href="#0"> 
                                                           вийти
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

        <div id="popupCompare" class="product-gird__quick-view-popup mfp-hide" style="width:50%">
            <div class="container">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-12">
                        <h3>Списки сравнения</h3>
                        <div v-for="category in storageCategory" v-bind:key="category.id" class="compare-category">
                                <router-link :to="{name: 'products.compareId', params: {id: category.id}}" class="category-name" :key="$route.fullPath">
                                    <span class="mfp-close choose-category">
                                        {{ category.title }} ({{ category.count }})  
                                    </span>
                                </router-link>

                            <a class="category-delete" href="#" @click="removeCategoryCompare(category.id)">
                                <span><i class="flaticon-delete"></i></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>                                       
        </div>


        <div class="sticy-header">
            <div class="mobile-menu d-lg-none d-block">
                <div class="mobile-menu__menu-top border-bottom-0">
                    <div class="container">
                        <div class="row">
                            <div class="menu-info d-flex justify-content-between align-items-center">
                                <div class="menubar"> <span></span> <span></span> <span></span> </div> <a
                                    href="index.html" class="logo"> <img src="/assets/images/logo/logo.png" alt=""> </a>
                                <div class="cart-holder">
                                    <a href="#0" class="cart cart-icon position-relative">
                                        <i class="flaticon-shopping-cart"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container position-relative d-lg-block d-none">
                <div class="d-flex align-items-center justify-content-between"> <a href="index.html" class="logo me-2">
                        <img src="/assets/images/logo/logo.png" alt=""> </a>
                    <div class="mega-menu-default mega-menu d-lg-block d-none">
                        <div class="container ">
                            <div class="row">
                                <nav>
                                  <ul
                                        class="page-dropdown-menu d-flex align-items-center justify-content-center">
                                        <li class="dropdown-list"> <router-link to="/"> <span>Home</span></router-link></li>
                                  </ul>
                                </nav>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="side-cart-closer"></div>
        <div class="side-cart d-flex flex-column justify-content-between">
            <div class="top">
                <div class="content d-flex justify-content-between align-items-center">
                    <h6 class="text-uppercase" v-if="productsInCart">Your Cart (03) {{ productsInCart.size }}</h6>
                    <h6 class="text-uppercase" v-else>Your Cart is empty</h6> 
                    <span class="cart-close text-uppercase">X</span>
                </div>
                 <div v-if="productsInCart" class="cart_items">
                    <div v-for="productInCart in productsInCart" v-bind:key="productInCart.id" class="items d-flex justify-content-between align-items-center">
                        <div class="left d-flex align-items-center"> 
                            <router-link :to="{name: 'product.show', params: {id: productInCart.id}}" class="title">
                                <div class="thumb d-flex justify-content-between align-items-center"> 
                                    <img :src="productInCart.image_url" alt=""> 
                                </div>
                            </router-link>
                            <div class="text"> 
                                <router-link :to="{name: 'product.show', params: {id: productInCart.id}}" class="title">
                                    <h6>{{ productInCart.title }}</h6>
                                </router-link>
                                <p>{{ productInCart.qty }} X <span>{{ productInCart.price }}</span> </p>
                            </div>
                        </div>
                        <div class="right">
                            <div @click.prevent="removeProduct(productInCart.id, productInCart.size_id)" class="item-remove"> 
                                <i class="flaticon-cross"></i> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottom">
                <div class="total-ammount d-flex justify-content-between align-items-center">
                    <h6 class="text-uppercase">Total:</h6>
                    <h6 class="ammount text-uppercase">{{ total }}</h6>
                </div>
                <div class="button-box d-flex justify-content-between"> 
                    <router-link :to="{name: 'cart.index'}" class="btn_black"> View Cart</router-link> 
                    <a href="cart.html" class="button-2 btn_theme"> Chekout </a> 
                </div>
            </div>
        </div>
        <div class="sidebar-content-closer"></div>
        <div class="sidebar-content">
            <div class="sidebar-widget-container">
                <div class="widget-heading d-flex justify-content-end align-content-center"> <span
                        class="close-side-widget">X</span> </div>
                <div class="sidebar-textwidget">
                    <div class="sidebar-info-contents">
                        <div class="content-inner">
                            <div class="logo"> <a href="index.html"><img src="/assets/images/logo/logo-2.png" alt=""></a>
                            </div>
                            <div class="content-box">
                                <h4>About Us</h4>
                                <div class="inner-text">
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                        Ipsum has been the industry's standard dummy text ever since the 1500s, </p>
                                </div>
                            </div>
                            <div class="form_inner">
                                <h4>Support</h4>
                                <form action="index.html" method="post">
                                    <div class="form-group mt-4"> <input type="text" name="name" placeholder="Name"
                                            required=""> </div>
                                    <div class="form-group mt-4"> <input type="email" name="email" placeholder="Email"
                                            required=""> </div>
                                    <div class="form-group mt-4"> <textarea name="message"
                                            placeholder="Message..."></textarea> </div>
                                    <div class="form-group message-btn mt-4"> <button type="submit"
                                            class="btn--secondary"> <span class="txt">Submit Now</span> </button> </div>
                                </form>
                            </div>
                            <div class="sidebar-contact-info">
                                <h4>Contact Info</h4>
                                <ul>
                                    <li> <span class="flaticon-pin-1"></span> New York, United States </li>
                                    <li> <span class="flaticon-telephone"></span> <a href="tel:+44203700001">+44 123 456
                                            789</a> </li>
                                    <li> <span class="flaticon-mail"></span> <a
                                            href="mailto:info@example.com">info@example.com</a> </li>
                                </ul>
                            </div>
                            <div class="thm-medio-boxx1">
                                <ul class="social-box">
                                    <li class="facebook"> <a href="https://www.facebook.com/" target="_blank"><i
                                                class="flaticon-facebook-app-symbol"></i></a> </li>
                                    <li class="twitter"> <a href="https://twitter.com/" target="_blank"><i
                                                class="flaticon-twitter"></i></a> </li>
                                    <li class="instagram"> <a href="https://www.instagram.com/" target="_blank"><i
                                                class="flaticon-instagram"></i></a> </li>
                                    <li class="youtube"> <a href="https://www.youtube.com/" target="_blank"><i
                                                class="flaticon-youtube"></i></a> </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </header>
    <router-view :key="$route.fullPath" 
        @get-compare-products="getCompareProducts"
        @get-cart-products="getCartProducts"
        @set-search="setSearch"
        @set-search-empty="setSearchEmpty">
    </router-view>
    

    <!--  Footer Three start -->
    <footer class="footer-default footer-3 ">
        <div class="footer-default__shap_1 position-absolute "> <img src="/assets/images/shape/footer-shape-1.png"
                alt=""> </div>
        <!--Start Footer-->
        <div class="footer-default__main-footer position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 mt-30 wow fadeInUp animated">
                        <div class="footer-default__single-box">
                            <div class="company-info">
                                <div class="footer-title">
                                    <h4> Office</h4>
                                </div>
                                <div class="text1">
                                    <p>29 Holles Place, Dublin 2 D02 YY46</p>
                                </div>
                                <div class="text2">
                                    <p>68 Jay Street, Suite 902 New Side <br> Brooklyn, NY 11201</p>
                                </div>
                                <div class="text3">
                                    <p>New York, United States</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-6 col-md-6 col-sm-12 mt-30 wow fadeInUp animated">
                        <div class="footer-default__single-box">
                            <div class="footer-title">
                                <h4> Useful Links </h4>
                            </div>
                            <ul class="footer-links">
                                <li><a href="my-account.html">Account</a></li>
                                <li><a href="login.html">Sign In</a></li>
                                <li><a href="cart.html">View Cart</a></li>
                                <li><a href="wishlist.html">My WishList</a></li>
                                <li><a href="compare.html">Compare Products</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 mt-30 wow fadeInUp animated">
                        <div class="footer-default__single-box">
                            <div class="footer-title">
                                <h4> Information </h4>
                            </div>
                            <ul class="footer-links">
                                <li><a href="about-us.html">About us</a></li>
                                <li><a href="contact.html">Contact Us </a></li>
                                <li><a href="faq.html">Faq</a></li>
                                <li><a href="blog.html">Latest Posts</a></li>
                                <li><a href="order-track.html">Order Track</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 mt-30 wow fadeInUp animated">
                        <div class="footer-default__single-box">
                            <div class="footer-title">
                                <h4> Newsletter </h4>
                            </div>
                            <div class="footer-newsletter">
                                <p class="text">Enter your email to receive our latest updates about our products &
                                    promotions. </p>
                                <form action="#0" class="footer-default__subscrib-form">
                                    <div class="footer-input-box"> <input type="email" placeholder="Email address"
                                            name="email"> <button type="submit" class="subscribe_btn"> Subscribe
                                        </button> </div>
                                </form>
                                <div class="newsletter-bottom d-flex align-items-center">
                                    <div class="footer-title-box">
                                        <p>Follow Us:</p>
                                    </div>
                                    <div class="footer__medio-boxx  medio-boxx  d-flex align-items-center">
                                        <ul>
                                            <li><a href="https://www.facebook.com/" target="_blank" class="active"><i
                                                        class="flaticon-facebook-app-symbol"></i></a></li>
                                            <li><a href="https://www.youtube.com/" target="_blank"><i
                                                        class="flaticon-youtube"></i></a></li>
                                            <li><a href="https://twitter.com/"><i class="flaticon-twitter"
                                                        target="_blank"></i></a></li>
                                            <li><a href="https://www.instagram.com/"><i class="flaticon-instagram"
                                                        target="_blank"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- footer-bottom Footer-->
        <div class="footer_bottom position-relative">
            <div class="container">
                <div class="footer_bottom_content">
                    <div class="copyright wow fadeInUp animated">
                        <p>© 2022 <a href="index.html">Karte.</a> All Rights Reserved.</p>
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
    
  export default {
    name: "App",
    
    mounted(){
        $(document).trigger('changed_'),
        this.getCartProducts(),
        this.getCompareProducts()
        this.getToken(),
        this.getUserName()
    },
    updated(){
        this.getToken(),
        this.getUserName(),
        this.test()
    },
    data() {
        return {
            productsInCart: [],
            productsCompare: [],
            total: 0,
            storageCategory: [],
            storageProductsMinCompare: [],
            token: null,
            userName: null,
            t: 0,
            searchValue: ''
        }
    },
    methods: {
        getCartProducts(){
            this.productsInCart = JSON.parse(localStorage.getItem('cart'));
            this.getTotal();
            console.log(this.productsInCart);
            //console.log(this.productsInCart.length);
            //console.log("productsInCart is: " + this.productsInCart.length)
         },
        getTotal(){
            this.total = 0;
            if(this.productsInCart){
                this.productsInCart.forEach(product => {
                    let productSum = product.price * product.qty;
                    this.total += productSum;
                });
            }
            
        },
        removeProduct(id, sizeId){
            this.productsInCart = this.productsInCart.filter(product => {
                return ((product.id !== id) || (product.size_id !== sizeId));
            });
            this.updateCart();
        },
        updateCart(){
            localStorage.setItem('cart', JSON.stringify(this.productsInCart));
            this.getTotal();
        },
        getCompareProducts(){
            this.storageCategory.length = 0;
            this.storageProductsMinCompare = JSON.parse(localStorage.getItem('compare'));
            console.log("***");
            console.log(this.storageProductsMinCompare);
            let category = {}; 
            if(this.storageProductsMinCompare != null){
                this.storageProductsMinCompare.forEach((item, index) =>{
                    if(index == 0){
                        category.id = item.category_id;
                        category.title = item.category_title;
                        category.count = 1;
                        console.log(item);
                        this.storageCategory.push(category);
                    }else{
                        let sameCategory = false;
                        this.storageCategory.forEach(itemCategory =>{
                            if(itemCategory.id == item.category_id){
                                sameCategory = true;
                                itemCategory.count += 1; 
                            }
                        });
                        if(!sameCategory){
                            category = {};
                            category.id = item.category_id;
                            category.title = item.category_title;
                            category.count = 1;
                            this.storageCategory.push(category);
                        }
                    }
                });
            }
            console.log("tututu");
            console.log(this.storageCategory);
        },
        removeCategoryCompare(id){
            this.storageProductsMinCompare = this.storageProductsMinCompare.filter(item => {
                return item.category_id !== id;
            });
            this.storageCategory = this.storageCategory.filter(item => {
                return item.id != id;
            });
            this.updateCompare();
        },
        updateCompare(){
            localStorage.setItem('compare', JSON.stringify(this.storageProductsMinCompare));
            this.$emit('get-compare-products');
        },
        getToken(){
            this.token = localStorage.getItem('x_xsrf_token');
        },
        logout(){
            axios.post('/logout')
                .then(res => {
                    localStorage.removeItem('x_xsrf_token');
                    this.$router.push({name: 'user.login'});
                });
        },
        test(){
            this.t = this.t + 1;
            console.log(this.t);
            console.log("HIII")
        },
        getUserName(){
            if(this.token){
                axios.get('/api/user/name')
                    .then(res => {
                        this.userName = res.data.data.name;
                        console.log("user_name");
                        console.log(res.data);
                    });
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
.compare-category{
    width: 75%;
    height: 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0 auto;
}
.compare-category:hover {
    background: #e9ecef;
    cursor: pointer; 
}
.compare-category .category-name{
    color: black;
    width:80%;
    height:100%;
    display: flex;
    align-items: center;
}
.compare-category .category-delete{
    color: black;
    width:20%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.category-name .choose-category{
    width:100%;
    position: relative;
    display: flex;
    justify-content: left;
    font-size:16px;
    color: black;
}
.mfp-close{
    opacity: 1;
}
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
</style>
