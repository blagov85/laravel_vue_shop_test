<template>
    <div v-if="compareCategory.length > 0" class="container">
        <div class="row justify-content-between align-items-center">
            <div class="col-lg-12">
                <h3>Списки сравнения</h3>
                <div v-for="category in compareCategory" v-bind:key="category.id" class="compare-category">
                    <router-link :to="{name: 'products.compareId', params: {id: category.id}}" class="category-name" :key="$route.fullPath">
                        <span class="mfp-close choose-category">
                            {{ category.title }} ({{ category.count }})  
                        </span>
                    </router-link>
                    <a class="category-delete" href="#" @click.prevent="removeCompareCategory(category.id)">
                        <span><i class="flaticon-delete"></i></span>
                    </a>
                </div>
            </div>
        </div>
    </div>   
</template>

<script>
    import { mapState, mapMutations, mapActions } from 'vuex';

    export default {
        name: "CategoryCompare",
        computed: {
            ...mapState('compareModule',[
                'compareCategory'
            ])
        },
        methods: {
            ...mapActions('compareModule',[
                'removeCompareCategory'
            ])
        }
    }
</script>

<style scoped>
.compare-category{
    width: 75%;
    height: 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0 auto;
}
.compare-category:hover {
    background: #e9ecef;
    cursor: pointer; 
}
.compare-category .category-name{
    color: black;
    width:80%;
    height:100%;
    display: flex;
    align-items: center;
}
.compare-category .category-delete{
    color: black;
    width:20%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.category-name .choose-category{
    width:100%;
    position: relative;
    display: flex;
    justify-content: left;
    font-size:16px;
    color: black;
}
.mfp-close{
    opacity: 1;
}  
</style>
