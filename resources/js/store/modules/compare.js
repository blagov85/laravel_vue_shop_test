import router from '../../router';
const compare = ({
    namespaced: true,
    state () {
        return {
            compare: [], //list of product in compare
            compareCategory: [], //category of product in compare
            compareProduct: [], //list of product selected category in compare
            idCategoryActive: null //selected category id
        }
    },
    getters: {
        getCompareCount(state){ //count in compare
            return state.compare.length;
        },
        getCompareCategoryCount(state){ //count category in compare 
            return state.compareCategory.length;
        },
        getCompareProductCount(state){ //count products in selected category
            return state.compareProduct.length;
        }
    },
    mutations: {
        setCompare(state, compare){
            state.compare = compare;
        },
        setCompareCategory(state, compareCategory){
            state.compareCategory = compareCategory;
        },
        setCompareProduct(state, productsCompareFullInfo){
            state.compareProduct = productsCompareFullInfo;
        },
        setIdCategoryActive(state, idCategoryActive){
            state.idCategoryActive = idCategoryActive;
        }
    },
    actions: {
        getCompare({ commit }){ //from localStorage
            let compare = JSON.parse(localStorage.getItem('compare'));
            commit('setCompare', compare);
        },
        addToCompare({ state, commit }, product){ //add or delete from compare
            let compare = localStorage.getItem('compare');;
            let compareProduct = [
                    {
                        'id': product.id,
                        'category_id': product.category.id,
                        'category_title': product.category.title,
                        'title': product.title
                    }
                ];
            if(!compare){
                localStorage.setItem('compare', JSON.stringify(compareProduct));
                commit('setCompare', compareProduct);
            }else{
                compare = JSON.parse(compare);
                compare.forEach((productInCompare, index, arr) => {
                    if(productInCompare.id === product.id){
                        compareProduct = null;
                        arr.splice(index,1);
                    }
                });
                Array.prototype.push.apply(compare, compareProduct);
                localStorage.setItem('compare', JSON.stringify(compare));
                commit('setCompare', compare);
            }
        },
        getCompareCategory({ state, commit }){
            let compareCategory = [];
            let compare = state.compare;
            let category = {
                id: null,
                title: null,
                count: 0
            }; 
            if(compare.length > 0){
                compare.forEach((item, index) =>{
                    if(index == 0){
                        category.id = item.category_id;
                        category.title = item.category_title;
                        category.count = 1;
                        compareCategory.push(category);
                    }else{
                        let sameCategory = false;
                        compareCategory.forEach(itemCategory =>{
                            if(itemCategory.id == item.category_id){
                                sameCategory = true;
                                itemCategory.count += 1; 
                            }
                        });
                        if(!sameCategory){
                            category = {};
                            category.id = item.category_id;
                            category.title = item.category_title;
                            category.count = 1;
                            compareCategory.push(category);
                        }
                    }
                });
            }
            commit('setCompareCategory', compareCategory);
        },
        checkCompare({ state, dispatch, getters }){
            //compare in localStorage == compare in Vuex variable
            let compare = JSON.parse(localStorage.getItem('compare'));
            if (state.compare != compare){
                dispatch('getCompare');
                dispatch('getCompareCategory');
            }
            //count category of product == 0
            if(getters.getCompareCategoryCount == 0){
                router.push({name: 'products.compare'});
            }
        },
        removeCompareCategory({ state, commit }, id){
            let compare = state.compare;
            let compareCategory = state.compareCategory;
            //delete category and all products in this category
            compare = compare.filter(item => {
                return item.category_id !== id;
            });
            compareCategory = compareCategory.filter(item => {
                return item.id != id;
            });
            localStorage.setItem('compare', JSON.stringify(compare));
            commit('setCompare', compare);
            commit('setCompareCategory', compareCategory);
            //in deleted category is active, redirect to first category in list or empty page
            if (state.idCategoryActive == id){
                commit('setIdCategoryActive', null);
                if(compareCategory.length > 0){
                    router.push({name: 'products.compareId', params: { id: compareCategory[0].id }});
                }else{
                    router.push({name: 'products.compare'});
                }
            }
        },
        getCompareProducts({ state, commit }, idCategory = null){
            commit('setIdCategoryActive', idCategory);
            let idCompare = [];
            let productsCompareFullInfo = [];
            let compare = state.compare;
            //get id of products in slected category
            if(idCategory == null){
                compare.forEach(item =>{
                    idCompare.push(item.id);
                });
            }else{
                compare.forEach(item =>{
                    if(item.category_id == idCategory){
                        idCompare.push(item.id);
                    }
                });
            }
            //get products data about ids list of products
            axios.post("/api/compare",{
                ids: idCompare
                }).then(res => {
                    productsCompareFullInfo = res.data.data;
                    commit('setCompareProduct', productsCompareFullInfo);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
                
        },
        removeProductCompare({ state, commit, getters }, id){
            let compare = state.compare;
            let compareProduct = state.compareProduct;
            let compareCategory = state.compareCategory;
            //delete product from compare list and category list
            compare = compare.filter(item => {
                return item.id !== id;
            });
            compareProduct = compareProduct.filter(item => {
                return item.id !== id;
            });
            if(compareProduct.length > 0){
                //count of products in category = count in compareProduct
                compareCategory.forEach(item => {
                    if(item.id !== state.idCategoryActive){
                        item.count = compareProduct.length;
                    }
                });
            }else{
                //no products in category, delete category
                compareCategory = compareCategory.filter(item => {
                    return item.id != state.idCategoryActive;
                });
                if(compareCategory.length > 0){
                    //count in active category > 0, reload page with active category - first in category list
                    router.push({name: 'products.compareId', params: { id: compareCategory[0].id }});
                }else{
                    //count in active category = 0, reload default page
                    router.push({name: 'products.compare'});
                }
            }
            //change localStorage
            localStorage.setItem('compare', JSON.stringify(compare));
            commit('setCompare', compare);
            commit('setCompareProduct', compareProduct);
            commit('setCompareCategory', compareCategory); 
        }
    }
})

export default compare;
