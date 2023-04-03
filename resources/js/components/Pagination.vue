<template>
    <div class="row" v-if="pagination && pagination.last_page > 1">
        <div class="col-12 d-flex justify-content-center wow fadeInUp animated">
            <ul class="pagination text-center">
                <li v-if="pagination.current_page !== 1" class="next"><a href="#0" @click.prevent = "getProducts(pagination.current_page-1)">
                    <i class="flaticon-left-arrows" aria-hidden="true"></i></a>
                </li>
                <li v-for="link in pagination.links" v-bind:key="link.label">
                    <template v-if="(Number(link.label) && 
                        (pagination.current_page - link.label < 2) &&
                        (link.label - pagination.current_page < 2)) ||
                        (Number(link.label) === 1) ||
                        (Number(link.label) === pagination.last_page)">
                        <a :class="link.active ? 'active' : ''" href="#0" @click.prevent = "getProducts(link.label)">{{ link.label }}</a>
                    </template>
                    <template v-if="(Number(link.label) && 
                        (pagination.current_page !== 3) && 
                        (pagination.current_page - link.label === 2)) ||
                        (Number(link.label) && 
                        (pagination.last_page - pagination.current_page !== 2) && 
                        (link.label - pagination.current_page === 2))">
                        <a>...</a>
                    </template>
                </li>
                <li v-if="pagination.current_page !== pagination.last_page" class="next" @click.prevent = "getProducts(pagination.current_page+1)">
                    <a href="#0"><i class="flaticon-next-1" aria-hidden="true"></i></a>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>

    import { mapState, mapActions } from 'vuex';

    export default {
        name: "Pagination",
        computed: {
            ...mapState('indexProductsModule',[
                'pagination'
            ])
        },
        methods: {
            ...mapActions('indexProductsModule',[
                'getProducts'
            ]),
        }
    }
</script>

<style scoped>
    
</style>
