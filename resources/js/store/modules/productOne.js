const productOne = ({
    namespaced: true,
    state () {
        return {
            product: null //product in show page
        }
      },
    mutations: {
        setProduct(state, product){
            state.product = product;
        }
    },
    actions: {
        //get data for product in Show page
        getProduct({ commit }, id){
            axios.get(`/api/product/${id}`)
                .then(res => {
                    let product = res.data.data;
                    commit('setProduct', product);
                })
                .finally(x => {
                    //$(document).trigger('changed_')
                }); 
        },
    }
})

export default productOne;
