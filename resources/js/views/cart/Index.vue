<template>
    <div>
        <main class="overflow-hidden ">
        <!--Start cart area-->
        <section class="cart-area pt-120 pb-120">
            <div class="container">
                <CartTable />
                <OrderMetaData />
            </div>
        </section>
        <!--End cart area-->
    </main>
    </div>
</template>

<script>

import CartTable from '../../components/CartTable'; 
import OrderMetaData from '../../components/OrderMetaData'; 

export default {
    name: "Show",
    components: {
        CartTable, //list data in cart
        OrderMetaData //form for data of customer
    }
}
</script>

<style scoped>
    
</style>
