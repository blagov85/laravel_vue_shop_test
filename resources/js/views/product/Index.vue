<template>
    <div>
        <main class="overflow-hidden ">
        <!--Start Breadcrumb Style2-->
        <div class="breadcrumb-area" style="background-image: url(/assets/images/inner-pages/breadcum-bg.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-content pb-60 text-center wow fadeInUp animated">
                            <h2>Shop Grid</h2>
                            <div class="breadcrumb-menu">
                                <ul>
                                    <li><a href="index.html"><i class="flaticon-home pe-2"></i>Home</a></li>
                                    <li> <i class="flaticon-next"></i> </li>
                                    <li class="active">Shop Grid</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Breadcrumb Style2-->
        <!--Start Product Categories One-->
        <section v-if="product" class="product-categories-one pb-60">
            <div class="container">
                <div class="row wow fadeInUp animated">
                    <div class="col-xl-12">
                        <div class="product-categories-one__inner">
                            <ul>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img1.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Accessories</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img2.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Furnitures</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img3.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Jewellery</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img4.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Shoes</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img5.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Electronics</h6>
                                        </a> </div>
                                </li>
                                <li> <a href="#0" class="img-box">
                                        <div class="inner"> <img src="/assets/images/shop/product-categories-v1-img6.png"
                                                alt="" /> </div>
                                    </a>
                                    <div class="title"> <a href="#0">
                                            <h6>Fashion</h6>
                                        </a> </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Product Categories One-->
        <!--Start product-grid-->
        <div class="product-grid pt-60 pb-120">
            <div class="container">
                <div class="row gx-4">
                    <div class="col-xl-3 col-lg-4">
                        <FilterList />
                    </div>
                    <div class="col-xl-9 col-lg-8">
                        <IndexProductsDisplay />
                        <IndexProducts />
                        <Pagination />
                    </div>
                </div>
            </div>
        </div>
        <!--End product-grid-->
        </main>
    </div>
</template>

<script>
import { mapMutations, mapActions } from 'vuex';
import FilterList from '../../components/FilterList';
import IndexProductsDisplay from '../../components/IndexProductsDisplay';
import IndexProducts from '../../components/IndexProducts';
import Pagination from '../../components/Pagination';

export default {
    name: "Index",
    components: {
        FilterList, //list of filters for products
        IndexProductsDisplay, //how view list of products (sorting and count on page)
        IndexProducts, //list of products on page (nested ProductForIndex)
        Pagination //pagination
    },
    mounted(){
        this.setSearchTextToStore(),
        this.nullFilterOptions(),
        this.getProducts()
    },
    beforeUnmount(){
        this.setSearchText('');
        this.setIndexProducts([]);
        this.setPagination(null);
    },
    methods: {
        ...mapActions('indexProductsModule',[
            'getProducts', //get list of products
            'nullFilterOptions' //reset filters
        ]),
        ...mapMutations('indexProductsModule',[
            'setSearchText',
            'setIndexProducts',
            'setPagination'
        ]),
        setSearchTextToStore(){ //set search text to Vuex
            let searchText = '';
            if(this.$route.params.searchVal){ //exist params searchVal
                searchText = this.$route.params.searchVal;
            }
            this.setSearchText(searchText);
        },
    }
}

</script>

<style scoped>
    
</style>
