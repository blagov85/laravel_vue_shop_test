<template>
    <div>
        <main class="overflow-hidden ">
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
