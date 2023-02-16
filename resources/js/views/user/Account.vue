<template>
    <div>
        <main class="overflow-hidden ">
            <!--Start Breadcrumb Style2-->
            <section class="breadcrumb-area" style="background-image: url(assets/images/inner-pages/breadcum-bg.png);">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-content text-center wow fadeInUp animated">
                                <h2>My Account </h2>
                                <div class="breadcrumb-menu">
                                    <ul>
                                        <li><a href="index.html"><i class="flaticon-home pe-2"></i>Home</a></li>
                                        <li> <i class="flaticon-next"></i> </li>
                                        <li class="active">My Account</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--End Breadcrumb Style2-->
            <!--Start My Account Page-->
            <section class="my-account-page pt-120 pb-120">
                <div class="container">
                    <div class="row wow fadeInUp animated">
                        <!--Start My Account Page Menu-->
                        <div class="col-xl-3 col-lg-4">
                            <div class="d-flex align-items-start">
                                <div class="nav my-account-page__menu flex-column nav-pills me-3" id="v-pills-tab"
                                    role="tablist" aria-orientation="vertical"> 
                                    <button :class="[!isLikeFromMainPage ? 'nav-link active' : 'nav-link']"
                                            id="v-pills-personal-tab" data-bs-toggle="pill" data-bs-target="#v-pills-personal"
                                            type="button" role="tab" aria-controls="v-pills-personal" aria-selected="true">
                                        <span>Личные данные</span> 
                                    </button>
                                    <button @click.prevent="getOrders()" class="nav-link" id="v-pills-orders-tab"
                                            data-bs-toggle="pill" data-bs-target="#v-pills-orders" type="button" role="tab"
                                            aria-controls="v-pills-orders" aria-selected="false"> 
                                        <span>Заказы</span> 
                                    </button>
                                    <button @click.prevent="checkLoadLike()" :class="[isLikeFromMainPage ? 'nav-link active' : 'nav-link']" 
                                            id="v-pills-likes-tab" data-bs-toggle="pill"
                                            data-bs-target="#v-pills-likes" type="button" role="tab"
                                            aria-controls="v-pills-likes" aria-selected="false"> 
                                        <span>Любимые товары</span>
                                    </button> 
                                    <button class="nav-link" id="v-pills-change-password-tab" data-bs-toggle="pill"
                                            data-bs-target="#v-pills-change-password" type="button" role="tab"
                                            aria-controls="v-pills-change-password" aria-selected="false"> 
                                        <span>Изменить пароль</span>
                                    </button> 
                                    <button class="nav-link"> 
                                        <span> Logout </span> 
                                    </button> 
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="tab-content " id="v-pills-tabContent">
                                
                                <div :class="[!isLikeFromMainPage ? 'tab-pane fade show active' : 'tab-pane fade']" 
                                    id="v-pills-personal" role="tabpanel"
                                    aria-labelledby="v-pills-personal-tab">
                                    <div class="tabs-content__single">
                                        <UserData />
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-orders" role="tabpanel"
                                    aria-labelledby="v-pills-orders-tab">
                                    <div class="tabs-content__single">
                                        <div class="col-xl-12 wow fadeInUp animated">
                                            <OrderList />
                                        </div>
                                    </div>
                                </div>
                                <div :class="[isLikeFromMainPage ? 'tab-pane fade show active' : 'tab-pane fade']" 
                                    id="v-pills-likes" role="tabpanel"
                                    aria-labelledby="v-pills-likes-tab">
                                    <div class="tabs-content__single">
                                        <div class="col-xl-12 wow fadeInUp animated">
                                            <LikeList />
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-change-password" role="tabpanel"
                                    aria-labelledby="v-pills-change-password-tab">
                                    <div class="tabs-content__single">
                                        <div class="col-xl-12 wow fadeInUp animated">
                                            <ChangePassword />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                          
                </div>
            </section>
            <!--End My Account Page-->
        </main>
    
    </div>
                                      
