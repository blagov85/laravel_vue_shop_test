<!-- Recent Product -->
<template>
    <div v-if="product" class="products-grid-one__product-image">
        <router-link :to="{name: 'product.show', params: {id: product.id}}" class="d-block products-grid__image_holder"> 
            <img :src="product.image_url" class="products-grid-one__mainimage products-grid-one__first-img" alt="" /> 
            <img :src="product.image_url" class="products-grid-one__hover-img" alt="" />
        </router-link>
        <div class="products-grid__usefull-links">
            <div>{{ product.count_likes }}</div>
            <ul>
                <li>
                    <a v-if="token" @click.prevent="likeProduct(product)" href="#0">
                        <i v-if="product.like == true" class="fas fa-heart"></i> 
                        <i v-else class="flaticon-heart"></i> 
                        <span>wishlist</span>
                    </a>
                    <router-link v-else :to="{name: 'user.login'}">
                        <i class="flaticon-heart"></i>
                    </router-link>
                </li>
                <li>
                    <a href="#" @click.prevent="addToCompare(product);getCompareCategory()"> 
                        <i class="flaticon-left-and-right-arrows"></i>
                        <span>compare</span> 
                    </a> 
                </li>
                <li>
                    <a @click.prevent="popupProductNull();getPopupProduct(product.id);" :href="`#popup${product.id}`" class="popup_link"> 
                        <i class="flaticon-visibility"></i>
                        <span> quick view</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div :id="`popup${product.id}`" class="product-gird__quick-view-popup mfp-hide">
        <ProductPopup />
    </div>
    <div class="products-grid__content"> 
        <a @click.prevent="popupProductNull();getPopupProduct(product.id)" :href="`#popupForSize${product.id}`"
                class="products-grid__cart-btn btn--primary popup_link"> 
            <span class="one"> Add to Cart </span>
            <span class="two"> <i class="flaticon-shopping-cart"> </i> </span> 
        </a>
        <div class="ratting"> 
            <div class="stars-outer">
                <div class="stars-inner" :style="{width: percentRatingStar(product) + '%'}"></div>
            </div> 
        </div>
        <h5 class="product_name">
            <router-link :to="{name: 'product.show', params: {id: product.id}}">
                {{ product.title }}
            </router-link>
        </h5>
        <div class="price d-flex align-content-center justify-content-center">
            <p><del v-if="product.old_price"> {{ product.old_price }}</del> {{ product.price }}</p> 
        </div>
    </div>
    <div :id="`popupForSize${product.id}`" class="product-gird__quick-view-popup mfp-hide popup-width" style="width:50%">
        <ProductPopupMin />
    </div>
</template>

<script>

    import { mapState, mapMutations, mapActions } from 'vuex';
    import ProductPopup from './ProductPopup';
    import ProductPopupMin from './ProductPopupMin';

    export default {
        name: "ProductForSlider",
        components: {
            ProductPopup, //data popup product
            ProductPopupMin
        },
        props: ['product'],
        mounted() {
            this.getToken()
        },
        beforeUnmount(){
            this.setPopupProduct(null);
            this.setPopupCountForCart(1);
            this.setPopupCountOfSizeObj(null);
            this.setPopupMaxCountSize(1); 
        },
        computed: {
            ...mapState('accountModule',[
                'token'
            ])
        },
        methods: {
            ...mapActions('popupProductModule',[
                'popupProductNull',
                'getPopupProduct'
            ]),
            ...mapActions('accountModule',[
                'getToken'
            ]),
            ...mapActions('likeModule',[
                'likeProduct' //add to array or delete from array product for Like
            ]),
            ...mapActions('compareModule',[
                'addToCompare', //add to array or delete from array product for Compare
                'getCompareCategory' //get all category all products in Compare
            ]),
            ...mapMutations('popupProductModule',[
                'setPopupProduct',
                'setPopupCountForCart',
                'setPopupCountOfSizeObj',
                'setPopupMaxCountSize'
            ]),
            percentRatingStar(product){ //get %
                return Math.round((product.rating / 5) * 100);
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
