const popupProduct = ({
    namespaced: true,
    state () {
        return {
            popupProduct: null,
            popupCountForCart: 1,
            popupCountOfSizeObj: null,
            popupMaxCountSize: 1
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
        getPopupProduct({commit},id){
            axios.get(`/api/product/${id}`)
                .then(res => {
                    commit('setPopupProduct', res.data.data);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        setProductSize({state,commit},sizeObj){
            commit('setPopupCountForCart', 1);
            commit('setPopupCountOfSizeObj', sizeObj);
            commit('setPopupMaxCountSize', sizeObj.count);
        },
        decreaseCountPopup ({state, commit}) {
            if(state.popupCountForCart === 1) return;
                commit('setDecreaseCountPopup');
        },
        increaseCountPopup ({state, commit}) {
            if(state.popupCountForCart === state.popupMaxCountSize) return;
                commit('setIncreaseCountPopup');
        }
    },
    getters: {
        percentRatingStarPopup(state){
            if(!state.popupProduct){
                return 0;
            }
            return Math.round((state.popupProduct.rating / 5) * 100);
        }
    }
})

export default popupProduct;