</template>

<script>
import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';
import UserData from '../../components/UserData'; 
import LikeList from '../../components/LikeList'; 
import OrderList from '../../components/OrderList';
import ChangePassword from '../../components/ChangePassword';   

export default {
    name: "Account",
    components: {
        LikeList,
        OrderList,
        UserData,
        ChangePassword
    },
    mounted(){
        $(document).trigger('changed_')
        // this.getUser(),
        // this.getBirth(),
        //this.getProductsLike()
        // this.getRegions()
        //this.getOrders()
        
    },
    data() {
        return {
            
            //popupProduct: null,
            //countOfSizeObj: null,
            //maxCountSize: 1,
            //productsLike: [],
            // changeDataUser: '',
            // phoneError: '',
            //orders: [],
            //popupOrder: null,
            // oldPassword: '',
            // newPassword: '',
            // confirmNewPassword: '',
            // changePasswordText: '',
            // errors: []
            //countForCart: 1
        }
    },
    computed: {
        ...mapState('accountModule',[
            'userName'
        ]),
        ...mapState('likeModule',[
            'isLikeFromMainPage'
        ]),
    },
    methods: {
        ...mapActions('likeModule',[
            'checkLoadLike'
        ]),
        ...mapActions('orderModule',[
            'getOrders'
        ]),
        // decreaseCount(){
        //     if(this.countForCart === 1) return;
        //     this.countForCart--;
        // },
        // increaseCount(){
        //     if(this.countForCart === this.maxCountSize) return;
        //     this.countForCart++;
        // },
        // getOrders(){
        //     axios.get('/api/orders')
        //         .then(res => {
        //             this.orders = res.data.data
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // getOrder(id){
        //     this.popupOrder = null;
        //     this.axios.get(`/api/order/${id}`)
        //         .then(res => {
        //             this.popupOrder = res.data.data;
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // getUser(){
        //     axios.get('/api/user')
        //         .then(res => {
        //             this.user = res.data.data;
        //             this.patronymic = this.user.patronymic;
        //             this.surname = this.user.surname;
        //             this.birthDay = this.user.birth.day;
        //             this.birthMonth = this.user.birth.month;
        //             this.birthYear = this.user.birth.year;
        //             this.gender = this.user.gender;
        //             this.phone = this.user.phone;
        //             this.regionId = this.user.region_id;
        //             this.settlement = this.user.settlement;
        //             if(this.user.region_id === ''){
        //                 this.regionId = 0;
        //             }
        //         })
        //         .finally(x => {
        //             if(this.user){
        //                 this.maskPhone();
        //             }  
        //             $(document).trigger('changed_')
        //         });
        //     this.$emit('set-search-empty'); 
        // },
        // getBirth(){
        //     for(let i=1;i<=31;i++){
        //         this.arrayBirthDay.push(i);
        //     }
        //     for(let i=1;i<=12;i++){
        //         this.arrayBirthMonth.push(i);
        //     }
        //     for(let i=1940;i<=2025;i++){
        //         this.arrayBirthYear.push(i);
        //     }
        // },
        // updateData(){
        //     if(this.phone.length <= 5){
        //         this.phone = '';
        //     } else if(this.phone.length < 19){
        //         this.phoneError = 'Введите номер телефона';
        //         setTimeout(() => this.phoneError = '', 2000);
        //         return null;
        //     }
        //     let birthDate = `${this.birthYear}-${this.birthMonth}-${this.birthDay}`;
        //     if(this.regionId === 0){
        //         this.regionId = '';
        //     }
        //     this.axios.post('/api/user/update', {
        //         patronymic: this.patronymic,
        //         surname: this.surname,
        //         birth_date: birthDate,
        //         gender: this.gender,
        //         phone: this.phone,
        //         region_id: this.regionId,
        //         settlement: this.settlement
        //     })
        //     .then(res => {
        //         this.changeDataUser = res.data;
        //         setTimeout(() => this.changeDataUser = '', 2000);
        //     })
        // },
        // getProductsLike(){
        //     this.axios.get('/api/products/like')
        //         .then(res => {
        //             this.productsLike = res.data.data;
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // },
        // deleteProductLike(id){
        //     this.axios.get(`/api/product/${id}/like`)
        //         .then(res => {
        //             this.productsLike = this.productsLike.filter(el => {
        //                 return el.id !== id;
        //             });
        //         });
        // },
        // popupProductNull(){
        //     this.popupProduct = null;
        //     this.countOfSizeObj = null;
        //     this.countForCart = 1;
        //     this.maxCountSize = 1;
        // },
        // getProduct(id){
        //     this.axios.get(`/api/product/${id}`)
        //         .then(res => {
        //             this.popupProduct = res.data.data;
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
        // setProductSize(countOfSize){
        //     this.countOfSizeObj = countOfSize;
        //     this.maxCountSize = this.countOfSizeObj.count;
        //     this.countForCart = 1;
        // },
        // addToCart(product, countOfSizeObj){
        //     let qty = Number(this.countForCart);
        //     let cart = localStorage.getItem('cart');
        //     this.countForCart = 1; 
        //     let newProduct = [
        //             {
        //                 'id': product.id,
        //                 'title': product.title,
        //                 'price': product.price,
        //                 'image_url': product.image_url,
        //                 'size_id': countOfSizeObj.id,
        //                 'size_title': countOfSizeObj.title,
        //                 'qty': qty
        //             }
        //         ];

        //     if(!cart){
        //         localStorage.setItem('cart', JSON.stringify(newProduct));
        //     }else{
        //         cart = JSON.parse(cart);
        //         cart.forEach(productInCart => {
        //             if((productInCart.id === product.id) && (productInCart.size_id === countOfSizeObj.id)){
        //                 productInCart.qty = Number(productInCart.qty) + Number(qty);
        //                 newProduct = null;
        //             }
        //         });

        //         Array.prototype.push.apply(cart, newProduct);
        //         localStorage.setItem('cart', JSON.stringify(cart));
        //         this.$emit('get-cart-products')
        //     }
            
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
        // changePassword(){
        //     this.errors = [];
        //     this.errors = this.formError();
        //     if (this.errors.length > 0){
        //         return false;
        //     }
        //     axios.post('/api/change-password', {
        //         old_password: this.oldPassword, 
        //         new_password: this.newPassword,
        //         new_password_confirmation: this.confirmNewPassword
        //     })
        //     .then(res => {
        //         console.log(res);
        //         this.oldPassword = null;
        //         this.newPassword = null;
        //         this.confirmNewPassword = null;
        //         if(res.data.message){
        //             this.changePasswordText = res.data.message;
        //             setTimeout(() => this.changePasswordText = '', 2000);
        //         }
        //         if(res.data.error){
        //             this.errors = [];
        //             this.errors = this.serverError(res);
        //             setTimeout(() => this.errors = [], 2000);
        //         }
        //     })
        //     .catch(error => {
        //         this.errors = [];
        //         this.errors = this.serverError(error);
        //     })
        //     .finally(x => {

        //     });
        // },
        // formError(){
        //     let clientErrors = [];
        //     if (this.oldPassword == '' || this.newPassword == '' || this.confirmNewPassword == ''){
        //         clientErrors.push("Все поля должны быть заполнены");
        //     }else{
        //         if (this.oldPassword.length < 3 || this.newPassword.length < 3 || this.confirmNewPassword.length < 3){
        //             clientErrors.push("Все поля должны иметь длину не меньше 3 символов");
        //         }
        //     }
        //     return clientErrors;
        // },
        // serverError(response){
        //     let serverErrors = [];
        //     if(response.data.errors){
        //         for (let ind in response.data.errors){
        //             serverErrors.push(response.data.errors[ind][0]);
        //         }
        //     }
        //     if(response.data.error){
        //         serverErrors.push(response.data.error);
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


</style>
