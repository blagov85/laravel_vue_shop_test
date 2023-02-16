<template>
    <div class="container">
        <div class="row justify-content-between align-items-center">
            <div class="col-lg-12">
                <div class="product-drescription">
                    <div class="review-from-box mt-30">
                        <h6 v-if="feedbackParentId">Write a Reply</h6>
                        <h6 v-else>Write a Review</h6>
                        <form action="#" class="review-from">
                            <div class="row">
                                <div v-if="feedbackParentId == null" class="col-lg-12">
                                    <div class="ratting-box">
                                        <p> RATING </p>
                                        <div class="star-choose" @mouseout="fixStars()">
                                            <template v-for="item in 5" :key="`star${item}`">
                                                <div :class="[changeRating[item-1] == true ? 'icon-star-like' : 'icon-star']" 
                                                    @mousemove="focusRating(item)" @click.prevent="clickRating(item)"></div>
                                            </template>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group m-0"> 
                                        <label v-if="feedbackParentId" for="email">BODY OF REPLY (1500)</label> 
                                        <label v-else for="email">BODY OF REVIEW (1500)</label> 
                                        <textarea v-model="textFeedback" placeholder="Write Your Comments Here"></textarea> 
                                    </div>
                                </div>
                            </div> 
                            <button v-if="textFeedback !== ''" type="submit" @click.prevent="feedbackProduct(product.id)" class="mfp-close btn--primary style2">
                                Submit {{ feedbackParentId ? 'Reply' : 'Review' }}   
                            </button>
                            <button v-else type="submit" @click.prevent="" class="btn--primary style2">
                                Submit {{ feedbackParentId ? 'Reply' : 'Review' }}   
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';

    export default {
        name: "FeedbackNew",
        mounted() {
            console.log('Component mounted.')
        },
        data(){
            return{
                // feedbackParentId: null,
                // changeRating: [false,false,false,false,false],
                // chooseRating: [false,false,false,false,false],
                // textFeedback: ''
            }
        },
        computed: {
            ...mapState('productOneModule',[
                'product'
            ]),
            ...mapState('feedbackModule',[
                'feedbackParentId',
                'rating',
                'chooseRating',
                'changeRating'
            ]),
            textFeedback: {
                get() {
                    return this.$store.state.feedbackModule.textFeedback
                },
                set(value) {
                    this.$store.commit('feedbackModule/setTextFeedback', value)
                }
            }
        },
        methods: {
            ...mapActions('feedbackModule',[
                'fixStars',
                'focusRating',
                'clickRating',
                'feedbackProduct'
            ]),
            // feedbackProductNull(){
            //     this.textFeedback = '';
            //     this.rating = null;
            //     this.chooseRating = [false, false, false, false, false];
            //     this.changeRating = [false, false, false, false, false];
            // },
            // ...mapMutations('feedbackModule',[
            //     'setTextFeedback'
            // ]),
            // fixStars(){
            //     this.changeRating = this.chooseRating.slice(0);
            // },
            // focusRating(itemStar){
            //     let i;
            //     for(i = 0; i < itemStar; i++){
            //         this.changeRating[i] = true;
            //     }
            //     for(i = itemStar; i < 5; i++){
            //         this.changeRating[i] = false;
            //     }
            // },
            // clickRating(itemStar){
            //     this.chooseRating = this.changeRating.slice(0);
            //     this.rating = itemStar;
            // },
            // feedbackProduct(){
            //     this.axios.post(`/api/product/${this.$route.params.id}/feedback`,{
            //         message: this.textFeedback,
            //         rating: this.rating,
            //         status: 'new',
            //         parent_id: this.feedbackParentId
            //     })
            //         .then(res => {
            //             console.log("OK");
            //         })
            //         .finally(x => {
            //             $(document).trigger('changed_')
            //         });
            // }
        }
    }
</script>

<style scoped>
.icon-star, .icon-star-like{
    display:inline-block;
    padding-right:5px;
}
.icon-star::before, .icon-star-like::before{
    content: "\f005";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    font-size: 20px;
}
.icon-star::before{
    color: #ccc;
}
.icon-star-like::before{
    color: #f69c63;
}
.star-choose{
    display:block;
    float:left;
}
.mfp-close{
    opacity: 1;
    border: 1px solid black;
    width: 170px;
}
</style>
