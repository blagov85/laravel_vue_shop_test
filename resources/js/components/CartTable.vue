<template>
    <div class="row fadeInUp ">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
            <div v-if="getCartCount > 0" class="cart-table-box">
                <div class="table-outer">
                    <table class="cart-table">
                        <thead class="cart-header">
                            <tr>
                                <th class="">Зображення</th>
                                <th class="price">Назва</th>
                                <th>Розмір</th>
                                <th>Ціна/Кількість</th>
                                <th>Сума</th>
                                <th class="hide-me"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="product in cart" v-bind:key="product.id">
                                <td>
                                    <div class="thumb"> 
                                        <router-link :to="{name: 'product.show', params: {id: product.id}}">
                                            <img :src="product.image_url" :alt="product.title">
                                        </router-link>
                                    </div>
                                </td>
                                <td>
                                    <router-link :to="{name: 'product.show', params: {id: product.id}}">
                                        <h5>{{ product.title }}</h5>
                                    </router-link>
                                </td>
                                <td>{{ product.size_title }}</td>
                                <td class="qty">
                                    <div class="d-flex flex-column align-items-center">
                                        <div class="pb-2">{{ product.price }}</div>
                                        <div class="qtySelector text-center"> 
                                            <span @click.prevent="decreaseQty(product)" class="decreaseQty"><i class="flaticon-minus" style="width:50%"></i></span>
                                            <input type="text" class="qtyValue" :value="product.qty" readonly/> 
                                            <span @click.prevent="increaseQty(product)" class="increaseQty"><i class="flaticon-plus"></i></span> 
                                        </div>
                                    </div>
                                </td>
                                <td class="sub-total">{{ product.price * product.qty }}</td>
                                <td>
                                    <div @click.prevent="removeFromCart({id: product.id, sizeId: product.size_id})" class="remove"> <i class="flaticon-cross"></i> </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState, mapGetters, mapActions } from 'vuex';

    export default {
        name: "CartTable",
        mounted(){
            this.getCart()
            this.getTotalCart()
        },
        computed: {
            ...mapState('cartModule',[
                'cart',
                'totalSumCart'
            ]),
            ...mapGetters('cartModule',[
                'getCartCount' //sum of all products in order
            ])
        },
        methods: {
            ...mapActions('cartModule',[
                'getCart',
                'addToCart',
                'removeFromCart',
                'getTotalCart',
                'decreaseQty', //change count in order
                'increaseQty'
            ])
        }
    }
</script>

<style scoped>

</style>
