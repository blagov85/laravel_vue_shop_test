const indexProducts = ({
    namespaced: true,
    state () {
        return {
            indexProducts: [], //list of products in index page
            pagination: null, //object of pagination
            countItemsPage: 12, //count products in page
            filterKey: "DEFAULT_KEY", //sorting of products in page
            searchText: '', //text for search
            filterList: [],
            filterOptions: { //filter data for view of products
                categories: null,
                sex: null,
                brands: null,
                countries: null,
                materials: null,
                seasons: null,
                sizes: null,
                colors: null,
                tags: null,
                prices: null,
                sorting: null
            } 
        }
      },
    mutations: {
        setIndexProducts(state, indexProducts){
            state.indexProducts = indexProducts;
        },
        setPagination(state, pagination){
            state.pagination = pagination;
        },
        setFilterList(state, filterList){
            state.filterList = filterList;
        },
        setFilterOptions(state, filterOptions){
            state.filterOptions = filterOptions;
        },
        setFilterOptionsNull(state){
            state.filterOptions = { //filter data for view of products
                categories: null,
                sex: null,
                brands: null,
                countries: null,
                materials: null,
                seasons: null,
                sizes: null,
                colors: null,
                tags: null,
                prices: null,
                sorting: null
            };
        },
        setCountItemsPage(state, countItemsPage){
            state.countItemsPage = countItemsPage;
        },
        setFilterKey(state, filterKey){
            state.filterKey = filterKey;
        },
        setSearchText(state, searchText){
            state.searchText = searchText;
        }
    },
    actions: {
        //get list of products for index page 
        getProducts({state, commit}, page = 1){
            axios.post("/api/products/search", {
                    //set options
                    categories: state.filterOptions.categories,
                    sex: state.filterOptions.sex,
                    brands: state.filterOptions.brands,
                    countries: state.filterOptions.countries,
                    materials: state.filterOptions.materials,
                    seasons: state.filterOptions.seasons,
                    sizes: state.filterOptions.sizes,
                    colors: state.filterOptions.colors,
                    tags: state.filterOptions.tags,
                    prices: state.filterOptions.prices,
                    countItemsPage: state.countItemsPage,
                    filterKey: state.filterKey,
                    page: page,
                    search: state.searchText
                })
                .then(res => {
                    commit('setIndexProducts', res.data.data);
                    commit('setPagination', res.data.meta);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        nullFilterOptions({ commit }){
            let letFilterOptions = {
                    categories: null,
                    sex: null,
                    brands: null,
                    countries: null,
                    materials: null,
                    seasons: null,
                    sizes: null,
                    colors: null,
                    tags: null,
                    prices: null,
                    sorting: null
                }; 
            commit('setFilterOptions', letFilterOptions);
        }
    }
})

export default indexProducts;
