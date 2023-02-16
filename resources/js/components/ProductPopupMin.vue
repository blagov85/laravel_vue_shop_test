<template>
    <div v-if="popupProduct" class="container">
        <div class="row justify-content-between align-items-center">
            <div class="col-lg-12">
                <div class="popup-right-content">
                    <h3>{{ popupProduct.title }}</h3>
                    <CounterProductSize />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import CounterProductSize from './CounterProductSize';
    import { mapState } from 'vuex';

    export default {
        name: "ProductPopupMin",
        components: {
            CounterProductSize 
        },
        mounted() {
            console.log('Component mounted.')
        },
        computed: {
            ...mapState('popupProductModule',[
                'popupProduct'
            ])
        }
    }
</script>

<style scoped>

</style>
