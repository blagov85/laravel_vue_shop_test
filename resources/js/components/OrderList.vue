<template>
    <div>
        <div v-if="getOrderCount > 0" class="wishlist-table-box">
            <h4>Замовлення</h4>
            <div class="wishlist-table-outer">
                <table class="wishlist-table">
                    <thead class="wishlist-header">
                        <tr>
                            <th>Номер</th>
                            <th>Дата</th>
                            <th>Статус</th>
                            <th>Сума</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="order in orders" v-bind:key="order.id">
                            <td style="width:25%">  
                                <a @click.prevent="getOrder(order.id)" :href="`#popupOrder${order.id}`" 
                                    class="popup_link">#{{ order.id }}</a>
                                <div :id="`popupOrder${order.id}`" class="product-gird__quick-view-popup mfp-hide popup-width">
                                    <OrderInfo />
                                </div>
                            </td>
                            <td style="width:25%">
                                {{ order.date_create }}
                            </td>
                            <td style="width:35%">
                                {{ order.status }}
                            </td>
                            <td style="width:15%">
                                {{ order.total_price }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div v-else>Немає замовлень</div>
    </div>
</template>

<script>
    import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';
    import OrderInfo from './OrderInfo';

    export default {
        name: "OrderList",
        components: {
            OrderInfo
        },
        beforeUnmount(){
            this.setOrder(null);
        },
        computed: {
            ...mapState('orderModule',[
                'orders'
            ]),
            ...mapGetters('orderModule',[
                'getOrderCount'
            ])
        },
        methods: {
            ...mapActions('orderModule',[
                'getOrder'
            ]),
            ...mapMutations('orderModule',[
                'setOrder'
            ])
        }
    }
</script>
    
<style scoped>
    td a{
        color: #555555;
    }
    td a:hover{
        color: black;
    }
</style>
