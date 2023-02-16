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
        CartTable,
        OrderMetaData
    },
    mounted(){
        $(document).trigger('changed_')
        //this.getCartProducts()
        //this.getToken()
        // this.getRegions()
        // this.getUser()
        // this.maskPhone()
        // this.getDeviveryCompanies()
        
    },
    data() {
        return {
            productsInCart: [],
            products: [],
            // id: null,
            // name: '',
            // email: '',
            // surname: '',
            // phone: '',
            // regionId: 0,
            // settlement: '',
            // total: 0,
            // deliveryPrice: 0,
            //token: '',
            // regions: [],
            // deliveryCompanies: [],
            // deliveryCompanyId: null,
            // departmentDC: null,
            // errorCheckOrder: '',
            // errors: []
        }
    },
    methods: {
        // getToken(){
        //     this.token = localStorage.getItem('x_xsrf_token');
        // },
        // getUser(){
        //     if(!this.token){
        //         return null;
        //     }
        //     axios.get('/api/user')
        //         .then(res => {
        //             this.user = res.data.data;
        //             this.id = this.user.id;
        //             this.name = this.user.name;
        //             this.email = this.user.email;
        //             this.surname = this.user.surname;
        //             this.phone = this.user.phone;
        //             this.regionId = this.user.region_id;
        //             this.settlement = this.user.settlement;
        //             if(this.user.region_id === ''){
        //                 this.regionId = 0;
        //             }
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // getRegions(){
        //     this.axios.get('/api/regions')
        //         .then(res => {
        //             this.regions = res.data.data;
        //         });
        // },
        // getDeviveryCompanies(){
        //     this.axios.get('/api/delivery_companies')
        //         .then(res => {
        //             this.deliveryCompanies = res.data.data;
        //             console.log(this.deliveryCompanies);
        //         });
        // },
        // setDeliveryPrice(priceDC){
        //     this.deliveryPrice = priceDC;
        // },
        // storeOrder(){
        //     this.errors = [];
        //     this.errors = this.formError();
        //     if (this.errors.length > 0){
        //         return false;
        //     }
            
        //     if(this.regionId == 0){
        //         this.regionId = '';
        //     }
        //     this.errorCheckOrder = '';
        //     let imagesOrder = [];
        //     let listOrder = JSON.parse(JSON.stringify(this.productsInCart));
        //     listOrder.forEach(item =>{
        //         let imageOrder = 
        //             {
        //                 'id': item.id,
        //                 'image_url': item.image_url
        //             };
        //         imagesOrder.push(imageOrder);
        //         delete item.image_url;
        //         });
        //     this.axios.post("/api/orders", {
        //             products: listOrder,
        //             user_id: this.id,
        //             name: this.name,
        //             surname: this.surname,
        //             email: this.email,
        //             phone: this.phone,
        //             region_id: this.regionId,
        //             settlement: this.settlement,
        //             total_price: this.total,
        //             status_id: 1,
        //             payment_id: 1,
        //             delivery_company_id: this.deliveryCompanyId,
        //             department_DC: this.departmentDC,
        //             delivery_cost: this.deliveryPrice
        //         })
        //         .then(res => {
        //             console.log("RES");
        //             console.log(res);
        //             listOrder = [];
        //             this.productsInCart = [];
        //             this.updateCart();
        //             this.order = res.data.data;
        //             this.$router.push({name: 'order.index', params: { myOrder: JSON.stringify(res.data.data), myImagesOrder: JSON.stringify(imagesOrder)}});
        //         })
        //         .catch(error => {
        //             console.log("ERR");
        //             this.errors = [];
        //             if(this.serverError(error).length > 0){
        //                 this.errors = this.serverError(error);
        //             }    
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // getCartProducts(){
        //     this.productsInCart = JSON.parse(localStorage.getItem('cart'));
        //     this.getTotal();
        //     console.log("ORDER");
        //     console.log(this.productsInCart);
        //     this.$emit('set-search-empty'); 
        // },
        // decreaseQty(product){
        //     if(product.qty === 1) return;
        //     product.qty--;
        //     this.updateCart();
        // },
        // increaseQty(product){
        //     product.qty++;
        //     this.updateCart();
        // },
        // removeProduct(id, size_id){
        //     this.productsInCart = this.productsInCart.filter(product => {
        //         return ((product.id !== id) || (product.size_id !== size_id));
        //     });
        //     this.updateCart();
        // },
        // updateCart(){
        //     localStorage.setItem('cart', JSON.stringify(this.productsInCart));
        //     this.getTotal();
        // },
        // getTotal(){
        //     this.total = 0;
        //     this.productsInCart.forEach(product => {
        //         let productSum = product.price * product.qty;
        //         this.total += productSum;
        //     });
                
        // },
        // maskPhone(){
        //     var phoneInput = document.getElementById('phone');
        //     let keyCode;
        //     function mask(event) {
        //         event.keyCode && (keyCode = event.keyCode);
        //         let pos = this.selectionStart;
        //         if (pos < 3) event.preventDefault();
        //         let matrix = "+380 (__) ___-__-__",
        //             i = 0,
        //             def = matrix.replace(/\D/g, ""),
        //             val = this.value.replace(/\D/g, ""),
        //             newValue = matrix.replace(/[_\d]/g, function (a) {
        //                 return i < val.length ? val.charAt(i++) || def.charAt(i) : a;
        //             });
        //         i = newValue.indexOf("_");
        //         if (i != -1) {
        //             i < 5 && (i = 3);
        //             newValue = newValue.slice(0, i);
        //         }
        //         let reg = matrix.substr(0, this.value.length).replace(/_+/g,
        //             function (a) {
        //                 return "\\d{1," + a.length + "}";
        //             }).replace(/[+()]/g, "\\$&");
        //         reg = new RegExp("^" + reg + "$");
        //         if (!reg.test(this.value) || this.value.length < 5 || keyCode > 47 && keyCode < 58) this.value = newValue;
        //         if (event.type == "blur" && this.value.length < 5) this.value = "";
        //     }

        //     phoneInput.addEventListener("input", mask, false);
        //     phoneInput.addEventListener("focus", mask, false);
        //     phoneInput.addEventListener("blur", mask, false);
        //     phoneInput.addEventListener("keydown", mask, false);
        // },
        // formError(){
        //     let clientErrors = [];
        //     if(
        //         (this.productsInCart === null) ||
        //         (this.name === '') ||
        //         (this.surname === '') ||
        //         (this.email === '') ||
        //         ((this.phone.length >= 5) &&
        //         (this.phone.length !== 19)) ||
        //         (this.regionId == 0) ||
        //         (this.settlement === '') ||
        //         (this.deliveryCompanyId === null) ||
        //         (this.departmentDC === '')
        //     ){
        //         clientErrors.push("Все поля должны быть заполнены");
        //     }else if (!this.validateEmail(this.email)){
        //         clientErrors.push("Поле email должно содержать название электронной почты");
        //     }
        //     return clientErrors;
        // },
        // serverError(error){
        //     let serverErrors = [];
        //     if(error.data.errors){
        //         for (let ind in error.data.errors){
        //             serverErrors.push(error.data.errors[ind][0]);
        //         }
        //     }else if (error.data.error){
        //         serverErrors.push(error.data.error);
        //     }
        //     return serverErrors;
        // },
        // validateEmail(email) {
        //     if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
        //         return true;
        //     }
        //     return false;
        // }
    }
}
</script>

<style scoped>
    /* .personal-data{
        margin:0 auto;
        margin-top:20px;
    }
    #region{
        border-radius: 4px;
    }
    .btn-order{
        margin-top:20px;
    }
    .line-top{
        border-top:1px solid #eeeeee;
    }
    .shipping{
        width:10%;
    }
    .price-delivery{
        width:10%;
    }
    .select-delivery{
        display: inline-block;
        width:80%;
    }
    .error{
        color:red;
        margin-bottom: 20px;
    } */
</style>
