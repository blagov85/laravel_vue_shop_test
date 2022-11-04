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
                <div class="row wow fadeInUp animated">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <div class="cart-table-box">
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
                                        <tr v-for="product in productsInCart" v-bind:key="product.id">
                                            <td>
                                                <div class="thumb-box"> 
                                                    <router-link :to="{name: 'product.show', params: {id: product.id}}" class="title">
                                                        <img :src="product.image_url" :alt="product.title">
                                                    </router-link> 
                                                    <router-link to="{name: 'product.show', params: {id=product.id}}" class="title">
                                                        <h5>{{ product.title }}</h5>
                                                    </router-link>
                                                </div>
                                            </td>
                                            <td>{{ product.price }}</td>
                                            <td>{{ product.size_title }}</td>
                                            <td class="qty">
                                                <div class="qtySelector text-center"> 
                                                    <span @click.prevent="decreaseQty(product)" class="decreaseQty"><i class="flaticon-minus"></i></span>
                                                    <input type="number" class="qtyValue" :value="product.qty" /> 
                                                    <span @click.prevent="increaseQty(product)" class="increaseQty"> <i class="flaticon-plus"></i> </span> 
                                                </div>
                                            </td>
                                            <td class="sub-total">{{ product.price * product.qty }}</td>
                                            <td>
                                                <div @click.prevent="removeProduct(product.id)" class="remove"> <i class="flaticon-cross"></i> </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row w-50 personal-data">
                    <h5>Контактные данные</h5>
                    <div class="form-group">
                        <label for="exampleInputName">Имя</label>
                        <input type="text" class="form-control" v-model="name" id="exampleInputName" placeholder="Введите имя">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputSurname">Фамилия</label>f
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
                                        <p>{{ total }}</p>
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
                                        <p>${{ total + deliveryPrice }}</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="form-group w-50 personal-data">
                    <h6 v-if="errorAttributeOrder !== ''" class="error-message">{{ errorAttributeOrder }}</h6>
                    <h6 v-if="errorCheckOrder !== ''" class="error-message">{{ errorCheckOrder }}</h6>
                    <h5>{{ deliveryCompanyId }} - {{ departmentDC }}</h5>
                    <input type="submit" @click.prevent="storeOrder()" class="btn btn-primary btn-order" value="Оформить"/>
                </div>
            </div>
        </section>
        <!--End cart area-->
    </main>
    </div>
</template>

<script>
export default {
    name: "Show",
    mounted(){
        $(document).trigger('changed_')
        this.getCartProducts()
        this.getToken()
        this.getRegions()
        this.getUser()
        this.maskPhone()
        this.getDeviveryCompanies()
        
    },
    data() {
        return {
            productsInCart: [],
            products: [],
            id: null,
            name: '',
            email: '',
            surname: '',
            phone: '',
            regionId: 0,
            settlement: '',
            total: 0,
            deliveryPrice: 0,
            token: '',
            regions: [],
            deliveryCompanies: [],
            deliveryCompanyId: null,
            departmentDC: null,
            errorAttributeOrder: '',
            errorCheckOrder: ''
        }
    },
    methods: {
        getToken(){
            this.token = localStorage.getItem('x_xsrf_token');
        },
        getUser(){
            if(!this.token){
                return null;
            }
            axios.get('/api/user')
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
                    console.log(this.deliveryCompanies);
                });
        },
        setDeliveryPrice(priceDC){
            this.deliveryPrice = priceDC;
        },
        storeOrder(){
            if(
                (this.productsInCart === null) ||
                (this.name === '') ||
                (this.surname === '') ||
                (this.email === '') ||
                (this.phone.length !== 19) ||
                (this.regionId == 0) ||
                (this.settlement === '') ||
                (this.deliveryCompanyId === null) ||
                (this.departmentDC === '')
            ){
                this.errorAttributeOrder = 'Заполните верно данные для заказа';
                return null;
            }
            this.errorAttributeOrder = '';
            this.errorCheckOrder = '';
            let imagesOrder = [];
            this.productsInCart.forEach(item =>{
                let imageOrder = 
                    {
                        'id': item.id,
                        'image_url': item.image_url
                    };
                imagesOrder.push(imageOrder);
                delete item.image_url;
                });
            this.axios.post("/api/orders", {
                    products: this.productsInCart,
                    user_id: this.id,
                    name: this.name,
                    surname: this.surname,
                    email: this.email,
                    phone: this.phone,
                    region_id: this.regionId,
                    settlement: this.settlement,
                    total_price: this.total,
                    status_id: 1,
                    payment_id: 1,
                    delivery_company_id: this.deliveryCompanyId,
                    department_DC: this.departmentDC,
                    delivery_cost: this.deliveryPrice
                })
                .then(res => {
                    console.log("RES");
                    console.log(res);
                    if(res.data.message){
                        this.errorCheckOrder = res.data.message;
                    }else{
                        //this.order = res.data.data;
                        this.$router.push({name: 'order.index', params: { myOrder: JSON.stringify(res.data.data), myImagesOrder: JSON.stringify(imagesOrder)}});
                    }
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        getCartProducts(){
            this.productsInCart = JSON.parse(localStorage.getItem('cart'));
            this.getTotal();
            console.log("ORDER");
            console.log(this.productsInCart);
            this.$emit('set-search-empty'); 
        },
        decreaseQty(product){
            if(product.qty === 0) return;
            product.qty--;
            this.updateCart();
        },
        increaseQty(product){
            product.qty++;
            this.updateCart();
        },
        removeProduct(id){
            this.productsInCart = this.productsInCart.filter(product => {
                return product.id !== id;
            });
            this.updateCart();
        },
        updateCart(){
            localStorage.setItem('cart', JSON.stringify(this.productsInCart));
            this.getTotal();
        },
        getTotal(){
            this.total = 0;
            this.productsInCart.forEach(product => {
                let productSum = product.price * product.qty;
                this.total += productSum;
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
</style>
