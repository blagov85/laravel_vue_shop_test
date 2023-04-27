const products = ({
    namespaced: true,
    state () {
        return {
            recentProducts: []
        }
      },
    mutations: {
        setRecentProducts(state, recentProducts){
            state.recentProducts = recentProducts;
        }
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
    }
})

export default products;
