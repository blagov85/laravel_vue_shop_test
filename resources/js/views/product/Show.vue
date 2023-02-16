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
                                            <div class="product-quantity-check"> <i class="flaticon-select"></i>
                                                <p>In Stock</p>
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
            <div id="popupSizeInfo" class="product-gird__quick-view-popup mfp-hide">
                <SizeTable cat="my cat"/>
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
        FeedbackList,
        SliderProduct, 
        SizeTable 
    },
    mounted(){
        $(document).trigger('changed_'),
        this.getProduct(this.$route.params.id),
        this.getRecentProducts(this.$route.params.id)
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
        percentDiscount(){
            return utils.percentDiscountProduct(this.product.price, this.product.old_price)
        }
    },
    data() {
        return {
            //product: null,
            //materials: null,
            //seasons: null,
            //tags: null,
            maxCountSize: 1,
            countOfSizeObj: null,
            //rating: null,
            // changeRating: [false,false,false,false,false],
            // chooseRating: [false,false,false,false,false],
            // textFeedback: '',
            // feedbackParentId: null,
            //popupProduct: null,
            //countOfSizeObjPopup: null, //object size of popupProduct
            //maxCountSizePopup: null, //max count of size popupProduct
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
        ...mapActions('popupProductModule',[
            'popupProductNull',
            'getPopupProduct'
        ]),
        ...mapActions('productsModule',[
            'getRecentProducts'
        ]),
        ...mapActions('compareModule',[
            'addToCompare',
            'getCompareCategory'
        ]),
        ...mapActions('likeModule',[
            'likeProduct'
        ]),
        ...mapActions('cartModule',[
            'addToCart'
        ]),
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
        // focusRating(itemStar){
        //     let i;
        //     for(i = 0; i < itemStar; i++){
        //         this.changeRating[i] = true;
        //     }
        //     for(i = itemStar; i < 5; i++){
        //         this.changeRating[i] = false;
        //     }
        // },
        // clickRating(itemStar){
        //     this.chooseRating = this.changeRating.slice(0);
        //     this.rating = itemStar;
        // },
        // fixStars(){
        //     this.changeRating = this.chooseRating.slice(0);
        // },
        // getProduct(){
        //     this.axios.get(`/api/product/${this.$route.params.id}`)
        //         .then(res => {
        //             console.log(res.data.data);
        //             this.product = res.data.data;
        //             this.materials = this.getProductDataToString(this.product.materials);
        //             this.seasons = this.getProductDataToString(this.product.seasons);
        //             this.tags = this.getProductDataToString(this.product.tags);
        //             console.log(res);
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        //     this.$emit('set-search-empty');    
        // },
        /*
        getProductDataToString(arrayObjectData){
            if (arrayObjectData !== null){
                let arrayData = [];
                arrayObjectData.forEach((el,i) => {
                    arrayData[i] = el.title;
                });
                let stringData = arrayData.join();
                stringData = stringData.replaceAll(',', ', ');
            return stringData;
            }
            else{
                return '';
            }
        },
        */
        
        // addToCart(product, countOfSizeObj){
        //     let qty = Number(this.countForCart);
        //     let cart = localStorage.getItem('cart');
        //     this.countForCart = 1;
        //     let newProduct = [
        //             {
        //                 'id': product.id,
        //                 'title': product.title,
        //                 'price': product.price,
        //                 'image_url': product.image_url,
        //                 'size_id': countOfSizeObj.id,
        //                 'size_title': countOfSizeObj.title,
        //                 'qty': qty
        //             }
        //         ];

        //     if(!cart){
        //         localStorage.setItem('cart', JSON.stringify(newProduct));
        //     }else{
        //         cart = JSON.parse(cart);
        //         cart.forEach(productInCart => {
        //             if((productInCart.id === product.id) && (productInCart.size_id === countOfSizeObj.id)){
        //                 productInCart.qty = Number(productInCart.qty) + Number(qty);
        //                 newProduct = null;
        //             }
        //         });

        //         Array.prototype.push.apply(cart, newProduct);
        //         localStorage.setItem('cart', JSON.stringify(cart));
        //         //this.$emit('get-cart-products')
        //     }
            
        // },
        // addToCompare(product){
        //     let compare = localStorage.getItem('compare');
        //     let compareProduct = [
        //             {
        //                 'id': product.id,
        //                 'category_id': product.category.id,
        //                 'category_title': product.category.title,
        //                 'title': product.title
        //             }
        //         ];
        //     if(!compare){
        //         localStorage.setItem('compare', JSON.stringify(compareProduct));
        //     }else{
        //         compare = JSON.parse(compare);
        //         compare.forEach((productInCompare, index, arr) => {
        //             if(productInCompare.id === product.id){
        //                 compareProduct = null;
        //                 arr.splice(index,1);
        //             }
        //         });
        //         Array.prototype.push.apply(compare, compareProduct);
        //         localStorage.setItem('compare', JSON.stringify(compare));
        //         this.$emit('get-compare-products');
        //     }
        // },
        // likeProduct(){
        //     this.axios.get(`/api/product/${this.$route.params.id}/like`)
        //         .then(res => {
        //             let likeInfo = res.data.data;
        //             this.product.count_likes = likeInfo.count_likes;
        //             this.product.like = likeInfo.like;
        //             console.log(res.data.data);
        //             console.log(this.product);
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // likeRecentProduct(id){
        //     this.axios.get(`/api/product/${id}/like`)
        //         .then(res => {
        //             let likeInfo = res.data.data;
        //             this.recentProducts.forEach(el => {
        //                 if(el.id === id){
        //                     el.count_likes = likeInfo.count_likes;
        //                     el.like = likeInfo.like;
        //                 }
        //             })
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //     });
        // },
        // feedbackProduct(){
        //     this.axios.post(`/api/product/${this.$route.params.id}/feedback`,{
        //         message: this.textFeedback,
        //         rating: this.rating,
        //         status: 'new',
        //         parent_id: this.feedbackParentId
        //     })
        //         .then(res => {
        //             console.log("OK");
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // feedbackProductNull(){
        //     this.textFeedback = '';
        //     this.rating = null;
        //     this.chooseRating = [false, false, false, false, false];
        //     this.changeRating = [false, false, false, false, false];
        // },
        // getToken(){
        //     return localStorage.getItem('x_xsrf_token');
        // },
        //percentRatingStar(){
        //    return Math.round((this.product.rating / 5) * 100);
        //},
        // setFeedbackId(feedbackParentId){
        //     this.feedbackParentId = feedbackParentId;
        // },

        // getRecentProducts_1(){
        //     this.axios.get(`/api/products/recent/${this.$route.params.id}`)
        //         .then(res => {
        //             this.recentProducts = res.data.data;
        //             console.log('this.recentProducts');
        //             console.log(this.recentProducts);
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // popupProductNull_1(){
        //     this.popupProduct = null;
        //     this.countOfSizeObjPopup = null;
        //     this.countForCart = 1;
        //     this.maxCountSizePopup = 1;
        //     console.log(this.countForCart);
        //     console.log(this.maxCountSizePopup);
        // },
        // getRecentProduct(id){
        //     this.axios.get(`/api/product/${id}`)
        //         .then(res => {
        //             this.popupProduct = res.data.data;
        //             console.log(res.data.data);
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // setProductSizePopup(countOfSize){
        //     this.countOfSizeObjPopup = countOfSize;
        //     this.maxCountSizePopup = this.countOfSizeObjPopup.count;
        //     console.log(this.countOfSizeObjPopup);
        //     console.log("count - " + this.countOfSizeObjPopup.count);
        //     // var el = document.querySelector(".qtyValue");
        //     // el.value = 1;
        //     this.countForCart = 1;
        // }
        /*
        getProduct(){
            const reqProduct = this.axios.get(`/api/product/${this.$route.params.id}`);
            const reqRecentProducts = this.axios.get(`/api/products/recent/${this.$route.params.id}`);
            this.axios
                .all([reqProduct, reqRecentProducts])
                .then(
                    axios.spread((...res) => {
                        const resProduct = res[0];
                        const resRecentProducts = res[1];
                        this.product = resProduct.data.data;
                        this.materials = this.getProductDataToString(this.product.materials);
                        this.seasons = this.getProductDataToString(this.product.seasons);
                        this.tags = this.getProductDataToString(this.product.tags);
                        
                        this.recentProducts = resRecentProducts.data.data;
                    })
                )
                .finally(x => {
                    $(document).trigger('changed_')
                });     
        },
        */
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
    /* .head_review{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .head_review{
        margin-bottom:20px
    } */
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
    /* .icon-star, .icon-star-like{
        display:inline-block;
        padding-right:5px;
    }
    .icon-star::before, .icon-star-like::before{
        content: "\f005";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        font-size: 20px;
    }
    .icon-star::before{
        color: #ccc;
    }
    .icon-star-like::before{
        color: #f69c63;
    } */
    /* .star-choose{
        display:block;
        float:left;
    }
    .review-single{
        border: 1px solid #EBE9E9;
        padding:10px;
        margin-bottom:15px;
        border-radius:10px;
    }
    .review-single-reply{
        border: 1px solid #EBE9E9;
        padding:10px;
        margin-bottom:15px;
        margin-left:30px;
        border-radius:10px;
    }
    .reply{
        border-left: 1px solid #EBE9E9;
    }
    .review-single-reply h6 {
        padding-top: 6px;
        font-weight: 600;
    }
    .review-single-reply h6 span {
        display: block;
        font-size: 14px;
        padding-top: 3px;
    }
    
    .flaticon-star::before{
        color: #ccc;
    } */
    /* .mfp-close{
        opacity: 1;
        border: 1px solid black;
        width: 170px;
    } */

</style>