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
                    let images = product.product_images;
                    let imagesProduct = [];
                    imagesProduct.push(product.image_url);
                    if(images != null){
                        for (let image of images) {
                            imagesProduct.push(image.url);
                        }
                    }
                    product.allImages = imagesProduct;
                    commit('setProduct', product);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                }); 
        },
    }
})

export default productOne;
