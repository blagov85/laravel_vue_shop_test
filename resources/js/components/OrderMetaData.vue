<template>
    <div>
        <div class="row w-50 personal-data">
            <h5>Контактные данные</h5>
            <div class="form-group">
                <label for="exampleInputName">Имя</label>
                <input type="text" class="form-control" v-model="name" id="exampleInputName" placeholder="Введите имя">
            </div>
            <div class="form-group">
                <label for="exampleInputSurname">Фамилия</label>
                <input type="text" class="form-control" v-model="surname" id="exampleInputSurname" placeholder="Введите фамилию">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail">Email</label>
                <input type="text" class="form-control" v-model="email" id="exampleInputEmail" placeholder="Введите email">
            </div>
            <div class="form-group">
                <label for="phone">Телефон</label>
                <input type="text" class="form-control" id="phone"  v-model="phone" placeholder="Введите телефон">
            </div>
            <div class="form-group">
                <label for="region">Область</label><br>
                <select v-model="regionId" id="region" class="w-100">
                    <option value="0">Виберіть область</option>
                    <option v-for="region in regions" v-bind:key="region.id" :value="region.id">{{ region.title }}</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputCity">Город</label>
                <input type="text" class="form-control" v-model="settlement" id="exampleInputCity" placeholder="Введите город">
            </div>
        </div>
        <br>
        <div class="row mt--30">
            <div class="col-xl-6 col-lg-7 wow fadeInUp animated">
                <div class="cart-total-box mt-30">
                    <div class="table-outer">
                        <table class="cart-table2">
                            <tbody>
                                <tr class="line-top">
                                    <td class="shipping"> Служба доставки </td>
                                    <td class="selact-box1">
                                        <ul v-if="deliveryCompanies.length > 0" class="shop-select-option-box-1">
                                            <li v-for="deliveryCompany in deliveryCompanies" :key="deliveryCompany.id"> 
                                                <div class="select-delivery">
                                                    <input type="radio" @click="setDeliveryPrice(deliveryCompany.price)" v-model="deliveryCompanyId" :value="deliveryCompany.id" :id="`option${deliveryCompany.id}`">
                                                    <label :for="`option${deliveryCompany.id}`"><span></span>{{ deliveryCompany.title }}</label>
                                                </div> 
                                                <span>{{ deliveryCompany.price }}</span>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shipping"> Номер отделения </td>
                                    <td class="selact-box1">
                                        <div class="form-group w-50">
                                            <input type="number" class="form-control" v-model="departmentDC">
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-xl-6 col-lg-5 wow fadeInUp animated">
                <div class="cart-check-out mt-30">
                    <ul class="cart-check-out-list">
                        <li>
                            <div class="left">
                                <p>Сумма заказа</p>
                            </div>
                            <div class="right">
                                <p>{{ totalSumCart }}</p>
                            </div>
                        </li>
                        <li>
                            <div class="left">
                                <p>Доставка</p>
                            </div>
                            <div class="right">
                                <p>{{ deliveryPrice }}</p>
                            </div>
                        </li>
                        <li>
                            <div class="left">
                                <p>Total Price:</p>
                            </div>
                            <div class="right">
                                <p>${{ totalSumCart + deliveryPrice }}</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="form-group w-50 personal-data">
            <h6 v-if="errorCheckOrder !== ''" class="error-message">{{ errorCheckOrder }}</h6>
            <div class="error" v-if="errors.length > 0">
                <ul v-for="(value, key) in errors" :key="key">
                    <li>{{ value }}</li>
                </ul>
            </div>
            <input type="submit" @click.prevent="storeOrder()" class="btn btn-primary btn-order" value="Оформить"/>
        </div>
    </div>
</template>

