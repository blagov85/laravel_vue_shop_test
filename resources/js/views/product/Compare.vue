<template>
    <div>
        <main class="overflow-hidden ">
        <!--Start Compare-->
        <section class="compare pt-60 pb-120">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12 fadeInUp animated">
                        <div v-if="compareProduct.length > 0" class="compare-table-box">
                            <h4 class="name-page">Порівняння товарів</h4>
                            <div class="compare-table-outer">
                                <table class="compare-table">
                                    <thead class="compare-header">
                                        <tr>
                                            <th v-for="product in compareProduct" v-bind:key="`url${product.id}`">
                                                <div class="compare-product-img-1 img-compare" > 
                                                    <img :src="product.image_url" alt="">
                                                </div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Товар </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`title${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Бренд </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`brand${product.id}`">
                                                <h6 v-if="product.brand">{{ product.brand.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5> Пол </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`sex${product.id}`">
                                                <h6 v-if="product.sex">{{ product.sex.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Опис</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`desc${product.id}`">
                                                <h6>{{ product.description }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Сезон</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`season${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Ціна</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`price${product.id}`">
                                                <h6>{{ product.price }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Матеріал</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`material${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Колір</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`color${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Країна</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in compareProduct" v-bind:key="`country${product.id}`">
                                                <h6 v-if="product.country">{{ product.country.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Кошик</h5>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td v-for="product in compareProduct" v-bind:key="`cart${product.id}`" >
                                                <a @click.prevent="popupProductNull();getPopupProduct(product.id)" :href="`#popupCompare${product.id}`" 
                                                    class="addcart btn--primary style2 popup_link">Додати до кошика</a>
                                                
                                                <div :id="`popupCompare${product.id}`" class="product-gird__quick-view-popup mfp-hide popup-width" style="width:50%">
                                                    <ProductPopupMin />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="getCompareProductCount">
                                                <h5>Рейтинг</h5>
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
                        <div v-else>Немає товарів для порівняння</div>
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
    .img-compare{
        width:50%;
        min-width:100px;
        margin:5px auto;
    }
    .name-page{
        margin:0 auto 10px;
    }
</style>
