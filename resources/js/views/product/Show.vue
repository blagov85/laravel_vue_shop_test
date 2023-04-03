<template>
    <div>
        <main>
            <!--Start Shop Details Breadcrumb-->
            <div class="shop-details-breadcrumb wow fadeInUp animated overflow-hidden ">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="shop-details-inner">
                                <ul class="shop-details-menu">
                                    <li><a href="index.html">Home</a></li>
                                    <li class="active">Shop Details</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Shop Details Breadcrumb-->
            <!--Start Shop Details Top-->
            <section v-if="product" class="shop-details-top two ">
                <div class="container">
                    <div class="row mt--30">
                        <div v-if="product.product_images" class="col-xl-6 col-lg-6 mt-30 wow fadeInUp animated">
                            <div  class="single-product-box one">
                                <div class="big-product single-product-one slider-for">
                                    <div v-for="image in product.product_images" v-bind:key="image.id">
                                        <div class="single-item"> <img :src="image.url" alt="">
                                            <div v-if="product.old_price" class="ptag"> <span class="one">-{{ percentDiscount }}% </span> </div> 
                                            <a v-if="token" @click.prevent="likeProduct(product)" href="#0" 
                                                v-bind:class="[product.like == true ? 'love-active' : 'love']">
                                                <i class="flaticon-like"></i> 
                                            </a>
                                            <router-link v-else :to="{name: 'user.login', query: { pathFrom: `/product/${this.$route.params.id}` } }" class="love">
                                                <i class="flaticon-like"></i>
                                            </router-link>
                                        </div>
                                    </div>
                                </div>
                                <div class="navholder">
                                    <div class="product-slicknav single-product-one-nav slider-nav">
                                        <div v-for="image in product.product_images" v-bind:key="image.id"> 
                                            <span class="single-item"><img :src="image.url" alt=""></span>          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 mt-30 wow fadeInUp animated">
                            <div class="shop-details-top-right ">
                                <div class="shop-details-top-right-content-box">
                                    <div class="shop-details-top-review-box">
                                        <div class="shop-details-top-review">
                                            <div class="stars-outer">
                                                <div class="stars-inner" :style="{width: percentRating + '%'}"></div>
                                            </div>
                                            <p>({{ product.count_rating }} Reviews)</p>
                                        </div>
                                    </div>
                                    <div class="shop-details-top-title">
                                        <h3>{{ product.title }}</h3>
                                    </div>
                                    <ul class="shop-details-top-info">
                                        <li><span>SKU:</span> {{ product.id }}</li>
                                    </ul>
                                    <div class="shop-details-top-price-box">
                                        <!--<h3>100<del >50</del></h3>-->
                                        <h3>${{ product.price }}<del v-if="product.old_price">{{ product.old_price }}</del></h3>
                                    </div>
                                    <ul class="shop-details-top-category-tags">
                                        <li>Brand: <span>{{ product.brand.title }}</span></li>
                                        <li>Sex: <span>{{ product.sex.title }}</span></li>
                                        <li>Category: <span>{{ product.category.title }}</span></li>
                                        <li>Tags: <span>{{ tags }}</span></li>
                                        <li>Material: <span>{{ materials }}</span></li>
                                        <li>Season: <span>{{ seasons }}</span></li>
                                        <li>Country: <span>{{ product.country.title }}</span></li>
                                        <li>Color: 
                                            <span>
                                                <template v-for="color in product.colors" v-bind:key="color.id">
                                                    <div class="d-inline-block mr-0.25 color-product" :style="`background: #${color.title}`"></div>
                                                </template>
                                            </span>
                                        </li>
                                    </ul>
                                    <div class="shop-details-top-size-box">
                                        <h4>Size: <span v-if="countOfSizeObj">({{ countOfSizeObj.title }})</span></h4>
                                        <div class="shop-details-top-size-list-box">
                                            <ul class="shop-details-top-size-list">
                                                <li v-for="countSize in product.counts" v-bind:key="countSize.id">
                                                    <a @click.prevent="setProductSize(countSize)" href="#0">{{ countSize.title }}</a>
                                                </li>
                                            </ul>
                                            <p class="shop-details-top-size-guide"><a href="#popupSizeInfo" class="popup_link">Size Guide</a></p>
                                        </div>
                                    </div>
                                    <div class="product-quantity">
                                        <h4>Quantity</h4>
                                        <div class="product-quantity-box d-flex align-items-center flex-wrap">
                                            <div class="qty mr-2">
                                                <div class="qtySelector text-center"> 
                                                    <span class="decreaseQty" @click.prevent="decreaseCount()"><i class="flaticon-minus"></i></span>
                                                    <input type="number" class="qtyValue" v-model="countForCart" /> 
                                                    <span class="increaseQty" @click.prevent="increaseCount()"> <i class="flaticon-plus"></i> </span> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="shop-details-top-order-now"> <i class="flaticon-point"></i>
                                        <p v-if="countOfSizeObj">Order Now, Only {{ countOfSizeObj.count }} Left !</p>
                                        <p v-else>Choose size</p>
                                    </div>
                                    <div v-if="countOfSizeObj" class="shop-details-top-cart-box-btn"> 
                                        <button v-if="countOfSizeObj" @click.prevent = "addToCart({'product': product, 'countOfSizeObj': countOfSizeObj, 'countForCart': countForCart});productSizeNull()" class="btn--primary"> Add to Cart </button>
                                        <button v-else @click.prevent = "" class="btn--primary"> Add to Cart </button>
                                        <!-- <button @click.prevent = "addToCart(product, countOfSizeObj)" class="btn--primary style2 " 
                                            type="submit">Add to Cart</button>  -->
                                    </div>
                                    <div v-else class="shop-details-top-cart-box-btn"> 
                                        <button @click.prevent = "" class="btn--primary style2 " 
                                            type="submit">Add to Cart</button> 
                                    </div>
                                    <div class="compare-product"> 
                                        <a href="#0" @click.prevent="addToCompare(product);getCompareCategory()">
                                            <div class="icon"> <i class="flaticon-left-and-right-arrows"></i> </div>
                                            <div class="text"><p>Add to Compare</p></div>
                                        </a> 
                                    </div>
                                    <p v-if="product.count_likes > 0" class="shop-details-top-product-sale">
                                        <span>{{ this.product.count_likes }}</span> Persons looking for this product
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--End Shop Details Top-->
            <!--PopupSizeInfo-->
            <div id="popupSizeInfo" class="product-gird__quick-view-popup mfp-hide popup-width">
                <SizeTable/>
            </div>
            <!--EndPopupSizeInfo-->
            <!-- productdrescription-tabStart -->
            <section v-if="product" class="product pt-60 pb-60 wow fadeInUp overflow-hidden ">
                <div class="container">
                    <div class="row wow fadeInUp animated">
                        <div class="col-12">
                            <ul class="nav product-details-nav nav-one nav-pills justify-content-center" id="pills-tab-two"
                                role="tablist">
                                <li class="nav-item" role="presentation"> <button class="nav-link active"
                                        id="pills-description-tab" data-bs-toggle="pill" data-bs-target="#pills-description"
                                        type="button" role="tab" aria-controls="pills-description" aria-selected="true">
                                        Description </button> </li>
                                <li class="nav-item" role="presentation"> <button class="nav-link" id="pills-additional-tab"
                                        data-bs-toggle="pill" data-bs-target="#pills-additional" type="button" role="tab"
                                        aria-controls="pills-additional" aria-selected="false"> Additional </button> </li>
                                <li class="nav-item" role="presentation"> <button class="nav-link" id="pills-review-tab"
                                        data-bs-toggle="pill" data-bs-target="#pills-review" type="button" role="tab"
                                        aria-controls="pills-review" aria-selected="false"> Review </button> </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row wow fadeInUp animated">
                        <div class="tab-content" id="pills-tabContent-two">
                            <div class="tab-pane fade show active" id="pills-description" role="tabpanel"
                                aria-labelledby="pills-description-tab">
                                <div class="product-drescription">
                                    <h4> Product Details:</h4>
                                    <p>{{ product.description }}</p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-additional" role="tabpanel"
                                aria-labelledby="pills-additional-tab">
                                <div class="product-drescription">
                                    <p class="pt-0" v-html="product.content"></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                                <div class="product-drescription">
                                    <FeedbackList />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section> 
            <!-- productdrescription-tab End -->
            <!-- recent-products Start -->
            <SliderProduct title="Recent Products" :products="recentProducts" />
        </main>
    </div>
