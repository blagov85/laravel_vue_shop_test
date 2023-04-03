const cart = ({
    namespaced: true,
    state () {
        return {
            cart: [], //list products in cart
            totalSumCart: 0 //sum of products in order
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
    getters: { //count products in order
        getCartCount(state){
            return state.cart.length;
        }
    },
    actions: {
        getCart({ commit }){ //from localStorage
            let cart = JSON.parse(localStorage.getItem('cart'));
            commit('setCart', cart);
        },
        //add product in cart or increase count of product in cart
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
                    //id product and id size of product exists in cart, then +1 count
                    if((productInCart.id === payload.product.id) && (productInCart.size_id === payload.countOfSizeObj.id)){
                        productInCart.qty = Number(productInCart.qty) + Number(qty);
                        newProduct = null;
                    }
                });
                Array.prototype.push.apply(cart, newProduct); //add product in cart list
                localStorage.setItem('cart', JSON.stringify(cart)); //update cart list to localStorage 
            }
            commit('setCart', cart);
            commit('setTotalSumCart', 0);
        },
        removeFromCart({state, commit, dispatch}, payload){//delete product with size from cart list
            let cart = state.cart;
            cart = cart.filter(product => {
                return ((product.id !== payload.id) || (product.size_id !== payload.sizeId));
            });
            localStorage.setItem('cart', JSON.stringify(cart));
            commit('setCart', cart);
            dispatch('getTotalCart');
        },
        getTotalCart({ state, getters, commit }){ //sum all products in cart 
            let total = 0;
            if(getters.getCartCount > 0){
                state.cart.forEach(product => {
                    let productSum = product.price * product.qty;
                    total += productSum;
                });
            }
            commit('setTotalSumCart', total);
        },
        decreaseQty({ state, dispatch }, product){//increase count of product in cart
            if(product.qty === 1) return;
            product.qty--;
            localStorage.setItem('cart', JSON.stringify(state.cart));
            dispatch('getTotalCart');
        },
        increaseQty({ state, dispatch }, product){//decrease count of product in cart
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
