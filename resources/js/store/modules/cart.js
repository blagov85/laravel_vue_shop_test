const cart = ({
    namespaced: true,
    state () {
        return {
            cart: [],
            totalSumCart: 0
        }
      },
    mutations: {
        setCart(state, cart){
            state.cart = cart;
        },
        setTotalSumCart(state, totalSumCart){
            state.totalSumCart = totalSumCart;
        }
    },
    getters: {
        getCartCount(state){
            return state.cart.length;
        }
    },
    actions: {
        getCart({ commit }){
            let cart = JSON.parse(localStorage.getItem('cart'));
            commit('setCart', cart);
        },
        addToCart({ commit }, payload){
            let qty = Number(payload.countForCart);
            let cart = localStorage.getItem('cart');
            
            let newProduct = [
                    {
                        'id': payload.product.id,
                        'title': payload.product.title,
                        'price': payload.product.price,
                        'image_url': payload.product.image_url,
                        'size_id': payload.countOfSizeObj.id,
                        'size_title': payload.countOfSizeObj.title,
                        'qty': qty
                    }
                ];
            if(!cart){
                localStorage.setItem('cart', JSON.stringify(newProduct));
            }else{
                cart = JSON.parse(cart);
                cart.forEach(productInCart => {
                    if((productInCart.id === payload.product.id) && (productInCart.size_id === payload.countOfSizeObj.id)){
                        productInCart.qty = Number(productInCart.qty) + Number(qty);
                        newProduct = null;
                    }
                });
                Array.prototype.push.apply(cart, newProduct);
                localStorage.setItem('cart', JSON.stringify(cart));
            }
            commit('setCart', cart);
            commit('setTotalSumCart', 0);
        },
        removeFromCart({state, commit, dispatch}, payload){
            let cart = state.cart;
            cart = cart.filter(product => {
                return ((product.id !== payload.id) || (product.size_id !== payload.sizeId));
            });
            localStorage.setItem('cart', JSON.stringify(cart));
            commit('setCart', cart);
            dispatch('getTotalCart');
        },
        getTotalCart({ state, getters, commit }){
            let total = 0;
            if(getters.getCartCount > 0){
                state.cart.forEach(product => {
                    let productSum = product.price * product.qty;
                    total += productSum;
                });
            }
            commit('setTotalSumCart', total);
        },
        decreaseQty({ state, dispatch }, product){
            if(product.qty === 1) return;
            product.qty--;
            localStorage.setItem('cart', JSON.stringify(state.cart));
            dispatch('getTotalCart');
        },
        increaseQty({ state, dispatch }, product){
            product.qty++;
            localStorage.setItem('cart', JSON.stringify(state.cart));
            dispatch('getTotalCart');
        },
        updateCart({ state, dispatch }){
            localStorage.setItem('cart', JSON.stringify(state.cart));
            dispatch('getTotalCart');
        }
    }
})

export default cart;
