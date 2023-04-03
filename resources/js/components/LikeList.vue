<template>
    <div v-if="getLikeCount > 0" class="wishlist-table-box">
        <h4>Избранные товары</h4>
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
                    <tr v-for="product in likeProducts" v-bind:key="product.id">
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
                            <a @click.prevent="popupProductNull();getPopupProduct(product.id)" :href="`#popupLike${product.id}`" 
                                class="addcart btn--primary style2 popup_link">Add To Cart</a>
                            <div :id="`popupLike${product.id}`" class="product-gird__quick-view-popup mfp-hide popup-width">
                                <ProductPopupMin />
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
    <div v-else>Нет понравившихся товаров</div>
</template>

<script>
    import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';
    import ProductPopupMin from './ProductPopupMin';

    export default {
        name: "LikeList",
        components: {
            ProductPopupMin
        },
        mounted() {
            this.loadLike()
        },
        unmounted() {
            this.setIsLikeFromMainPage(false);
            this.setPopupProduct(null);
            this.setPopupCountForCart(1);
            this.setPopupCountOfSizeObj(null);
            this.setPopupMaxCountSize(1); 
        },
        computed: {
            ...mapState('likeModule',[
                'likeProducts',
                'isLikeFromMainPage' //pressed link in main page
            ]),
            ...mapGetters('likeModule',[
                'getLikeCount' //count of likes
            ])
        },
        methods: {
            ...mapMutations('likeModule',[
                'setIsLikeFromMainPage'
            ]),
            ...mapActions('popupProductModule',[
                'popupProductNull',
                'getPopupProduct'
            ]),
            ...mapActions('likeModule',[
                'deleteProductLike',
                'checkLoadLike'
            ]),
            ...mapMutations('popupProductModule',[
                'setPopupProduct',
                'setPopupCountForCart',
                'setPopupCountOfSizeObj',
                'setPopupMaxCountSize'
            ]),
            loadLike(){
                if(this.isLikeFromMainPage){
                    this.checkLoadLike(); //if button like was pressed anywhere, then get new data about Like
                }
            }
        }
    }
</script>

<style scoped>
    .wishlist-table tbody tr td{
        font-weight: 400;  
    }
    .wishlist-thumb, .wishtitle, .remove, .btn--primary, .price{
    display:flex;
    justify-content: center;
    align-content: center;
}
    td a{
        color: #555555;
    }
    td a:hover{
        color: black;
    }
</style>
