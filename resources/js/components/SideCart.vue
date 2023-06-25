<template>
    <div>
        <div class="top">
            <div class="content d-flex justify-content-between align-items-center">
                <h6 v-if="getCartCount > 0" class="text-uppercase" >У кошику {{ getCartCount }} {{ goods }}</h6>
                <h6 v-else class="text-uppercase">Кошик пустий</h6> 
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
        <div v-if="getCartCount > 0" class="bottom">
            <div class="total-ammount d-flex justify-content-between align-items-center">
                <h6 class="text-uppercase">Сума:</h6>
                <h6 class="ammount text-uppercase">{{ totalSumCart }}</h6>
            </div>
            <div class="button-box d-flex justify-content-between cart-close"> 
                <router-link :to="{name: 'cart.index'}" class="btn_black">До кошика</router-link> 
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState, mapGetters, mapActions } from 'vuex';

    export default {
        name: "SideCart",
        computed: {
            ...mapState('cartModule',[
                'cart',
                'totalSumCart'
            ]),
            ...mapGetters('cartModule',[
                'getCartCount'
            ]),
            goods(){
                if((typeof this.getCartCount !== 'undefined') && (this.getCartCount > 0)){
                    let division_10 = this.getCartCount % 10;
                    if((this.getCartCount == 1) || (division_10 == 1) && (this.getCartCount >= 21)){
                        return 'товар'
                    }else if((this.getCartCount >= 2) && (this.getCartCount <= 4)  || ((division_10 >= 2) && (division_10 <= 4) && (this.getCartCount >= 22))){
                        return 'товари'
                    }else{
                        return 'товарів'
                    }
                }else{
                    return '';
                }
                
            }
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
