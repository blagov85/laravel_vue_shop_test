<template>
    <div>
        <main class="overflow-hidden ">
        <!--Start Breadcrumb Style2-->
        <section class="breadcrumb-area" style="background-image: url(assets/images/inner-pages/breadcum-bg.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-content text-center wow fadeInUp animated">
                            <h2>Compare</h2>
                            <div class="breadcrumb-menu">
                                <ul>
                                    <li><a href="index.html"><i class="flaticon-home pe-2"></i>Home</a></li>
                                    <li> <i class="flaticon-next"></i> </li>
                                    <li class="active">Compare</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Breadcrumb Style2-->
        <!--Start Compare-->
        <section class="compare pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12 wow fadeInUp animated">
                        <div v-if="compareProduct.length > 0" class="compare-table-box">
                            <div class="compare-table-outer">
                                <table class="compare-table">
                                    <thead class="compare-header">
                                        <tr>
                                            <th v-for="product in compareProduct" v-bind:key="`url${product.id}`">
                                                <div class="compare-product-img-1"> 
                                                    <img :src="product.image_url" alt="">
                                                </div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Product </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`title${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Brand </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`brand${product.id}`">
                                                <h6 v-if="product.brand">{{ product.brand.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Sex </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`sex${product.id}`">
                                                <h6 v-if="product.sex">{{ product.sex.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Description</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`desc${product.id}`">
                                                <h6>{{ product.description }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Season </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`season${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Price</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`price${product.id}`">
                                                <h6>{{ product.price }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Material </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`material${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Color</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`color${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Country </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`country${product.id}`">
                                                <h6 v-if="product.country">{{ product.country.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Add to cart</h5>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td v-for="product in compareProduct" v-bind:key="`cart${product.id}`" >
                                                <a @click.prevent="popupProductNull();getPopupProduct(product.id)" :href="`#popupCompare${product.id}`" 
                                                    class="addcart btn--primary style2 popup_link">Add To Cart</a>
                                                
                                                <div :id="`popupCompare${product.id}`" class="product-gird__quick-view-popup mfp-hide popup-width" style="width:50%">
                                                    <ProductPopupMin />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Rating</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`rait${product.id}`">
                                                <div class="ratting"> <i class="flaticon-star-1"></i> <i
                                                        class="flaticon-star-1"></i> <i class="flaticon-star-1"></i> <i
                                                        class="flaticon-star-1"></i> <i class="flaticon-star-1"></i>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`remove${product.id}`">
                                                <div class="delete-box"> 
                                                    <a href="#" @click="removeProductCompare(product.id)">
                                                        <i class="flaticon-delete"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div v-else>Нет товаров для сравнения</div>
                    </div>
                </div> 
            </div>
        </section>
        <!--End Order Compare-->
        </main> 
    </div>
            
</template>

<script>

import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';
import ProductPopupMin from '../../components/ProductPopupMin';

export default {
    name: "Compare",
    components: {
            ProductPopupMin //get data popup one product (nested CounterProductSize)
        },
    mounted(){
        $(document).trigger('changed_'),
        this.getCompareProducts(this.$route.params.id) //get product for compare about its category id
        this.setSearchText('')
        
    },
    beforeUnmount(){
        this.setIdCategoryActive(null);
        this.setCompareProduct([]);
        this.setPopupProduct(null);
        this.setPopupCountForCart(1);
        this.setPopupCountOfSizeObj(null);
        this.setPopupMaxCountSize(1); 
    },
    data() {
        return {
            storageProductsMinCompare: [],
            productsCompare: [],
            countProductCompare: null,
            popupProduct: null,
            countOfSizeObj: null,
            maxCountSize: null,
            countForCart: 1
        }
    },
    computed: {
        ...mapState('compareModule',[
            'compareProduct' //products for compare
        ]),
        ...mapGetters('compareModule',[
                'getCompareProductCount' //count of products in category
        ])
    },
    methods: {
        ...mapActions('compareModule',[
            'getCompareProducts',
            'removeProductCompare'
        ]),
        ...mapMutations('compareModule',[
            'setIdCategoryActive',
            'setCompareProduct'
        ]),
        ...mapMutations('indexProductsModule',[
            'setSearchText'
        ]),
        ...mapActions('popupProductModule',[
                'popupProductNull',
                'getPopupProduct',
        ]),
        ...mapMutations('popupProductModule',[
            'setPopupProduct',
            'setPopupCountForCart',
            'setPopupCountOfSizeObj',
            'setPopupMaxCountSize'
        ])
    }
}
</script>

<style scoped>
    .mfp-close{
        opacity: 1;
        border: 1px solid black;
    }
</style>
