<template>
    <div class="sidebar-closer"></div>
    <div v-if="filterList" class="shop-grid-sidebar"> 
        <button class="remove-sidebar d-lg-none d-block"> 
            <i class="flaticon-cross"></i>
        </button>
        <div class="sidebar-holder">
            <div class="single-sidebar-box mt-30  fadeInUp animated ">
                <h4>Select Brands</h4>
                <div class="checkbox-item">
                    <form>
                        <div v-for="brand in filterList.brands" v-bind:key="brand.id" class="form-group"> 
                            <input type="checkbox" :value="brand.id" v-model="brands" :id="`brand${brand.id}`"> 
                            <label :for="`brand${brand.id}`">{{ brand.title }}</label> </div>
                    </form>
                </div>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated ">
                <h4>Select Categories</h4>
                <div class="checkbox-item">
                    <form>
                        <div v-for="category in filterList.categories" v-bind:key="category.id" class="form-group"> 
                            <input type="checkbox" :value="category.id" v-model="categories" :id="`category${category.id}`"> 
                            <label :for="`category${category.id}`">{{ category.title }}</label> </div>
                    </form>
                </div>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated ">
                <h4>Select Sex</h4>
                <div class="checkbox-item">
                    <form>
                        <div v-for="sexOne in filterList.sex" v-bind:key="sexOne.id" class="form-group"> 
                            <input type="checkbox" :value="sexOne.id" v-model="sex" :id="`sexOne${sexOne.id}`"> 
                            <label :for="`sexOne${sexOne.id}`">{{ sexOne.title }}</label> </div>
                    </form>
                </div>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated">
                <h4>Color Option </h4>
                <ul class="color-option">
                    <li v-for="color in filterList.colors" v-bind:key="color.id"> 
                        <a @click.prevent="addColor(color.id)" :id="`color${color.id}`" href="#0" class="color-option-single" :style="`background: #${color.title}`"> <span>{{ color.title }}</span> </a> 
                    </li>
                </ul>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated">
                <h4>Filter By Price</h4>
                <div class="slider-box">
                    <div id="price-range" class="slider"></div>
                    <div class="output-price"> <label for="priceRange">Price:</label> <input
                            type="text" id="priceRange" readonly> 
                    </div> 
                </div>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated">
                <h4>Sizes</h4>
                <ul class="popular-tag">
                    <li v-for="size in filterList.sizes" v-bind:key="size.id">
                        <a @click.prevent="addSize(size.id)" :id="`size${size.id}`" href="#0">{{ size.title }}</a></li>
                </ul>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated">
                <h4>Seasons</h4>
                <ul class="popular-tag">
                    <li v-for="season in filterList.seasons" v-bind:key="season.id">
                        <a @click.prevent="addSeason(season.id)" :id="`season${season.id}`" href="#0">{{ season.title }}</a></li>
                </ul>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated">
                <h4>Materials</h4>
                <ul class="popular-tag">
                    <li v-for="material in filterList.materials" v-bind:key="material.id">
                        <a @click.prevent="addMaterial(material.id)" :id="`material${material.id}`" href="#0">{{ material.title }}</a></li>
                </ul>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated">
                <h4>Countries</h4>
                <ul class="popular-tag">
                    <li v-for="country in filterList.countries" v-bind:key="country.id">
                        <a @click.prevent="addCountry(country.id)" :id="`country${country.id}`" href="#0">{{ country.title }}</a></li>
                </ul>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated">
                <h4>Tags </h4>
                <ul class="popular-tag">
                    <li v-for="tag in filterList.tags" v-bind:key="tag.id">
                        <a @click.prevent="addTag(tag.id)" :id="`tag${tag.id}`" href="#0">{{ tag.title }}</a></li>
                </ul>
            </div>
            <div class="single-sidebar-box mt-30  fadeInUp animated pb-0 border-bottom-0 ">
                <div class="slider-box">
                    <button @click.prevent="filterProducts" class="filterbtn"
                            type="submit"> Filter 
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapMutations, mapActions } from 'vuex';

    export default {
        name: "FilterList",
        mounted() {
            this.getFilterList()
        },
        beforeUnmount(){
            this.setFilterList(null);
            this.setFilterOptionsNull();
        },
        data(){
            return{
                filterList: [],
                filterOptions: null,
                categories: [],
                sex: [],
                brands: [],
                countries: [],
                materials: [],
                seasons: [],
                sizes: [],
                colors: [],
                tags: [],
                prices: [],
                backgroundActive: "#f69c63",
                backgroundDeactive: "#f1f1f1",
                fontActive: "#ffffff",
                fontDeactive: "#555555",
                border: "solid 1px #161FCA",
            }
        },
        methods: {
            ...mapMutations('indexProductsModule',[
                'setFilterOptions',
                'setFilterOptionsNull',
                'setFilterList'
            ]),
            ...mapActions('indexProductsModule',[
                'getProducts' //get list of products
            ]),
            //find element, set it property, add to array or delete from array 
            addSize(id){
                const element = document.getElementById(`size${id}`);
                if(!this.sizes.includes(id)){
                    element.style.backgroundColor=this.backgroundActive;
                    element.style.color=this.fontActive;
                    this.sizes.push(id);
                } else {
                    element.style.backgroundColor=this.backgroundDeactive;
                    element.style.color=this.fontDeactive;
                    this.sizes = this.sizes.filter(elem => {
                        return elem !== id;
                    });
                }
            },
            addSeason(id){
                const element = document.getElementById(`season${id}`);
                if(!this.seasons.includes(id)){
                    element.style.backgroundColor=this.backgroundActive;
                    element.style.color=this.fontActive;
                    this.seasons.push(id);
                } else {
                    element.style.backgroundColor=this.backgroundDeactive;
                    element.style.color=this.fontDeactive;
                    this.seasons = this.seasons.filter(elem => {
                        return elem !== id;
                    });
                }
            },
            addMaterial(id){
                const element = document.getElementById(`material${id}`);
                if(!this.materials.includes(id)){
                    element.style.backgroundColor=this.backgroundActive;
                    element.style.color=this.fontActive;
                    this.materials.push(id);
                } else {
                    element.style.backgroundColor=this.backgroundDeactive;
                    element.style.color=this.fontDeactive;
                    this.materials = this.materials.filter(elem => {
                        return elem !== id;
                    });
                }
            },
            addCountry(id){
                const element = document.getElementById(`country${id}`);
                if(!this.countries.includes(id)){
                    element.style.backgroundColor=this.backgroundActive;
                    element.style.color=this.fontActive;
                    this.countries.push(id);
                } else {
                    element.style.backgroundColor=this.backgroundDeactive;
                    element.style.color=this.fontDeactive;
                    this.countries = this.countries.filter(elem => {
                        return elem !== id;
                    });
                }
            },
            addColor(id){
                const element = document.getElementById(`color${id}`);
                if(!this.colors.includes(id)){
                    element.style.border=this.border;
                    this.colors.push(id);
                } else {
                    element.style.border='none';
                    this.colors = this.colors.filter(elem => {
                        return elem !== id;
                    });
                }
            },
            addTag(id){
                const element = document.getElementById(`tag${id}`);
                if(!this.tags.includes(id)){
                    element.style.backgroundColor=this.backgroundActive;
                    element.style.color=this.fontActive;
                    this.tags.push(id);
                } else {
                    element.style.backgroundColor=this.backgroundDeactive;
                    element.style.color=this.fontDeactive;
                    this.tags = this.tags.filter(elem => {
                        return elem !== id;
                    });
                }
            },
            //get list of product about query
            filterProducts(){
                let prices = $('#priceRange').val();
                this.prices = prices.replace(/[\s+]|[$]/g, '').split('-');
                this.setLetFilterOptions(); //set filter options
                this.setFilterOptions(this.filterOptions); //set filter options to Vuex
                this.getProducts();
                //$(document).trigger('changed_')
            },
            //get lists of filter and write data to price
            getFilterList(){
                let searchStr = '';
                if(this.$route.params.searchVal){
                    searchStr = `?search=${this.$route.params.searchVal}`;
                }
                this.axios.get(`/api/products/search/filters${searchStr}`)
                    .then(res => {
                        this.filterList = res.data.data;
                        this.setFilterList(this.filterList);
                        if(this.filterList == null){
                            return null;
                        }
                        //  Price Filter 
                        console.log("filter list");
                        console.log(this.filterList);
                        if ($("#price-range").length) {
                            $("#price-range").slider({
                            range: true,
                            min: this.filterList.price.min,
                            max: this.filterList.price.max,
                            values: [this.filterList.price.min, this.filterList.price.max],
                            slide: function (event, ui) {
                                $("#priceRange").val("$" + ui.values[0] + " - $" + ui.values[1]);
                            }
                            });
                            $("#priceRange").val("$" + $("#price-range").slider("values", 0) + " - $" + $("#price-range").slider("values", 1));
                        };

                    })
                    .finally(x => {
                        //$(document).trigger('changed_')
                    });
            },
            setLetFilterOptions(){ //options for filter
                this.filterOptions = {
                    categories: this.categories,
                    sex: this.sex,
                    brands: this.brands,
                    countries: this.countries,
                    materials: this.materials,
                    seasons: this.seasons,
                    sizes: this.sizes,
                    colors: this.colors,
                    tags: this.tags,
                    prices: this.prices
                }
            }
        }
    }
</script>

<style scoped>
    
</style>
