<template>
    <div v-if="pageName != null" class="shop-details-breadcrumb fadeInUp overflow-hidden ">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="shop-details-inner">
                        <ul class="shop-details-menu">
                            <li>
                                <router-link :to="{ name: 'products.index' }">
                                    На головну
                                </router-link>
                            </li>
                            <li class="active">{{ pageName }}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';

    export default {
        name: "Breadcrumb",
        data(){
            return{
                route: this.$route.name,
                pageName: null
            }
        },
        computed: {
                ...mapState('productOneModule',[
                    'product'
                ]),
                pageName: function(){
                    if(this.route == "product.show"){
                        if(this.product != null){
                            return this.product.title;
                        }
                    } 
                }
        },
        methods: {
            
        }
    }
</script>
    
<style scoped>
    
</style>
