<template>
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
                            <div class="stars-inner" :style="{width: percentRatingStarPopup + '%'}"></div>
                        </div> 
                        <span>({{ popupProduct.count_rating }})</span> 
                    </div>
                    <p class="text"> {{ popupProduct.description }} </p>
                    <div class="price">
                        <h2> {{ popupProduct.price }} <del v-if="popupProduct.old_price"> {{ popupProduct.old_price }}</del></h2>
                    </div>
                    <div class="color-varient"> 
                        <h6>Колір</h6>
                        <template v-for="color in popupProduct.colors" v-bind:key="color.id">
                            <a class="color-name inactive-link" :style="`background: #${color.value};`" :class="[color.value == 'FFFFFF' ? 'border-color' : '']">
                                <span>{{ color.title }}</span>
                            </a>
                        </template>
                    </div>
                    <div v-if="popupProduct.group_products != null" class="color-varient"> 
                        <h6>Схожі товари</h6>
                        <template v-for="groupProduct in popupProduct.group_products" v-bind:key="groupProduct.id">
                            <a @click.prevent="popupProductNull();getPopupProduct(groupProduct.id)" href="#0" class="color-name" style="background: none"> 
                                <img :src="groupProduct.image_url" alt=""> 
                                <span>{{ groupProduct.title }}</span>
                            </a>
                        </template> 
                    </div>
                    <CounterProductSize />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import CounterProductSize from './CounterProductSize';
    import { mapState, mapGetters, mapActions } from 'vuex';

    export default {
        name: "ProductPopup",
        components: {
            CounterProductSize //contains size and add to cart
        },
        computed: {
            ...mapState('popupProductModule',[
                'popupProduct'
            ]),
            ...mapGetters('popupProductModule',[
                'percentRatingStarPopup' //get percent from rating
            ])
        },
        methods: {
            ...mapActions('popupProductModule',[
                'popupProductNull',
                'getPopupProduct'
            ])
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
    .inactive-link {
        cursor: default;
    }
    .border-color{
        border: 1px solid #161FCA;
    }
</style>