<script>
    import { mapState, mapMutations, mapActions } from 'vuex';

    export default {
        name: "OrderMetaData",
        mounted() {
            this.getToken()
            this.getRegions()
            this.getUser()
            this.maskPhone()
            this.getDeviveryCompanies()
        },
        data(){
            return{
                id: null,
                name: '',
                email: '',
                surname: '',
                phone: '',
                regionId: 0,
                settlement: '',
                deliveryCompanies: [],
                deliveryCompanyId: null,
                departmentDC: null,
                deliveryPrice: 0,
                regions: [],
                errorCheckOrder: '',
                errors: []
            }
        },
        computed: {
            ...mapState('accountModule',[
                'token'
            ]),
            ...mapState('cartModule',[
                'cart',
                'totalSumCart'
            ])
        },
        methods: {
            ...mapActions('accountModule',[
                'getToken'
            ]),
            ...mapMutations('cartModule',[
                'setCart'
            ]),
            ...mapActions('cartModule',[
                'updateCart'
            ]),
            getUser(){
                if(!this.token){
                    return null;
                }
                this.axios.get('/api/user')
                    .then(res => {
                        this.user = res.data.data;
                        this.id = this.user.id;
                        this.name = this.user.name;
                        this.email = this.user.email;
                        this.surname = this.user.surname;
                        this.phone = this.user.phone;
                        this.regionId = this.user.region_id;
                        this.settlement = this.user.settlement;
                        if(this.user.region_id === ''){
                            this.regionId = 0;
                        }
                    })
                    .finally(x => {
                        $(document).trigger('changed_')
                    });
            },
            getRegions(){
                this.axios.get('/api/regions')
                    .then(res => {
                        this.regions = res.data.data;
                    });
            },
            getDeviveryCompanies(){
                this.axios.get('/api/delivery_companies')
                    .then(res => {
                        this.deliveryCompanies = res.data.data;
                    });
            },
            setDeliveryPrice(priceDC){
                this.deliveryPrice = priceDC;
            },
            storeOrder(){
                this.errors = [];
                this.errors = this.formError();
                if (this.errors.length > 0){
                    return false;
                }
                
                if(this.regionId == 0){
                    this.regionId = '';
                }
                this.errorCheckOrder = '';
                let imagesOrder = [];
                let listOrder = JSON.parse(JSON.stringify(this.cart));
                listOrder.forEach(item =>{ //get image from orders products
                    let imageOrder = 
                        {
                            'id': item.id,
                            'image_url': item.image_url
                        };
                    imagesOrder.push(imageOrder);
                    delete item.image_url;
                    });
                this.axios.post("/api/orders", {
                        products: listOrder,
                        user_id: this.id,
                        name: this.name,
                        surname: this.surname,
                        email: this.email,
                        phone: this.phone,
                        region_id: this.regionId,
                        settlement: this.settlement,
                        total_price: this.totalSumCart,
                        status_id: 1,
                        payment_id: 1,
                        delivery_company_id: this.deliveryCompanyId,
                        department_DC: this.departmentDC,
                        delivery_cost: this.deliveryPrice
                    })
                    .then(res => {
                        listOrder = [];
                        this.setCart([]);//reset cart
                        this.updateCart();
                        this.order = res.data.data; //get order data from server
                        //redirect to order info page (params: order data and orders products' image)
                        this.$router.push({name: 'order.index', params: { myOrder: JSON.stringify(res.data.data), myImagesOrder: JSON.stringify(imagesOrder)}});
                    })
                    .catch(error => {
                        this.errors = [];
                        if(this.serverError(error).length > 0){
                            this.errors = this.serverError(error);
                        }    
                    })
                    .finally(x => {
                        $(document).trigger('changed_')
                    });
            },
            maskPhone(){
                var phoneInput = document.getElementById('phone');
                let keyCode;
                function mask(event) {
                    event.keyCode && (keyCode = event.keyCode);
                    let pos = this.selectionStart;
                    if (pos < 3) event.preventDefault();
                    let matrix = "+380 (__) ___-__-__",
                        i = 0,
                        def = matrix.replace(/\D/g, ""),
                        val = this.value.replace(/\D/g, ""),
                        newValue = matrix.replace(/[_\d]/g, function (a) {
                            return i < val.length ? val.charAt(i++) || def.charAt(i) : a;
                        });
                    i = newValue.indexOf("_");
                    if (i != -1) {
                        i < 5 && (i = 3);
                        newValue = newValue.slice(0, i);
                    }
                    let reg = matrix.substr(0, this.value.length).replace(/_+/g,
                        function (a) {
                            return "\\d{1," + a.length + "}";
                        }).replace(/[+()]/g, "\\$&");
                    reg = new RegExp("^" + reg + "$");
                    if (!reg.test(this.value) || this.value.length < 5 || keyCode > 47 && keyCode < 58) this.value = newValue;
                    if (event.type == "blur" && this.value.length < 5) this.value = "";
                }

                phoneInput.addEventListener("input", mask, false);
                phoneInput.addEventListener("focus", mask, false);
                phoneInput.addEventListener("blur", mask, false);
                phoneInput.addEventListener("keydown", mask, false);
            },
            formError(){
                let clientErrors = [];
                if(
                    (this.cart === null) ||
                    (this.name === '') ||
                    (this.surname === '') ||
                    (this.email === '') ||
                    ((this.phone.length >= 5) &&
                    (this.phone.length !== 19)) ||
                    (this.regionId == 0) ||
                    (this.settlement === '') ||
                    (this.deliveryCompanyId === null) ||
                    (this.departmentDC === '')
                ){
                    clientErrors.push("Все поля должны быть заполнены");
                }else if (!this.validateEmail(this.email)){
                    clientErrors.push("Поле email должно содержать название электронной почты");
                }
                return clientErrors;
            },
            serverError(error){
                let serverErrors = [];
                if(error.data.errors){
                    for (let ind in error.data.errors){
                        serverErrors.push(error.data.errors[ind][0]);
                    }
                }else if (error.data.error){
                    serverErrors.push(error.data.error);
                }
                return serverErrors;
            },
            validateEmail(email) {
                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
                    return true;
                }
                return false;
            }
        }
    }
</script>
    
<style scoped>
    .personal-data{
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
    }   
</style>
