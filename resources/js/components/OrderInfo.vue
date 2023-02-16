<template>
    <div v-if="order" class="container">
        <div class="row justify-content-between align-items-center">
                <div class="header">
                    <h5>Замовлення <span>#{{ order.id }}</span></h5>
                </div>
                <div class="header-table">Інформація про замовлення</div>
                <table class="info-order-table">
                    <tr>
                        <td class="head">Дата</td>
                        <td>{{ order.date_create }}</td>
                    </tr>
                    <tr>
                        <td class="head">Прізвище</td>
                        <td>{{ order.surname }}</td>
                    </tr>
                    <tr>
                        <td class="head">Ім'я</td>
                        <td>{{ order.name }}</td>
                    </tr>
                    <tr>
                        <td class="head">Телефон</td>
                        <td>{{ order.phone }}</td>
                    </tr>
                    <tr>
                        <td class="head">Email</td>
                        <td>{{ order.email }}</td>
                    </tr>
                    <tr>
                        <td class="head">Область</td>
                        <td>{{ order.region }}</td>
                    </tr>
                    <tr>
                        <td class="head">Місто</td>
                        <td>{{ order.settlement }}</td>
                    </tr>
                    <tr>
                        <td class="head">Оплата</td>
                        <td>{{ order.payment }}</td>
                    </tr>
                    <tr>
                        <td class="head">Служба доставки</td>
                        <td>{{ order.delivery_company }}</td>
                    </tr>
                    <tr>
                        <td class="head">Відділення</td>
                        <td>{{ order.department_DC }}</td>
                    </tr>
                </table>
                <table class="order-table">
                    <thead>
                        <tr>
                            <th width="10%"></th>
                            <th width="40%">Товар</th>
                            <th width="10%">Розмір</th>
                            <th width="15%">Ціна</th>
                            <th width="10%">Кількість</th>
                            <th width="15%">Сума</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="product in order.products" :key="product.id">
                            <td width="10%">
                                <img class="image" :src="product.img"> 
                            </td>
                            <td width="40%">{{ product.title }}</td>
                            <td width="10%">{{ product.size_title }}</td>
                            <td width="15%">{{ product.price }}</td>
                            <td width="10%">{{ product.qty }}</td>
                            <td width="15%">{{ product.price * product.qty }}</td>
                        </tr>
                    </tbody>
                </table>
                <hr>
                <table class="sum-order-table">
                    <tr>
                        <td class="head">Ціна товару (-ів)</td>
                        <td class="info">{{ order.total_price }}</td>
                    </tr>
                    <tr>
                        <td class="head">Доставка</td>
                        <td class="info">{{ order.delivery_cost }}</td>
                    </tr>
                    <tr>
                        <td class="head">Загальна сума</td>
                        <td class="info">{{ order.total_price + order.delivery_cost }}</td>
                    </tr>
                </table>
            
        </div>
    </div>
    <div v-else>Немає інформації по замовленню</div>
</template>

<script>
    import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';

    export default {
        name: "OrderInfo",
        mounted() {

        },
        data(){
            return{

            }
        },
        computed: {
            ...mapState('orderModule',[
                'order'
            ])
        }
    }
</script>
    
<style scoped>
    .header{
        margin: 0 auto;
        display:flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        direction:column;
        margin-bottom: 20px;
    }
    h5 span, .header-table{
        font-weight: bold;
    }
    .order-table, .info-order-table, .sum-order-table, hr{
        margin-top: 20px;
    }
    .order-table th, .order-table td{
        text-align: center;
    }
    .image{
        padding:5%;
    }
    .info-order-table .head{
        width: 150px;
        font-weight: bold;
    }
    .sum-order-table .head{
        width: 85%;
        font-weight: bold;
    }
    .sum-order-table .info{
        text-align: center;
    }
    hr{
        color: grey;
    }
</style>
