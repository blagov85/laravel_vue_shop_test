<template>
    <div class="top">
        <div class="content d-flex justify-content-between align-items-center">
            <h6 class="text-uppercase" v-if="getCartCount > 0">There are {{ getCartCount }} goods in cart</h6>
            <h6 class="text-uppercase" v-else>Your Cart is empty</h6> 
            <span class="cart-close text-uppercase">X</span>
        </div>
        <div v-if="getCartCount > 0" class="cart_items">
            <div v-for="productInCart in cart" v-bind:key="productInCart.id" class="items d-flex justify-content-between align-items-center">
                <div class="left d-flex align-items-center"> 
                    <router-link :to="{name: 'product.show', params: {id: productInCart.id}}" class="title">
                        <div class="thumb d-flex justify-content-between align-items-center"> 
                            <img class="cart-close" :src="productInCart.image_url" alt=""> 
                        </div>
                    </router-link>
                    <div class="text"> 
                        <router-link :to="{name: 'product.show', params: {id: productInCart.id}}" class="title">
                            <h6 class="cart-close">{{ productInCart.title }}</h6>
                        </router-link>
                        <p>{{ productInCart.qty }} X <span>{{ productInCart.price }}</span> </p>
                    </div>
                </div>
                <div class="right">
                    <div @click.prevent="removeFromCart({id: productInCart.id, sizeId: productInCart.size_id})" class="item-remove"> 
                        <i class="flaticon-cross"></i> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom">
        <div class="total-ammount d-flex justify-content-between align-items-center">
            <h6 class="text-uppercase">Total:</h6>
            <h6 class="ammount text-uppercase">{{ totalSumCart }}</h6>
        </div>
        <div class="button-box d-flex justify-content-between cart-close"> 
            <router-link :to="{name: 'cart.index'}" class="btn_black"> View Cart</router-link> 
        </div>
    </div>
</template>

<script>
    import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';

    export default {
        name: "SideCart",
        computed: {
            ...mapState('cartModule',[
                'cart',
                'totalSumCart'
            ]),
            ...mapGetters('cartModule',[
                'getCartCount'
            ])
        },
        methods: {
            ...mapActions('cartModule',[
                'addToCart',
                'removeFromCart'
            ])
        }
    }
</script>

<style scoped>

</style>
