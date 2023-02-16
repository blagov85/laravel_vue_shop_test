<template>
    <div class="row wow fadeInUp animated">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
            <div v-if="getCartCount > 0" class="cart-table-box">
                <div class="table-outer">
                    <table class="cart-table">
                        <thead class="cart-header">
                            <tr>
                                <th class="">Product Name</th>
                                <th class="price">Price</th>
                                <th>Size</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th class="hide-me"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="product in cart" v-bind:key="product.id">
                                <td>
                                    <div class="thumb-box"> 
                                        <router-link :to="{name: 'product.show', params: {id: product.id}}" class="title">
                                            <img :src="product.image_url" :alt="product.title">
                                        </router-link> 
                                        <router-link :to="{name: 'product.show', params: {id: product.id}}" class="title">
                                            <h5>{{ product.title }}</h5>
                                        </router-link>
                                    </div>
                                </td>
                                <td>{{ product.price }}</td>
                                <td>{{ product.size_title }}</td>
                                <td class="qty">
                                    <div class="qtySelector text-center"> 
                                        <span @click.prevent="decreaseQty(product)" class="decreaseQty"><i class="flaticon-minus"></i></span>
                                        <input type="text" class="qtyValue" :value="product.qty" readonly/> 
                                        <span @click.prevent="increaseQty(product)" class="increaseQty"><i class="flaticon-plus"></i></span> 
                                    </div>
                                </td>
                                <td class="sub-total">{{ product.price * product.qty }}</td>
                                <td>
                                    <div @click.prevent="removeFromCart({id: product.id, sizeId: product.size_id})" class="remove"> <i class="flaticon-cross"></i> </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    TotalPrice: {{ totalSumCart }}
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';

    export default {
        name: "CartTable",
        mounted(){
            $(document).trigger('changed_')
            this.getCart()
            this.getTotalCart()
        },
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
            ...mapMutations([

            ]),
            ...mapActions('cartModule',[
                'getCart',
                'addToCart',
                'removeFromCart',
                'getTotalCart',
                'decreaseQty',
                'increaseQty'
            ])
        }
    }
</script>

<style scoped>

</style>
