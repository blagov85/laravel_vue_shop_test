<template>
    <div class="container">
        <div class="row justify-content-between align-items-center">
            <div class="col-lg-12">
                <div class="product-drescription">
                    <div class="review-from-box mt-30">
                        <h6 v-if="feedbackParentId">Написати відповідь</h6>
                        <h6 v-else>Написати відгук</h6>
                        <form action="#" class="review-from">
                            <div class="row">
                                <div v-if="feedbackParentId == null" class="col-lg-12">
                                    <div class="ratting-box">
                                        <p>РЕЙТИНГ</p>
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
                                        <label v-if="feedbackParentId" for="email">ТЕКСТ ВІДПОВІДІ (1500)</label> 
                                        <label v-else for="email">ТЕКСТ ВІДГУКУ (1500)</label> 
                                        <textarea v-model="textFeedback"></textarea> 
                                    </div>
                                </div>
                            </div> 
                            <button v-if="textFeedback !== ''" type="submit" @click.prevent="feedbackProduct(product.id)" class="mfp-close btn--primary style2">
                                Надіслати {{ feedbackParentId ? 'Відповідь' : 'Відгук' }}   
                            </button>
                            <button v-else type="submit" @click.prevent="" class="btn--primary style2">
                                Надіслати {{ feedbackParentId ? 'Відповідь' : 'Відгук' }}   
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState, mapMutations, mapActions } from 'vuex';

    export default {
        name: "FeedbackNew",
        beforeUnmount(){
            this.setFeedbackParentId(null);
            this.setTextFeedback('');
            this.setRating(null);
            this.setChooseRating([false, false, false, false, false]);
            this.setChangeRating([false, false, false, false, false]);
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
            ...mapMutations('feedbackModule',[
                'setFeedbackParentId',
                'setTextFeedback',
                'setRating',
                'setChooseRating',
                'setChangeRating'
            ])
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
