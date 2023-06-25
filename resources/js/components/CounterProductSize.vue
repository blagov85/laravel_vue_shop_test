<template>
    <!--size-->
    <div class="shop-details-top-size-box">
        <h4>Розмір: <span v-if="popupCountOfSizeObj">({{ popupCountOfSizeObj.title }})</span></h4>
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
        <h6>Кількість:</h6>
        <div class="button-group">
            <div class="qtySelector text-center">
                <span class="decreaseQty" @click.prevent="decreaseCountPopup()"><i class="flaticon-minus"></i></span>
                <input type="number" class="qtyValue" v-model="popupCountForCart" /> 
                <span class="increaseQty" @click.prevent="increaseCountPopup()"> <i class="flaticon-plus"></i> </span> 
            </div>
            <button v-if="popupCountOfSizeObj" @click.prevent = "addToCart({'product': popupProduct, 'countOfSizeObj': popupCountOfSizeObj, 'countForCart': popupCountForCart});popupProductSizeNull()" class="btn--primary mfp-close">Додати до кошика</button>
            <button v-else @click.prevent = "" class="btn--primary">Додати до кошика</button>
        </div>
    </div>
</template>

<script>
    import { mapState, mapActions } from 'vuex';

    export default {
        name: "CounterProductSize",
        computed: {
            ...mapState('popupProductModule',[
                'popupProduct',
                'popupCountForCart',
                'popupCountOfSizeObj'
            ])
        },
        methods: {
            ...mapActions('popupProductModule',[
                'decreaseCountPopup',
                'increaseCountPopup',
                'setProductSize',
                'popupProductSizeNull'
            ]),
            ...mapActions('cartModule',[
                'addToCart'
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
