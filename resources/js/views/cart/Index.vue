<template>
    <div>
        <main class="overflow-hidden ">
        <!--Start Breadcrumb Style2-->
        <section class="breadcrumb-area" style="background-image: url(src/assets/images/inner-pages/breadcum-bg.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-content text-center wow fadeInUp animated">
                            <h2>Cart</h2>
                            <div class="breadcrumb-menu">
                                <ul>
                                    <li><a href="index.html"><i class="flaticon-home pe-2"></i>Home</a></li>
                                    <li> <i class="flaticon-next"></i> </li>
                                    <li class="active">Cart</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Breadcrumb Style2-->
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
    },
    mounted(){
        $(document).trigger('changed_')  
    }
}
</script>

<style scoped>
    
</style>
