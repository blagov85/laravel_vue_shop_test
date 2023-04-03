<template>
    <div v-if="pagination && indexProducts.length > 0" class="row">
        <div class="col-xl-12">
            <div
                class="shop-grid-page-top-info p-0 justify-content-md-between justify-content-center">
                <div class="left-box wow fadeInUp animated">
                    <p>Showing {{ this.pagination.from }}–{{ this.pagination.to }} of {{ this.pagination.total }} Results</p>
                </div>
                <div
                    class="right-box justify-content-md-between justify-content-center wow fadeInUp animated">
                    <div class="short-by">
                        <div class="select-box">
                            <select class="wide" v-model="filterKey" @change="getProducts()">
                                <option v-for="sort in sortList" v-bind:key="sort.id" :value="sort.key_sort">{{ sort.title }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="product-view-style d-flex justify-content-md-between justify-content-center">  
                            <div class="select-box-item">
                            <select class="wide" v-model="countItemsPage" @change="getProducts()">
                                <option value="4">4</option>
                                <option value="6">6</option>
                                <option value="12">12</option>
                                <option value="18">18</option>
                                <option value="24">24</option>
                                <option value="30">30</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState, mapMutations, mapActions } from 'vuex';

    export default {
        name: "IndexProductsDisplay",
        mounted(){
            this.getSortList()
            //$(document).trigger('changed_')
        },
        beforeUnmount(){
            this.setCountItemsPage(12);
            this.setFilterKey('DEFAULT_KEY');
        },
        data(){
            return{
                sortList: null
            }
        },
        computed:{
            filterKey: { //current chosen sorting value
                get() {
                    return this.$store.state.indexProductsModule.filterKey
                },
                set(value) {
                    this.$store.commit('indexProductsModule/setFilterKey', value)
                }
            },
            countItemsPage: { //current chosen count on page value
                get() {
                    return this.$store.state.indexProductsModule.countItemsPage
                },
                set(value) {
                    this.$store.commit('indexProductsModule/setCountItemsPage', value)
                }
            },
            ...mapState('indexProductsModule',[
                'indexProducts', //list of products
                'pagination' //object Pagination for info about page 
            ])
        },
        methods: {
            ...mapActions('indexProductsModule',[
                'getProducts' //list of products
            ]),
            ...mapMutations('indexProductsModule',[
                'setCountItemsPage', //set count products on page
                'setFilterKey' //set value of sorting
            ]),
            getSortList(){ //get list of sorting
                this.axios.get(`/api/products/sorting`)
                    .then(res => {
                        this.sortList = res.data;
                    })
                    .finally(x => {
                        //$(document).trigger('changed_')
                    });
            }
        }
    }
</script>

<style scoped>

</style>
