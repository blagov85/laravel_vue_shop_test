const like = ({
    namespaced: true,
    state () {
        return {
            likeProducts: [], //list of like products
            isChangeLike: false, //click on like icon on any products
            isLikeFromMainPage: false //click like icon on header of site
        }
    },
    getters: {
        getLikeCount(state){
            return state.likeProducts.length;
        }
    },
    mutations: {
        setLikeProducts(state, likeProducts){
            state.likeProducts = likeProducts;
        },
        setIsChangeLiked(state, isChangeLike){
            state.isChangeLike = isChangeLike;
        },
        setIsLikeFromMainPage(state, isLikeFromMainPage){
            state.isLikeFromMainPage = isLikeFromMainPage;
        }
    },
    actions: {
        //get list of like products
        getProductsLike({ commit }){
            axios.get('/api/products/like')
                .then(res => {
                    let likeProducts = res.data.data;
                    commit('setLikeProducts', likeProducts);
                    commit('setIsChangeLiked', false);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        //delete product from list of like products
        deleteProductLike({ state, commit }, id){
            axios.get(`/api/product/${id}/like`)
                .then(res => {
                    let likeProducts = state.likeProducts;
                    likeProducts = likeProducts.filter(el => {
                        return el.id !== id;
                    });
                    commit('setLikeProducts', likeProducts);
                    commit('setIsChangeLiked', false);
                });
        },
        //click on icon like
        likeProduct({ state, commit, dispatch, rootState }, product){
            axios.get(`/api/product/${product.id}/like`)
                .then(res => {
                    let changeLikeProduct = res.data.data; //get data of product
                    let oneProduct = rootState.productOneModule.product; //get product from page Show product (if exists) 
                    let recentProducts = rootState.productsModule.recentProducts; //get list products from recent products list (if exists) 
                    if (oneProduct){
                        //set properties like and count_likes for oneProduct
                        oneProduct.like = changeLikeProduct.like;
                        oneProduct.count_likes = changeLikeProduct.count_likes;
                    }
                    if (recentProducts.length > 0){
                        //set propertes like and count_likes for recentProducts
                        let payload = {'listProducts': recentProducts, 'changeLikeProduct': res.data.data}
                        dispatch('setChangeProductsLike', payload);
                    }

                    let likeProducts = state.likeProducts;
                    if(changeLikeProduct.like == true){
                        //if answer from server == true, add product to like list
                        likeProducts.push(product);
                    }else{
                        //if answer from server == false, delete product from like list
                        likeProducts = likeProducts.filter(el => {
                            return el.id !== product.id;
                        });
                    }
                    commit('setLikeProducts', likeProducts);
                    commit('setIsChangeLiked', true);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        //function for change properties like and count_likes for product with id in list
        setChangeProductsLike({ commit }, payload){
            let product = payload.listProducts.find(prod => prod.id === payload.changeLikeProduct.id);
            product.like = payload.changeLikeProduct.like;
            product.count_likes = payload.changeLikeProduct.count_likes;
        },
        //if click on icon like, get list of like products from server
        checkLoadLike({ state, dispatch }){
            if(state.isChangeLike){
                dispatch('getProductsLike');
            }
        }
    }
})

export default like;
