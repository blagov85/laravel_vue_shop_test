const products = ({
    namespaced: true,
    state () {
        return {
            recentProducts: []
            //likedddProduct: null
        }
      },
    mutations: {
        setRecentProducts(state, recentProducts){
            state.recentProducts = recentProducts;
        },
        // setLikeProduct(state, likeProduct){
        //     state.likedddProduct = likeProduct;
        // }
    },
    actions: {
        getRecentProducts({commit}, id){
            axios.get(`/api/products/recent/${id}`)
                .then(res => {
                    commit('setRecentProducts', res.data.data);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        }
        // likeProduct({commit}, id){
        //     axios.get(`/api/product/${id}/like`)
        //         .then(res => {
        //             commit('setLikeProduct', res.data.data);
        //         })
        //         .finally(x => {
        //             $(document).trigger('changed_')
        //         });
        // } 
    }
})

export default products;
