<template>
    <div>
        <main class="overflow-hidden ">
        <!--Start Breadcrumb Style2-->
        <div class="breadcrumb-area" style="background-image: url(/assets/images/inner-pages/breadcum-bg.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-content pb-60 text-center wow fadeInUp animated">
                            <h2>Shop Grid</h2>
                            <div class="breadcrumb-menu">
                                <ul>
                                    <li><a href="index.html"><i class="flaticon-home pe-2"></i>Home</a></li>
                                    <li> <i class="flaticon-next"></i> </li>
                                    <li class="active">Shop Grid</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Breadcrumb Style2-->
        <!--Start Product Categories One-->
        <section v-if="product" class="product-categories-one pb-60">
            <div class="container">
                <div class="row wow fadeInUp animated">
                    <div class="col-xl-12">
                        <div class="product-categories-one__inner">
                            <ul>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img1.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Accessories</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img2.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Furnitures</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img3.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Jewellery</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img4.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Shoes</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img5.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Electronics</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img6.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Fashion</h6>
                                        </a> </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Product Categories One-->
        <!--Start product-grid-->
        <div class="product-grid pt-60 pb-120">
            <div class="container">
                <div v-if="products.length > 0" class="row gx-4">
                    <div class="col-xl-3 col-lg-4">
                        <div class="shop-grid-sidebar"> <button class="remove-sidebar d-lg-none d-block"> <i
                                    class="flaticon-cross"> </i> </button>
                            <div class="sidebar-holder">
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated ">
                                    <h4>Select Brands</h4>
                                    <div class="checkbox-item">
                                        <form>
                                            <div v-for="brand in filterList.brands" v-bind:key="brand.id" class="form-group"> 
                                                <input type="checkbox" :value="brand.id" v-model="brands" :id="`brand${brand.id}`"> 
                                                <label :for="`brand${brand.id}`">{{ brand.title }}</label> </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated ">
                                    <h4>Select Categories</h4>
                                    <div class="checkbox-item">
                                        <form>
                                            <div v-for="category in filterList.categories" v-bind:key="category.id" class="form-group"> 
                                                <input type="checkbox" :value="category.id" v-model="categories" :id="`category${category.id}`"> 
                                                <label :for="`category${category.id}`">{{ category.title }}</label> </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated ">
                                    <h4>Select Sex</h4>
                                    <div class="checkbox-item">
                                        <form>
                                            <div v-for="sexOne in filterList.sex" v-bind:key="sexOne.id" class="form-group"> 
                                                <input type="checkbox" :value="sexOne.id" v-model="sex" :id="`sexOne${sexOne.id}`"> 
                                                <label :for="`sexOne${sexOne.id}`">{{ sexOne.title }}</label> </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated">
                                    <h4>Color Option </h4>
                                    <ul class="color-option">
                                        <li v-for="color in filterList.colors" v-bind:key="color.id"> 
                                            <a @click.prevent="addColor(color.id)" :id="`color${color.id}`" href="#0" class="color-option-single" :style="`background: #${color.title}`"> <span>{{ color.title }}</span> </a> 
                                        </li>
                                    </ul>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated">
                                    <h4>Filter By Price</h4>
                                    <div class="slider-box">
                                        <div id="price-range" class="slider"></div>
                                        <div class="output-price"> <label for="priceRange">Price:</label> <input
                                                type="text" id="priceRange" readonly> 
                                        </div> 
                                    </div>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated">
                                    <h4>Sizes</h4>
                                    <ul class="popular-tag">
                                        <li v-for="size in filterList.sizes" v-bind:key="size.id">
                                            <a @click.prevent="addSize(size.id)" :id="`size${size.id}`" href="#0">{{ size.title }}</a></li>
                                    </ul>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated">
                                    <h4>Seasons</h4>
                                    <ul class="popular-tag">
                                        <li v-for="season in filterList.seasons" v-bind:key="season.id">
                                            <a @click.prevent="addSeason(season.id)" :id="`season${season.id}`" href="#0">{{ season.title }}</a></li>
                                    </ul>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated">
                                    <h4>Materials</h4>
                                    <ul class="popular-tag">
                                        <li v-for="material in filterList.materials" v-bind:key="material.id">
                                            <a @click.prevent="addMaterial(material.id)" :id="`material${material.id}`" href="#0">{{ material.title }}</a></li>
                                    </ul>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated">
                                    <h4>Countries</h4>
                                    <ul class="popular-tag">
                                        <li v-for="country in filterList.countries" v-bind:key="country.id">
                                            <a @click.prevent="addCountry(country.id)" :id="`country${country.id}`" href="#0">{{ country.title }}</a></li>
                                    </ul>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated">
                                    <h4>Tags </h4>
                                    <ul class="popular-tag">
                                        <li v-for="tag in filterList.tags" v-bind:key="tag.id">
                                            <a @click.prevent="addTag(tag.id)" :id="`tag${tag.id}`" href="#0">{{ tag.title }}</a></li>
                                    </ul>
                                </div>
                                <div class="single-sidebar-box mt-30 wow fadeInUp animated pb-0 border-bottom-0 ">
                                    <div class="slider-box">
                                        <button @click.prevent="filterProducts" class="filterbtn"
                                                type="submit"> Filter 
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-8">
                        <div class="row">
                            <div class="col-xl-12">
                                <div
                                    class="shop-grid-page-top-info p-0 justify-content-md-between justify-content-center">
                                    <div class="left-box wow fadeInUp animated">
                                        <p>Showing {{ this.pagination.from }}–{{ this.pagination.to }} of {{ this.pagination.total }} Results</p>
                                    </div>
                                    <div
                                        class="right-box justify-content-md-between justify-content-center wow fadeInUp animated">
                                        <div class="short-by">
                                            <div class="select-box">
                                                <select class="wide" v-model="filterKey" @change="getProducts()">
                                                    <option v-for="sort in filterList.sorting" v-bind:key="sort.id" :value="sort.key_sort">{{ sort.title }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="product-view-style d-flex justify-content-md-between justify-content-center">  
                                             <div class="select-box-item">
                                                <select class="wide" v-model="countItemsPage" @change="getProducts()">
                                                    <option value="4">4</option>
                                                    <option value="6">6</option>
                                                    <option value="12">12</option>
                                                    <option value="18">18</option>
                                                    <option value="24">24</option>
                                                    <option value="30">30</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-grid" role="tabpanel"
                                        aria-labelledby="pills-grid-tab">
                                        <div class="row">
                                            <div v-for="product in products" v-bind:key="product.id" class="col-xl-4 col-lg-6 col-6 ">
                                                <div class="products-three-single w-100  mt-30">
                                                    <div class="products-three-single-img"> 
                                                        <router-link :to="{name: 'product.show', params: {id: product.id}}"> 
                                                            <img :src="product.image_url" class="first-img" alt="" /> 
                                                            <img :src="product.image_url" class="hover-img" alt="" />
                                                        </router-link>
                                                        <div class="products-grid-one__badge-box"> <span
                                                                class="bg_base badge new ">New</span>
                                                        </div> 
                                                        <a @click.prevent="popupProductNull();getProduct(product.id)" :href="`#popupForSize${product.id}`" 
                                                                class="addcart btn--primary style2 popup_link">
                                                            Add To Cart 
                                                        </a>
                                                        <div class="products-grid__usefull-links">
                                                            <ul>
                                                                <li>
                                                                    <a v-if="getToken()" @click.prevent="likeProduct(product.id)" href="#0">
                                                                        <i v-if="product.like == true" class="fas fa-heart"></i> 
                                                                        <i v-else class="flaticon-heart"></i> 
                                                                        <span>wishlist</span>
                                                                    </a>
                                                                    <router-link v-else :to="{name: 'user.login'}">
                                                                        <i class="flaticon-heart"></i>
                                                                    </router-link>
                                                                </li>
                                                                <li>
                                                                    <a @click.prevent="addToCompare(product)" href="#0"> 
                                                                        <i class="flaticon-left-and-right-arrows"></i>
                                                                        <span>compare</span> 
                                                                    </a> 
                                                                </li>
                                                                <li>
                                                                    <a @click.prevent="popupProductNull();getProduct(product.id)" :href="`#popup${product.id}`" class="popup_link"> 
                                                                        <i class="flaticon-visibility"></i>
                                                                        <span> quick view</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div :id="`popup${product.id}`" class="product-gird__quick-view-popup mfp-hide">
                                                        <div v-if="popupProduct" class="container">
                                                            <div class="row justify-content-between align-items-center">
                                                                <div class="col-lg-6">
                                                                    <div class="quick-view__left-content">
                                                                        <div class="tabs">
                                                                            <div class="popup-product-thumb-box">
                                                                                <ul>
                                                                                    <li v-for="productImage in popupProduct.product_images" v-bind:key="productImage.id"
                                                                                        class="tab-nav popup-product-thumb">
                                                                                        <a :href="`#tabb${productImage.id}`">
                                                                                            <img :src="productImage.url" alt="" /> 
                                                                                        </a> 
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="popup-product-main-image-box">
                                                                                <div v-for="productImage in popupProduct.product_images" v-bind:key="productImage.id"
                                                                                    :id="`tabb${productImage.id}`"
                                                                                    class="tab-item popup-product-image">
                                                                                    <div class="popup-product-single-image">
                                                                                        <img :src="productImage.url" alt="" /> 
                                                                                    </div>
                                                                                </div>
                                                                                <button class="prev"> <i class="flaticon-back"></i></button> 
                                                                                <button class="next"> <i class="flaticon-next"></i></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="popup-right-content">
                                                                        <h3>{{ popupProduct.title }}</h3>
                                                                        <div class="ratting">
                                                                            <div class="stars-outer">
                                                                                <div class="stars-inner" :style="{width: percentRatingStar() + '%'}"></div>
                                                                            </div> 
                                                                            <span>({{ popupProduct.count_rating }})</span> 
                                                                        </div>
                                                                        <p class="text"> {{ popupProduct.description }} </p>
                                                                        <div class="price">
                                                                            <h2> {{ popupProduct.price }} <del v-if="popupProduct.old_price"> {{ popupProduct.old_price }}</del></h2>
                                                                            <h6> In stuck</h6>
                                                                        </div>
                                                                        <div class="color-varient"> 
                                                                            <h6>Color</h6>
                                                                            <template v-for="color in popupProduct.colors" v-bind:key="color.id">
                                                                                <div class="d-inline-block mr-0.25" :style="`background: #${color.title}; width:20px; height:20px; margin-right:10px`"></div>
                                                                            </template> 
                                                                        </div>
                                                                        <div class="color-varient"> 
                                                                            <h6>Similar products</h6>
                                                                            <template v-for="groupProduct in popupProduct.group_products" v-bind:key="groupProduct.id">
                                                                                <a @click.prevent="getProduct(groupProduct.id)" href="#0" class="color-name" style="background: none"> 
                                                                                    <img :src="groupProduct.image_url" alt=""> 
                                                                                    <span>{{ groupProduct.title }}</span>
                                                                                </a>
                                                                            </template> 
                                                                        </div>
                                                                        <!--size-->
                                                                        <div class="shop-details-top-size-box">
                                                                            <h4>Size: <span v-if="countOfSizeObj">({{ countOfSizeObj.title }})</span></h4>
                                                                            <div class="shop-details-top-size-list-box">
                                                                                <ul class="shop-details-top-size-list">
                                                                                    <li v-for="countOfSize in popupProduct.counts" v-bind:key="countOfSize.id">
                                                                                        <a @click.prevent="setProductSize(countOfSize)" href="#0">{{ countOfSize.title }}</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <!--endsize-->
                                                                        <div class="add-product">
                                                                            <h6>Qty:</h6>
                                                                            <div class="button-group">
                                                                                <div class="qtySelector text-center">
                                                                                    <span class="decreaseQty" @click.prevent="decreaseCount()"><i class="flaticon-minus"></i></span>
                                                                                    <input type="number" class="qtyValue" v-model="countForCart" /> 
                                                                                    <span class="increaseQty" @click.prevent="increaseCount()"> <i class="flaticon-plus"></i> </span> 
                                                                                </div>
                                                                                <button v-if="countOfSizeObj" @click.prevent = "addToCart(product, countOfSizeObj)" class="btn--primary mfp-close"> Add to Cart </button>
                                                                                <button v-else @click.prevent = "" class="btn--primary"> Add to Cart </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div :id="`popupForSize${product.id}`" class="product-gird__quick-view-popup mfp-hide" style="width:50%">
                                                        <div v-if="popupProduct" class="container">
                                                            <div class="row justify-content-between align-items-center">
                                                                <div class="col-lg-12">
                                                                    <div class="popup-right-content">
                                                                        <h3>{{ popupProduct.title }}</h3>
                                                                        <!--size-->
                                                                        <div class="shop-details-top-size-box">
                                                                            <h4>Size: <span v-if="countOfSizeObj">({{ countOfSizeObj.title }})</span></h4>
                                                                            <div class="shop-details-top-size-list-box">
                                                                                <ul class="shop-details-top-size-list">
                                                                                    <li v-for="countOfSize in popupProduct.counts" v-bind:key="countOfSize.id">
                                                                                        <a @click.prevent="setProductSize(countOfSize)" href="#0">{{ countOfSize.title }}</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <!--endsize-->
                                                                        <div class="add-product">
                                                                            <h6>Qty:</h6>
                                                                            <div class="button-group">
                                                                                <div class="qtySelector text-center">
                                                                                     <span class="decreaseQty" @click.prevent="decreaseCount()"><i class="flaticon-minus"></i></span>
                                                                                    <input type="number" class="qtyValue" v-model="countForCart" /> 
                                                                                    <span class="increaseQty" @click.prevent="increaseCount()"> <i class="flaticon-plus"></i> </span> 
                                                                                </div>
                                                                                <button v-if="countOfSizeObj" @click.prevent = "addToCart(product, countOfSizeObj)" class="btn--primary mfp-close"> Add to Cart </button>
                                                                                <button v-else @click.prevent = "" class="btn--primary"> Add to Cart </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="products-three-single-content text-center"> <span>{{ product.category.title }}</span>
                                                        <h5><router-link :to="{name: 'product.show', params: {id: product.id}}"> {{ product.title }} </router-link>
                                                        </h5>
                                                        <p><del v-if="product.old_price">{{ product.old_price }}</del> {{ product.price }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" v-if="pagination.last_page > 1">
                            <div class="col-12 d-flex justify-content-center wow fadeInUp animated">
                                <ul class="pagination text-center">
                                    <li v-if="pagination.current_page !== 1" class="next"><a href="#0" @click.prevent = "getProducts(pagination.current_page-1)">
                                        <i class="flaticon-left-arrows" aria-hidden="true"></i></a>
                                    </li>
                                    <li v-for="link in pagination.links" v-bind:key="link.label">
                                        <template v-if="(Number(link.label) && 
                                            (pagination.current_page - link.label < 2) &&
                                            (link.label - pagination.current_page < 2)) ||
                                            (Number(link.label) === 1) ||
                                            (Number(link.label) === pagination.last_page)">
                                            <a :class="link.active ? 'active' : ''" href="#0" @click.prevent = "getProducts(link.label)">{{ link.label }}</a>
                                        </template>
                                        <template v-if="(Number(link.label) && 
                                            (pagination.current_page !== 3) && 
                                            (pagination.current_page - link.label === 2)) ||
                                            (Number(link.label) && 
                                            (pagination.last_page - pagination.current_page !== 2) && 
                                            (link.label - pagination.current_page === 2))">
                                            <a>...</a>
                                        </template>
                                        
                                    </li>

                                    <li v-if="pagination.current_page !== pagination.last_page" class="next" @click.prevent = "getProducts(pagination.current_page+1)">
                                        <a href="#0"><i class="flaticon-next-1" aria-hidden="true"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-else class="row gx-4">
                    <h3 style="padding:0 auto">По данному запросу ничего не найдено</h3>
                </div>
            </div>
        </div>
        <!--End product-grid-->
        </main>
    </div>
