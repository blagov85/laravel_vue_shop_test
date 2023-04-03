const popupProduct = ({
    namespaced: true,
    state () {
        return {
            popupProduct: null, //product in popup
            popupCountForCart: 1, //count products in cart
            popupCountOfSizeObj: null, //object of size of product
            popupMaxCountSize: 1 //max count of size of product
        }
      },
    mutations: {
        setIncreaseCountPopup (state) {
            state.popupCountForCart++;
        },
        setDecreaseCountPopup (state) {
            state.popupCountForCart--;
        },
        setPopupProduct(state, productObj){
            state.popupProduct = productObj;
        },
        setPopupCountForCart(state, n){
            state.popupCountForCart = n;
        },
        setPopupCountOfSizeObj(state, sizeObj){
            state.popupCountOfSizeObj = sizeObj;
        },
        setPopupMaxCountSize(state, n){
            state.popupMaxCountSize = n;
        }
    },
    actions: {
        popupProductNull({ commit, dispatch }){
            commit('setPopupProduct', null);
            dispatch('popupProductSizeNull');
        },
        popupProductSizeNull({ commit }){
            commit('setPopupCountForCart', 1);
            commit('setPopupCountOfSizeObj', null);
            commit('setPopupMaxCountSize', 1);
        },
        //get popup product
        getPopupProduct({commit},id){
            axios.get(`/api/product/${id}`)
                .then(res => {
                    commit('setPopupProduct', res.data.data);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        //set data from count size
        setProductSize({state,commit},sizeObj){
            commit('setPopupCountForCart', 1);
            commit('setPopupCountOfSizeObj', sizeObj);
            commit('setPopupMaxCountSize', sizeObj.count);
        },
        decreaseCountPopup ({state, commit}) {
            if(state.popupCountForCart === 1) return;
                //+1
                commit('setDecreaseCountPopup');
        },
        increaseCountPopup ({state, commit}) {
            if(state.popupCountForCart === state.popupMaxCountSize) return;
                //-1
                commit('setIncreaseCountPopup');
        }
    },
    getters: {
        //get percent from 1..5 degree
        percentRatingStarPopup(state){
            if(!state.popupProduct){
                return 0;
            }
            return Math.round((state.popupProduct.rating / 5) * 100);
        }
    }
})

export default popupProduct;
