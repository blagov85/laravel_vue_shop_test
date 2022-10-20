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
                                <button class="nav-link active"
                                        id="v-pills-personal-tab" data-bs-toggle="pill" data-bs-target="#v-pills-personal"
                                        type="button" role="tab" aria-controls="v-pills-personal" aria-selected="true">
                                    <span>Личные данные</span> 
                                </button>
                                <button class="nav-link" id="v-pills-orders-tab"
                                        data-bs-toggle="pill" data-bs-target="#v-pills-orders" type="button" role="tab"
                                        aria-controls="v-pills-orders" aria-selected="false"> 
                                    <span>Заказы</span> 
                                </button>
                                <button class="nav-link" id="v-pills-likes-tab" data-bs-toggle="pill"
                                        data-bs-target="#v-pills-likes" type="button" role="tab"
                                        aria-controls="v-pills-likes" aria-selected="false"> 
                                    <span>Любимые товары</span>
                                </button> 
                                <button class="nav-link"> 
                                    <span> Logout </span> 
                                </button> 
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="tab-content " id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-personal" role="tabpanel"
                                aria-labelledby="v-pills-personal-tab">
                                <div class="tabs-content__single">
                                    <div class="card-body" v-if="user">
                                        <div class="form-group">
                                            <h5>Email: {{ this.user.email }}</h5>
                                        </div>
                                        <div class="form-group">
                                            <h5>Имя: {{ this.user.name }}</h5>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPatronymic">Отчество</label>
                                            <input type="text" class="form-control" v-model="patronymic" id="exampleInputPatronymic" placeholder="Введите отчество">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputSurname">Фамилия</label>
                                            <input type="text" class="form-control" v-model="surname" id="exampleInputSurname" placeholder="Введите фамилию">
                                        </div>
                                        <div class="form-group single-sidebar-box pb-0 border-bottom-0">
                                            <h5>Пол</h5>
                                            <div class="checkbox-item">
                                                <form>
                                                    <div class="form-group radio-male"> 
                                                        <input type="radio" value="1" v-model="gender" id="sex-male"> 
                                                        <label for="sex-male">Мужской</label> 
                                                    </div>
                                                    <div class="form-group"> 
                                                        <input type="radio" value="2" v-model="gender" id="sex-female"> 
                                                        <label for="sex-female">Женский</label> 
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>Дата рождения</h5>
                                            <div class="birth">
                                                <select v-model="birthDay" class="birth_margin">
                                                    <option v-for="itemDay in arrayBirthDay" v-bind:key="itemDay" 
                                                        :value="itemDay" >{{ itemDay }}</option>
                                                </select>
                                                <select v-model="birthMonth" class="birth_margin">
                                                    <option v-for="itemMonth in arrayBirthMonth" v-bind:key="itemMonth" :value="itemMonth">{{ itemMonth }}</option>
                                                </select>
                                                <select v-model="birthYear">
                                                    <option v-for="itemYear in arrayBirthYear" v-bind:key="itemYear" :value="itemYear">{{ itemYear }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Телефон</label>
                                            <input @keyUp="getLength()" type="text" class="form-control" id="phone"  v-model="phone" placeholder="Введите телефон">
                                            <span v-if="phoneError != ''">{{ this.phoneError }}</span>
                                        </div>
                                        <div class="form-group">
                                            <label for="region">Область</label><br>
                                            <select v-model="regionId" id="region" class="w-100">
                                                <option value="0">Виберіть область</option>
                                                <option v-for="region in regions" v-bind:key="region.id" :value="region.id">{{ region.title }}</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputSettlement">Населенный пункт</label>
                                            <textarea class="form-control" v-model="settlement" id="exampleInputSettlement" 
                                                placeholder="Введите адрес"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" @click.prevent="updateData()" class="btn btn-primary" value="Изменить данные"/>
                                        </div>
                                        <h6 v-if="changeDataUser != ''">{{ this.changeDataUser }}</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-orders" role="tabpanel"
                                aria-labelledby="v-pills-orders-tab">
                                <div class="tabs-content__single">
                                    <h4><span>Hello Admin</span> (Not Admin? Logout)</h4>
                                    <h5>From your account personal you can view your <span>Recent Orders, manage your
                                            shipping</span> and <span>billing addresses,</span> and edit your
                                        <span>Password and account details</span>
                                    </h5>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-likes" role="tabpanel"
                                aria-labelledby="v-pills-likes-tab">
                                <div class="tabs-content__single">
                                    <div class="col-xl-12 wow fadeInUp animated">
                                        <div class="wishlist-table-box">
                                            <div class="wishlist-table-outer">
                                                <table class="wishlist-table">
                                                    <thead class="wishlist-header">
                                                        <tr>
                                                            <th>Image</th>
                                                            <th>Product</th>
                                                            <th>Price</th>
                                                            <th>Quantity</th>
                                                            <th>Delete</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="product in productsLike" v-bind:key="product.id">
                                                            <td style="width:15%">
                                                                <div class="wishlist-thumb"> <img :src="product.image_url" :alt="product.title"> </div>
                                                            </td>
                                                            <td style="width:35%">
                                                                <h5 class="wishtitle">{{ product.title }}</h5>
                                                            </td>
                                                            <td style="width:10%">
                                                                <p class="price">{{ product.price }}</p>
                                                            </td>
                                                            <td style="width:30%" class="add-to-cart-btn">  
                                                                <a @click.prevent="popupProductNull();getProduct(product.id)" :href="`#popupLike${product.id}`" 
                                                                    class="addcart btn--primary style2 popup_link">Add To Cart</a>
                                                                <div :id="`popupLike${product.id}`" class="product-gird__quick-view-popup mfp-hide" style="width:50%">
                                                                    <div v-if="popupProduct" class="container">
                                                                        <div class="row justify-content-between align-items-center">
                                                                            <div class="col-lg-12">
                                                                                <div class="popup-right-content">
                                                                                    <h3>{{ popupProduct.title }}</h3>
                                                                                    <!--size-->
                                                                                    <div class="shop-details-top-size-box">
                                                                                        <h4>Size: <span v-if="countOfSizeObj">({{ countOfSizeObj.title }})</span></h4>
                                                                                        <div class="shop-details-top-size-list-box">
                                                                                            <ul class="shop-details-top-size-list">
                                                                                                <li v-for="countOfSize in popupProduct.counts" v-bind:key="countOfSize.id">
                                                                                                    <a @click.prevent="setProductSize(countOfSize)" href="#0">{{ countOfSize.title }}</a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!--endsize-->
                                                                                    <div class="add-product">
                                                                                        <h6>Qty:</h6>
                                                                                        <div class="button-group">
                                                                                            <div class="qtySelector text-center">
                                                                                                <span class="decreaseQty"><i class="flaticon-minus"></i></span>
                                                                                                <input type="number" class="qtyValue" value="1" />
                                                                                                <span class="increaseQty" :maxValue="maxCountSize"> <i class="flaticon-plus"></i></span>
                                                                                            </div>
                                                                                            <button v-if="countOfSizeObj" @click.prevent = "addToCart(product, countOfSizeObj)" class="btn--primary mfp-close"> Add to Cart </button>
                                                                                            <button v-else @click.prevent = "" class="btn--primary "> Add to Cart </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td style="width:10%">
                                                                <div @click="deleteProductLike(product.id)" class="remove"> <i class="flaticon-cross"></i> </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
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
export default {
    name: "Account",
    mounted(){
        $(document).trigger('changed_'),
        this.getUser(),
        this.getBirth(),
        this.getProductsLike()
        this.getRegions()
    },
    data() {
        return {
            user: null,
            arrayBirthDay: [],
            arrayBirthMonth: [],
            arrayBirthYear: [],
            patronymic: null,
            surname: null,
            birthDay: null,
            birthMonth: null,
            birthYear: null,
            gender: null,
            phone: '',
            regions: [],
            settlement: null,
            regionId: 0,
            popupProduct: null,
            countOfSizeObj: null,
            maxCountSize: 1,
            productsLike: [],
            changeDataUser: '',
            phoneError: ''
        }
    },
    computed: {
        lenPhone(){
            return this.phone.length;
        }
    },
    methods: {
        getUser(){
            axios.get('/api/user')
                .then(res => {
                    this.user = res.data.data;
                    this.patronymic = this.user.patronymic;
                    this.surname = this.user.surname;
                    this.birthDay = this.user.birth.day;
                    this.birthMonth = this.user.birth.month;
                    this.birthYear = this.user.birth.year;
                    this.gender = this.user.gender;
                    this.phone = this.user.phone;
                    this.regionId = this.user.region_id;
                    this.settlement = this.user.settlement;
                    if(this.user.region_id === ''){
                        this.regionId = 0;
                    }
                    console.log(this.user);
                    console.log("UUUU");
                })
                .finally(x => {
                    if(this.user){
                        this.maskPhone();
                    }  
                    $(document).trigger('changed_')
                });
            this.$emit('set-search-empty'); 
        },
        getBirth(){
            for(let i=1;i<=31;i++){
                this.arrayBirthDay.push(i);
            }
            for(let i=1;i<=12;i++){
                this.arrayBirthMonth.push(i);
            }
            for(let i=1940;i<=2025;i++){
                this.arrayBirthYear.push(i);
            }
        },
        updateData(){
            if(this.phone.length < 19){
                this.phoneError = 'Введите номер телефона';
                setTimeout(() => this.phoneError = '', 2000);
                return null;
            }
            let birthDate = `${this.birthYear}-${this.birthMonth}-${this.birthDay}`;
            if(this.regionId === 0){
                this.regionId = '';
            }
            this.axios.post('/api/user/update', {
                patronymic: this.patronymic,
                surname: this.surname,
                birth_date: birthDate,
                gender: this.gender,
                phone: this.phone,
                region_id: this.regionId,
                settlement: this.settlement
            })
            .then(res => {
                this.changeDataUser = res.data;
                setTimeout(() => this.changeDataUser = '', 2000);
                console.log(res);  
            })
        },
        getProductsLike(){
            this.axios.get('/api/products/like')
                .then(res => {
                    this.productsLike = res.data.data;
                    console.log('LIKE');
                    console.log(this.productsLike);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        deleteProductLike(id){
            this.axios.get(`/api/product/${id}/like`)
                .then(res => {
                    this.productsLike = this.productsLike.filter(el => {
                        return el.id !== id;
                    });
                });
        },
        popupProductNull(){
            this.popupProduct = null;
            this.countOfSizeObj = null;
            this.maxCountSize = 1;
        },
        getProduct(id){
            this.axios.get(`/api/product/${id}`)
                .then(res => {
                    this.popupProduct = res.data.data;
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
        setProductSize(countOfSize){
            this.countOfSizeObj = countOfSize;
            this.maxCountSize = this.countOfSizeObj.count;
            var el = document.querySelector(".qtyValue");
            el.value = 1;
        },
        addToCart(product, countOfSizeObj){
            let qty = Number($('.qtyValue').val());
            let cart = localStorage.getItem('cart');
            $('.qtyValue').val(1); 
            let newProduct = [
                    {
                        'id': product.id,
                        'title': product.title,
                        'price': product.price,
                        'image_url': product.image_url,
                        'size_id': countOfSizeObj.id,
                        'size_title': countOfSizeObj.title,
                        'qty': qty
                    }
                ];

            if(!cart){
                localStorage.setItem('cart', JSON.stringify(newProduct));
            }else{
                cart = JSON.parse(cart);
                cart.forEach(productInCart => {
                    if((productInCart.id === product.id) && (productInCart.size_id === countOfSizeObj.id)){
                        productInCart.qty = Number(productInCart.qty) + Number(qty);
                        newProduct = null;
                    }
                });

                Array.prototype.push.apply(cart, newProduct);
                localStorage.setItem('cart', JSON.stringify(cart));
                this.$emit('get-cart-products')
            }
            
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
.single-sidebar-box .checkbox-item .form-group input:checked + label:after {
    background: #0366C0;
}
.single-sidebar-box .checkbox-item .form-group label:before{
    border: 1px solid #0366C0;
}
.form-group{
    margin-bottom: 10px;
}
.form-group.radio-male{
    margin-bottom: 3px;
}
.birth{
    width: 100%;
    display: flex;
}
.birth_margin{
    margin-right:10px;
}
.btn{
    width:35%;
}
.wishlist-thumb, .wishtitle, .remove, .btn--primary, .price{
    display:flex;
    justify-content: center;
    align-content: center;
}
.mfp-close{
    opacity: 1;
    border: 1px solid black;
}
</style>
