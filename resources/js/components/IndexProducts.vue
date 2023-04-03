<template>
    <div v-if ="indexProducts.length > 0" class="row">
        <div class="col-12">
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-grid" role="tabpanel"
                    aria-labelledby="pills-grid-tab">
                    <div class="row">
                        <div v-for="product in indexProducts" v-bind:key="product.id" class="col-xl-4 col-lg-6 col-6 ">
                            <ProductForIndex :product="product"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div v-else-if="filterList == null">
        За результатами запиту "{{ searchText }}" товарів не знайдено
    </div>
    <div v-else>
        Товарів не знайдено
    </div>
</template>

<script>
    import { mapState } from 'vuex';
    import ProductForIndex from './ProductForIndex';

    export default {
        name: "IndexProducts",
        components: {
            ProductForIndex //block of one product (nested ProductPopup, ProductPopupMin)
        },
        computed: {
            ...mapState('indexProductsModule',[
                'indexProducts', //list of Products
                'filterList',
                'searchText'
            ])
        }
    }
</script>

<style scoped>

</style>
