const productOne = ({
    namespaced: true,
    state () {
        return {
            product: null
        }
      },
    mutations: {
        setProduct(state, product){
            state.product = product;
        }
    },
    actions: {
        getProduct({ commit }, id){
            axios.get(`/api/product/${id}`)
                .then(res => {
                    let product = res.data.data;
                    commit('setProduct', product);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
            //this.$emit('set-search-empty');    
        },
    }
})

export default productOne;
