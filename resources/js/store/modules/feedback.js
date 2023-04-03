const feedback = ({
    namespaced: true,
    state () {
        return {
            feedbackParentId: null, //feedbak - parent id, if feedback active is answer
            textFeedback: '',
            rating: null, //rating of product in feedback
            chooseRating: [false, false, false, false, false], //list of stars after click on star
            changeRating: [false, false, false, false, false] //list of stars after move on star
        }
      },
    mutations: {
        setFeedbackParentId(state, feedbackParentId){
            state.feedbackParentId = feedbackParentId;
        },
        setTextFeedback(state, textFeedback){
            state.textFeedback = textFeedback;
        },
        setRating(state, rating){
            state.rating = rating;
        },
        setChooseRating(state, chooseRating){
            state.chooseRating = chooseRating;
        },
        setChangeRating(state, changeRating){
            state.changeRating = changeRating;
        }
    },
    actions: {
        feedbackProductNull({ commit }){
            let nullList = [false, false, false, false, false];
            commit('setTextFeedback','');
            commit('setRating',null);
            commit('setChooseRating',nullList);
            commit('setChangeRating',nullList);
        },
        fixStars({ state, commit }){ //lose of focus on star
            let chooseRating = state.chooseRating;
            //change rating == choose rating
            commit('setChangeRating', chooseRating.slice(0));
        },
        //fill change rating list and change view of stars
        focusRating({ commit }, itemStar){
            let i;
            let changeRating = [];
            for(i = 0; i < itemStar; i++){
                changeRating[i] = true;
            }
            for(i = itemStar; i < 5; i++){
                changeRating[i] = false;
            }
            commit('setChangeRating', changeRating);
        },
        //choose rating == change rating
        clickRating({ state, commit }, itemStar){
            let changeRating = state.changeRating;
            commit('setChooseRating', changeRating.slice(0));
            commit('setRating', itemStar); //reting = figure from parameters
        },
        //add new feedback (or answer) to db
        feedbackProduct({ state }, id){
            axios.post(`/api/product/${id}/feedback`,{
                message: state.textFeedback,
                rating: state.rating,
                status: 'new',
                parent_id: state.feedbackParentId
            })
                .then(res => {
                    
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        }
    }
})

export default feedback;
