<!-- Index Product -->
<template>
    <div class="products-three-single w-100  mt-30">
        <div v-if="product" class="products-three-single-img"> 
            <router-link :to="{name: 'product.show', params: {id: product.id}}"> 
                <img :src="product.image_url" class="first-img" alt="" /> 
                <img :src="product.image_url" class="hover-img" alt="" />
            </router-link>
            <a @click.prevent="popupProductNull();getPopupProduct(product.id)" :href="`#popupForSize${product.id}`" 
                    class="addcart btn--primary style2 popup_link">
                Додати в кошик
            </a>
            <div class="products-grid__usefull-links">
                <ul>
                    <li>
                        <a v-if="token" @click.prevent="likeProduct(product)" href="#0">
                            <i v-if="product.like == true" class="fas fa-heart"></i> 
                            <i v-else class="flaticon-heart"></i> 
                            <span>бажане</span>
                        </a>
                        <router-link v-else :to="{name: 'user.login'}">
                            <i class="flaticon-heart"></i>
                            <span>бажане</span>
                        </router-link>
                    </li>
                    <li>
                        <a href="#" @click.prevent="addToCompare(product);getCompareCategory()"> 
                            <i class="flaticon-left-and-right-arrows"></i>
                            <span>порівняння</span> 
                        </a> 
                    </li>
                    <li>
                        <a @click.prevent="popupProductNull();getPopupProduct(product.id)" :href="`#popup${product.id}`" class="popup_link"> 
                            <i class="flaticon-visibility"></i>
                            <span>швидкий перегляд</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div :id="`popup${product.id}`" class="product-gird__quick-view-popup mfp-hide">
            <ProductPopup />
        </div>

        <div :id="`popupForSize${product.id}`" class="product-gird__quick-view-popup mfp-hide popup-width">
            <ProductPopupMin />
        </div>
        <div class="products-three-single-content text-center"> <span>{{ product.category.title }}</span>
            <h5>
                <router-link :to="{name: 'product.show', params: {id: product.id}}"> {{ product.title }} 
                </router-link>
            </h5>
            <p><del v-if="product.old_price">{{ product.old_price }}</del> {{ product.price }}</p>
        </div>
    </div>
</template>

<script>

    import { mapState, mapMutations, mapActions } from 'vuex';
    import ProductPopup from './ProductPopup';
    import ProductPopupMin from './ProductPopupMin';

    export default {
        name: "ProductForIndex",
        components: {
            ProductPopup, //popup with info about one product (nested CounterProductSize)
            ProductPopupMin //popup with info about one product (more easy) (nested CounterProductSize)
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
                'token' //get token
            ])
        },
        methods: {
            ...mapActions('popupProductModule',[
                'popupProductNull', //reset popup product
                'getPopupProduct' //get popup product
            ]),
            ...mapActions('accountModule',[
                'getToken' //get token
            ]),
            ...mapActions('likeModule',[
                'likeProduct' //add to array or delete from array product (for Like) 
            ]),
            ...mapActions('compareModule',[
                'addToCompare', //add product to Comapare or delet
                'getCompareCategory' //get category for products in compare
            ]),
            ...mapMutations('popupProductModule',[
                'setPopupProduct', 
                'setPopupCountForCart',
                'setPopupCountOfSizeObj',
                'setPopupMaxCountSize'
            ]),
        }
    }
</script>

<style scoped>
    .mfp-close{
        opacity: 1;
        border: 1px solid black;
    }
</style>