</template>

<script>

import { mapState, mapMutations, mapActions } from 'vuex';
import FeedbackList from '../../components/FeedbackList';
import SliderProduct from '../../components/SliderProduct';
import SizeTable from '../../components/SizeTable';
import utils from '../../utils';

export default {
    name: "Show",
    components: {
        FeedbackList, //list of feedbacks of product (nested FeedbackNew)
        SliderProduct, //container-slider for products (nested ProductForSlider)
        SizeTable //table of sizes
    },
    mounted(){
        $(document).trigger('changed_'),
        this.getProduct(this.$route.params.id), //get data of product about its id
        this.getRecentProducts(this.$route.params.id), //get list recent products about product's category id
        this.setSearchText('')
    },
    beforeUnmount(){
        this.setRecentProducts([]);
        this.setProduct(null);
    },
    computed: {
        ...mapState('accountModule',[
            'token'
        ]),
        ...mapState('productOneModule',[
            'product'
        ]),
        ...mapState('productsModule',[
            'recentProducts'
        ]),
        //list options to string options (through coma)
        materials() {
            return utils.getProductDataToString(this.product.materials);
        },
        seasons() {
            return utils.getProductDataToString(this.product.seasons);
        },
        tags() {
            return utils.getProductDataToString(this.product.tags);
        },
        percentRating(){
            return utils.percentRatingStar(this.product.rating)
        },
        //get percent of discount
        percentDiscount(){
            return utils.percentDiscountProduct(this.product.price, this.product.old_price)
        }
    },
    data() {
        return {  
            maxCountSize: 1,
            countOfSizeObj: null,
            countForCart: 1
        }
    },
    methods: {
        ...mapActions('accountModule',[
            'getToken'
        ]),
        ...mapActions('productOneModule',[
            'getProduct'
        ]),
        ...mapMutations('productOneModule',[
            'setProduct'
        ]),
        ...mapMutations('productsModule',[
            'setRecentProducts'
        ]),
        ...mapMutations('indexProductsModule',[
            'setSearchText'
        ]),
        ...mapActions('popupProductModule',[
            'popupProductNull',
            'getPopupProduct'
        ]),
        ...mapActions('productsModule',[
            'getRecentProducts'
        ]),
        ...mapActions('compareModule',[
            'addToCompare', //add or delete product in array compare
            'getCompareCategory'
        ]),
        ...mapActions('likeModule',[
            'likeProduct' //add or delete product in array like
        ]),
        ...mapActions('cartModule',[
            'addToCart'
        ]),
        //change count of product for purchase
        decreaseCount(){
            if(this.countForCart === 1) return;
            this.countForCart--;
        },
        increaseCount(){
            if(this.countForCart === this.maxCountSize) return;
            this.countForCart++;
        },
        productSizeNull(){
            this.countOfSizeObj = null;
            this.countForCart = 1;
            this.maxCountSize = 1;
        },
        setProductSize(countOfSize){
            this.countOfSizeObj = countOfSize;
            this.maxCountSize = this.countOfSizeObj.count;
            this.countForCart = 1;
        }
    }
}
</script>

<style scoped>
    .btn--primary{
        background:black;
        color:white;
        border: none;
    }
    .color-product{
        width:20px; 
        height:20px; 
        margin-right:10px;
        border-radius: 3px;
        border: 1px solid grey;
    }
    .compare-product a{
        display: flex;
        margin-top: 10px;
        color: grey;
    }
    .compare-product a .icon{
        margin-right: 5px;
    }
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
</style>