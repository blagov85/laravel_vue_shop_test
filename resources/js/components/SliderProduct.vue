<template>
    <section v-if ="products.length > 0" class="recent-products pt-60 pb-120 overflow-hidden wow fadeInUp">
        <div class="container">
            <div class="row">
                <div class="col-12 wow fadeInUp animated">
                    <div class="section-head text-center">
                        <h2>{{ title }}</h2>
                    </div>
                </div>
            </div>
            <div class="row mt-30 wow fadeInUp animated">
                <div class="catagory-slider">
                    <div v-for="product in products" v-bind:key="product.id" class="products-grid-one">
                        <ProductForSlider :product="product"/>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    import ProductForSlider from './ProductForSlider';

    export default {
        name: "SliderProduct",
        components: {
            ProductForSlider //block of one product (nested ProductPopup, ProductPopupMin)
        },
        props: ['title', 'products'],

        mounted(){
            $(document).trigger('changed_')
        }
    }
</script>

<style scoped>

</style>
