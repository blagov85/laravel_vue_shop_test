<template>
    <div>
        <main class="overflow-hidden ">
        <!--Start Breadcrumb Style2-->
        <section class="breadcrumb-area" style="background-image: url(assets/images/inner-pages/breadcum-bg.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-content text-center wow fadeInUp animated">
                            <h2>Compare</h2>
                            <div class="breadcrumb-menu">
                                <ul>
                                    <li><a href="index.html"><i class="flaticon-home pe-2"></i>Home</a></li>
                                    <li> <i class="flaticon-next"></i> </li>
                                    <li class="active">Compare</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Breadcrumb Style2-->
        <!--Start Compare-->
        <section class="compare pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12 wow fadeInUp animated">
                        <div class="compare-table-box">
                            <div class="compare-table-outer">
                                <table class="compare-table">
                                    <thead class="compare-header">
                                        <tr>
                                            <th v-for="product in productsCompare" v-bind:key="`url${product.id}`">
                                                <div class="compare-product-img-1"> 
                                                    <img :src="product.image_url" alt="">
                                                </div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5> Product </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`title${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5> Brand </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`brand${product.id}`">
                                                <h6 v-if="product.brand">{{ product.brand.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5> Sex </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`sex${product.id}`">
                                                <h6 v-if="product.sex">{{ product.sex.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5>Description</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`desc${product.id}`">
                                                <h6>{{ product.description }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5> Season </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`season${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5>Price</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`price${product.id}`">
                                                <h6>{{ product.price }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5> Material </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`material${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5>Color</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`color${product.id}`">
                                                <h6>{{ product.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5> Country </h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`country${product.id}`">
                                                <h6 v-if="product.country">{{ product.country.title }}</h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5>Add to cart</h5>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td v-for="product in productsCompare" v-bind:key="`cart${product.id}`" >
                                                <a @click.prevent="popupProductNull();getProduct(product.id)" :href="`#popupCompare${product.id}`" 
                                                    class="addcart btn--primary style2 popup_link">Add To Cart</a>
                                                
                                                <div :id="`popupCompare${product.id}`" class="product-gird__quick-view-popup mfp-hide" style="width:50%">
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
                                                                            <button v-else @click.prevent = "" class="btn--primary"> Add to Cart </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td :colspan="countProductCompare">
                                                <h5>Rating</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`rait${product.id}`">
                                                <div class="ratting"> <i class="flaticon-star-1"></i> <i
                                                        class="flaticon-star-1"></i> <i class="flaticon-star-1"></i> <i
                                                        class="flaticon-star-1"></i> <i class="flaticon-star-1"></i>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td v-for="product in productsCompare" v-bind:key="`remove${product.id}`">
                                                <div class="delete-box"> 
                                                    <a href="#" @click="removeProductCompare(product.id)">
                                                        <i class="flaticon-delete"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </section>
        <!--End Order Compare-->
        </main> 
    </div>
            
</template>

<script>
export default {
    name: "Compare",
    mounted(){
        $(document).trigger('changed_'),
        this.getCompareProducts()
        
    },
    data() {
        return {
            storageProductsMinCompare: [],
            productsCompare: [],
            countProductCompare: null,
            popupProduct: null,
            countOfSizeObj: null,
            maxCountSize: null
        }
    },
    methods: {
        getCompareProducts(){
            let idStorageProductsCompare = [];
            this.storageProductsMinCompare = JSON.parse(localStorage.getItem('compare'));
            if(this.$route.params.id == null){
                this.storageProductsMinCompare.forEach(item =>{
                    idStorageProductsCompare.push(item.id);
                });
            }else{
                this.storageProductsMinCompare.forEach(item =>{
                    if(item.category_id == this.$route.params.id){
                        idStorageProductsCompare.push(item.id);
                    }
                });
            }
            this.countProductCompare = idStorageProductsCompare.length;
            console.log(idStorageProductsCompare);
            this.axios.post("/api/compare",{
                ids: idStorageProductsCompare
                }).then(res => {
                    this.productsCompare = res.data.data;
                    console.log(res.data.data); 
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
            this.$emit('set-search-empty'); 
        },
        removeProductCompare(id){
            this.productsCompare = this.productsCompare.filter(productCompare => {
                return productCompare.id !== id;
            });
            this.storageProductsMinCompare = this.storageProductsMinCompare.filter(productCompare => {
                return productCompare.id !== id;
            });
            if(this.countProductCompare > 1){
                this.countProductCompare -= 1;
            }
            this.updateCompare();
        },
        updateCompare(){
            localStorage.setItem('compare', JSON.stringify(this.storageProductsMinCompare));
            this.$emit('get-compare-products');
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
    }
}
</script>

<style scoped>
    .mfp-close{
        opacity: 1;
        border: 1px solid black;
    }
</style>
