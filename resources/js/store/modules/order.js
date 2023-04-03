const order = ({
    namespaced: true,
        state () {
            return {
                order: null, //made order
                orders: [] //list of orders, made by user
            }
    },
    getters: {
        getOrderCount(state){
            return state.orders.length;
        }
    },
    mutations: {
        setOrder(state, order){
            state.order = order;
        },
        setOrders(state, orders){
            state.orders = orders;
        },
    },
    actions: {
        //get made order 
        getOrder({ commit }, id){
            commit('setOrder', null);
            axios.get(`/api/order/${id}`)
                .then(res => {
                    let order = res.data.data;
                    commit('setOrder', order);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        //get list of orders
        getOrders({ commit }){
            commit('setOrders', []);
            axios.get('/api/orders')
                .then(res => {
                    let orders = res.data.data;
                    commit('setOrders', orders);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        
    }
})

export default order;