</template>

<script>
export default {
    name: "Search",
    mounted(){
        $(document).trigger('changed_')
        this.getProducts(),
        this.getFilterList()
    },
    beforeDestroy(){
        this.setSearchEmpty()
    },
    data() {
        return {
            products: [],
            popupProduct: null,
            filterList: [],
            categories: [],
            sex: [],
            brands: [],
            countries: [],
            materials: [],
            seasons: [],
            sizes: [],
            colors: [],
            tags: [],
            prices: [],
            pagination: [],
            maxCountSize: 1,
            countOfSizeObj: null,
            countItemsPage: 12,
            filterKey: "DEFAULT_KEY",
            backgroundActive: "#f69c63",
            backgroundDeactive: "#f1f1f1",
            fontActive: "#ffffff",
            fontDeactive: "#555555",
            border: "solid 1px #161FCA",
            countForCart: 1
        }
    },
    methods: {
        decreaseCount(){
            if(this.countForCart === 1) return;
            this.countForCart--;
        },
        increaseCount(){
            if(this.countForCart === this.maxCountSize) return;
            this.countForCart++;
        },
        addToCart(product, countOfSizeObj){
            let qty = Number(this.countForCart);
            let cart = localStorage.getItem('cart');
            this.countForCart = 1; 
            
            let newProduct = [
                    {
                        'id': product.id,
                        'title': product.title,
                        'price': product.price,
                        'image_url': product.image_url,
                        'size_id': countOfSizeObj.id,
                        'size_title': countOfSizeObj.title,
                        'qty': qty
                    }
                ];
                console.log(newProduct);
            if(!cart){
                localStorage.setItem('cart', JSON.stringify(newProduct));
            }else{
                cart = JSON.parse(cart);
                cart.forEach(productInCart => {
                    if((productInCart.id === product.id) && (productInCart.size_id === countOfSizeObj.id)){
                        productInCart.qty = Number(productInCart.qty) + Number(qty);
                        newProduct = null;
                    }
                });

                Array.prototype.push.apply(cart, newProduct);
                localStorage.setItem('cart', JSON.stringify(cart));
                this.$emit('get-cart-products')
            }
        },
        filterProducts(){
            let prices = $('#priceRange').val();
            this.prices = prices.replace(/[\s+]|[$]/g, '').split('-');
        },
        addSize(id){
            const element = document.getElementById(`size${id}`);
            if(!this.sizes.includes(id)){
                element.style.backgroundColor=this.backgroundActive;
                element.style.color=this.fontActive;
                this.sizes.push(id);
            } else {
                element.style.backgroundColor=this.backgroundDeactive;
                element.style.color=this.fontDeactive;
                this.sizes = this.sizes.filter(elem => {
                    return elem !== id;
                });
            }
        },
        addSeason(id){
            const element = document.getElementById(`season${id}`);
            if(!this.seasons.includes(id)){
                element.style.backgroundColor=this.backgroundActive;
                element.style.color=this.fontActive;
                this.seasons.push(id);
            } else {
                element.style.backgroundColor=this.backgroundDeactive;
                element.style.color=this.fontDeactive;
                this.seasons = this.seasons.filter(elem => {
                    return elem !== id;
                });
            }
        },
        addMaterial(id){
            const element = document.getElementById(`material${id}`);
            if(!this.materials.includes(id)){
                element.style.backgroundColor=this.backgroundActive;
                element.style.color=this.fontActive;
                this.materials.push(id);
            } else {
                element.style.backgroundColor=this.backgroundDeactive;
                element.style.color=this.fontDeactive;
                this.materials = this.materials.filter(elem => {
                    return elem !== id;
                });
            }
        },
        addCountry(id){
            const element = document.getElementById(`country${id}`);
            if(!this.countries.includes(id)){
                element.style.backgroundColor=this.backgroundActive;
                element.style.color=this.fontActive;
                this.countries.push(id);
            } else {
                element.style.backgroundColor=this.backgroundDeactive;
                element.style.color=this.fontDeactive;
                this.countries = this.countries.filter(elem => {
                    return elem !== id;
                });
            }
        },
        addColor(id){
            const element = document.getElementById(`color${id}`);
            if(!this.colors.includes(id)){
                element.style.border=this.border;
                this.colors.push(id);
            } else {
                element.style.border='none';
                this.colors = this.colors.filter(elem => {
                    return elem !== id;
                });
            }
        },
        addTag(id){
            const element = document.getElementById(`tag${id}`);
            if(!this.tags.includes(id)){
                element.style.backgroundColor=this.backgroundActive;
                element.style.color=this.fontActive;
                this.tags.push(id);
            } else {
                element.style.backgroundColor=this.backgroundDeactive;
                element.style.color=this.fontDeactive;
                this.tags = this.tags.filter(elem => {
                    return elem !== id;
                });
            }
        },
        popupProductNull(){
            this.popupProduct = null;
            this.countOfSizeObj = null;
            this.countForCart = 1;
            this.maxCountSize = 1;
        },
        getProducts(page = 1){
            this.axios.post(`/api/products/search`, {
                categories: this.categories,
                sex: this.sex,
                brands: this.brands,
                countries: this.countries,
                materials: this.materials,
                seasons: this.seasons,
                sizes: this.sizes,
                colors: this.colors,
                tags: this.tags,
                prices: this.prices,
                countItemsPage: this.countItemsPage,
                filterKey: this.filterKey,
                page: page,
                search: this.$route.params.searchVal
                })
                .then(res => {
                    console.log(res.data);
                    this.products = res.data.data;
                    this.pagination = res.data.meta;
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
                console.log("CREATESEARCH");
            this.$emit('set-search');
        },
        getProduct(id){
            this.axios.get(`/api/product/${id}`)
                .then(res => {
                    this.popupProduct = '';
                    this.popupProduct = res.data.data;
                    console.log(res.data.data);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        getFilterList(){
            this.axios.get(`/api/products/search/filters?search=${this.$route.params.searchVal}`)
                .then(res => {
                    this.filterList = res.data;
                    console.log(res.data);

                    //  Price Filter 
                    if ($("#price-range").length) {
                        $("#price-range").slider({
                        range: true,
                        min: this.filterList.price.min,
                        max: this.filterList.price.max,
                        values: [this.filterList.price.min, this.filterList.price.max],
                        slide: function (event, ui) {
                            $("#priceRange").val("$" + ui.values[0] + " - $" + ui.values[1]);
                        }
                        });
                        $("#priceRange").val("$" + $("#price-range").slider("values", 0) + " - $" + $("#price-range").slider("values", 1));
                    };

                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        setProductSize(countOfSize){
            this.countOfSizeObj = countOfSize;
            this.maxCountSize = this.countOfSizeObj.count;
            this.countForCart = 1;
        },
        addToCompare(product){
            let compare = localStorage.getItem('compare');
            let compareProduct = [
                    {
                        'id': product.id,
                        'category_id': product.category.id,
                        'category_title': product.category.title,
                        'title': product.title
                    }
                ];
            if(!compare){
                localStorage.setItem('compare', JSON.stringify(compareProduct));
            }else{
                compare = JSON.parse(compare);
                compare.forEach((productInCompare, index, arr) => {
                    if(productInCompare.id === product.id){
                        compareProduct = null;
                        arr.splice(index,1);
                    }
                });
                Array.prototype.push.apply(compare, compareProduct);
                localStorage.setItem('compare', JSON.stringify(compare));
                this.$emit('get-compare-products');
            }
        },
        getToken(){
            return localStorage.getItem('x_xsrf_token');
        },
        percentRatingStar(){
            return Math.round((this.popupProduct.rating / 5) * 100);
        },
        likeProduct(id){
            this.axios.get(`/api/product/${id}/like`)
                .then(res => {
                    let likeInfo = res.data.data;
                    this.products.forEach(el => {
                        if(el.id === id){
                            el.count_likes = likeInfo.count_likes;
                            el.like = likeInfo.like;
                        }
                    });
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        }
    }
}

</script>

<style scoped>
.stars-outer{
        position: relative;
        display: inline-block;
    }
    .stars-inner{
        position: absolute;
        top:0;
        left:0;
        white-space: nowrap;
        overflow: hidden;
        width:0;
    }
    .stars-inner::before{
        content: "\f005 \f005 \f005 \f005 \f005";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        color: #f69c63;
    }
    .stars-outer::before{
        content: "\f005 \f005 \f005 \f005 \f005";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        color: #ccc;
    }
    .mfp-close{
        opacity: 1;
        border: 1px solid black;
    }
</style>
