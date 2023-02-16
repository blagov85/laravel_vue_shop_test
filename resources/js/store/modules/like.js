const like = ({
    namespaced: true,
    state () {
        return {
            likedProduct: null,
            likeProducts: [],
            isChangeLike: false,
            isLikeFromMainPage: false
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
        likeProduct({ state, commit, dispatch, rootState }, product){
            axios.get(`/api/product/${product.id}/like`)
                .then(res => {
                    let changeLikeProduct = res.data.data;
                    let oneProduct = rootState.productOneModule.product;
                    let recentProducts = rootState.productsModule.recentProducts;
                    if (oneProduct){
                        oneProduct.like = changeLikeProduct.like;
                        oneProduct.count_likes = changeLikeProduct.count_likes;
                    }
                    if (recentProducts.length > 0){
                        let payload = {'listProducts': recentProducts, 'changeLikeProduct': res.data.data}
                        dispatch('setChangeProductsLike', payload);
                    }

                    let likeProducts = state.likeProducts;
                    if(changeLikeProduct.like == true){
                        likeProducts.push(product);
                    }else{
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
        setChangeProductsLike({ commit }, payload){
            let product = payload.listProducts.find(prod => prod.id === payload.changeLikeProduct.id);
            product.like = payload.changeLikeProduct.like;
            product.count_likes = payload.changeLikeProduct.count_likes;
        },
        checkLoadLike({ state, dispatch }){
            if(state.isChangeLike){
                dispatch('getProductsLike');
            }
        }
    }
})

export default like;
