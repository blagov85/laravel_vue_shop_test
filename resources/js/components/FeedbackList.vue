<template>
    <div v-if="product">
        <div class="head_review">
            <div class="review-single__my pt-0 hed">
                <div class="ratting"> 
                    <div class="stars-outer">
                        <div class="stars-inner" :style="{width: percentRating + '%'}"></div>
                    </div>
                    <span class="ps-1">({{ Number.isInteger(product.rating) ? product.rating + '.0' : product.rating }})</span>
                    <span class="ps-2">BASED ON {{ product.count_rating }} REVIEW</span> 
                </div>
            </div>
            <a v-if="getToken()" @click.prevent="feedbackProductNull();setFeedbackParentId(null)" href="#popupReview" class="btn--primary style2 popup_link">
                Написать отзыв
            </a>
            <router-link v-else :to="{name: 'user.login'}" class="btn--primary style2">
                Написать отзыв
            </router-link>            
        </div>
        <div id="popupReview" class="product-gird__quick-view-popup mfp-hide" style="width:50%">
            <FeedbackNew />
        </div>
        <div v-for="feedback in product.feedback" :key="feedback.id">
            <div class="review-single">
                <div class="left">
                    <h6>{{ feedback.user }} <span> {{ feedback.date }}</span> </h6>
                    <div class="ratting">
                        <template v-for="item in 5" :key="`star${item}`">
                            <i :class="[item <= feedback.rating ? 'flaticon-star-1' : 'flaticon-star']"></i>
                        </template>
                        <i class="flaticon-star-grey"></i>
                    </div>
                    <p>{{ feedback.message }}</p>
                </div> 
                <a v-if="getToken()" @click.prevent="feedbackProductNull();setFeedbackParentId(feedback.id)" href="#popupReview" class="right-box popup_link">
                    Написать ответ
                </a>
                <router-link v-else :to="{name: 'user.login'}" class="right-box">
                    Написать ответ
                </router-link>
            </div>
            <div v-if="feedback.reply.length > 0" class="reply">
                <div v-for="replyFeedback in feedback.reply" :key="`reply${replyFeedback.id}`" class="review-single-reply">
                    <div class="left">
                        <h6>{{ replyFeedback.user }} <span> {{ replyFeedback.date }}</span> </h6>
                        <p>{{ replyFeedback.message }}</p>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import FeedbackNew from './FeedbackNew';
    import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';
    import utils from '../utils';

    export default {
        name: "FeedbackList",
        components: {
            FeedbackNew 
        },
        mounted() {
            console.log('Component mounted.')
        },
        data(){
            return {
                // feedbackParentId: null,
                // changeRating: [false,false,false,false,false],
                // chooseRating: [false,false,false,false,false],
                // textFeedback: '',
            }
        },
        computed: {
            ...mapState('productOneModule',[
                'product'
            ]),
            percentRating(){
                return utils.percentRatingStar(this.product.rating)
            }
        },
        methods: {
            ...mapActions('accountModule',[
                'getToken'
            ]),
            ...mapActions('feedbackModule',[
                'feedbackProductNull'
            ]),
            ...mapMutations('feedbackModule',[
                'setFeedbackParentId'
            ]),
            // percentRatingStar(){
            //     return Math.round((this.product.rating / 5) * 100);
            // },
            // feedbackProductNull(){
            //     this.textFeedback = '';
            //     this.rating = null;
            //     this.chooseRating = [false, false, false, false, false];
            //     this.changeRating = [false, false, false, false, false];
            // },
            // setFeedbackId(feedbackParentId){
            //     this.feedbackParentId = feedbackParentId;
            // },
            // getToken(){
            //     return localStorage.getItem('x_xsrf_token');
            // },
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
.head_review{
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom:20px;
}
.stars-outer{
    position: relative;
    display: inline-block;
}
.stars-inner{
    position: absolute;
    top:0;
    left:0;
    white-space: nowrap;
    overflow: hidden;
    width:0;
}
.stars-inner::before{
    content: "\f005 \f005 \f005 \f005 \f005";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    color: #f69c63;
}
.stars-outer::before{
    content: "\f005 \f005 \f005 \f005 \f005";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    color: #ccc;
} 
.review-single{
    border: 1px solid #EBE9E9;
    padding:10px;
    margin-bottom:15px;
    border-radius:10px;
}
.review-single-reply{
    border: 1px solid #EBE9E9;
    padding:10px;
    margin-bottom:15px;
    margin-left:30px;
    border-radius:10px;
}
.reply{
    border-left: 1px solid #EBE9E9;
}
.review-single-reply h6 {
    padding-top: 6px;
    font-weight: 600;
}
.review-single-reply h6 span {
    display: block;
    font-size: 14px;
    padding-top: 3px;
}

.flaticon-star::before{
    color: #ccc;
}
</style>
