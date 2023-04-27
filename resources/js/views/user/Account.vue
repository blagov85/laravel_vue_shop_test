<template>
    <div>
        <main class="overflow-hidden ">
            <!--Start My Account Page-->
            <section class="my-account-page pt-120 pb-120">
                <div class="container">
                    <div class="row fadeInUp">
                        <!--Start My Account Page Menu-->
                        <div class="col-xl-3 col-lg-4">
                            <div class="d-flex align-items-start">
                                <div class="nav my-account-page__menu flex-column nav-pills me-3" id="v-pills-tab"
                                    role="tablist" aria-orientation="vertical"> 
                                    <button :class="[!isLikeFromMainPage ? 'nav-link active' : 'nav-link']"
                                            id="v-pills-personal-tab" data-bs-toggle="pill" data-bs-target="#v-pills-personal"
                                            type="button" role="tab" aria-controls="v-pills-personal" aria-selected="true">
                                        <span>Особисті дані</span> 
                                    </button>
                                    <button @click.prevent="getOrders()" class="nav-link" id="v-pills-orders-tab"
                                            data-bs-toggle="pill" data-bs-target="#v-pills-orders" type="button" role="tab"
                                            aria-controls="v-pills-orders" aria-selected="false"> 
                                        <span>Замовлення</span> 
                                    </button>
                                    <button @click.prevent="checkLoadLike()" :class="[isLikeFromMainPage ? 'nav-link active' : 'nav-link']" 
                                            id="v-pills-likes-tab" data-bs-toggle="pill"
                                            data-bs-target="#v-pills-likes" type="button" role="tab"
                                            aria-controls="v-pills-likes" aria-selected="false"> 
                                        <span>Улюблені товари</span>
                                    </button> 
                                    <button class="nav-link" id="v-pills-change-password-tab" data-bs-toggle="pill"
                                            data-bs-target="#v-pills-change-password" type="button" role="tab"
                                            aria-controls="v-pills-change-password" aria-selected="false"> 
                                        <span>Змінити пароль</span>
                                    </button> 
                                    <button @click.prevent="logout()" class="nav-link"> 
                                        <span>Вийти</span> 
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="tab-content " id="v-pills-tabContent">
                                
                                <div :class="[!isLikeFromMainPage ? 'tab-pane fade show active' : 'tab-pane fade']" 
                                    id="v-pills-personal" role="tabpanel"
                                    aria-labelledby="v-pills-personal-tab">
                                    <div class="tabs-content__single">
                                        <UserData />
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-orders" role="tabpanel"
                                    aria-labelledby="v-pills-orders-tab">
                                    <div class="tabs-content__single">
                                        <div class="col-xl-12 fadeInUp">
                                            <OrderList />
                                        </div>
                                    </div>
                                </div>
                                <div :class="[isLikeFromMainPage ? 'tab-pane fade show active' : 'tab-pane fade']" 
                                    id="v-pills-likes" role="tabpanel"
                                    aria-labelledby="v-pills-likes-tab">
                                    <div class="tabs-content__single">
                                        <div class="col-xl-12 fadeInUp">
                                            <LikeList />
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-change-password" role="tabpanel"
                                    aria-labelledby="v-pills-change-password-tab">
                                    <div class="tabs-content__single">
                                        <div class="col-xl-12 fadeInUp">
                                            <ChangePassword />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                          
                </div>
            </section>
            <!--End My Account Page-->
        </main>
    
    </div>
                                      
</template>

<script>
import { mapState, mapMutations, mapActions } from 'vuex';
import UserData from '../../components/UserData'; 
import LikeList from '../../components/LikeList'; 
import OrderList from '../../components/OrderList';
import ChangePassword from '../../components/ChangePassword';   

export default {
    name: "Account",
    components: {
        LikeList, //list of like products of user (nested ProductPopupMin)
        OrderList, //list of orders of user (nested OrderInfo)
        UserData, //personal data of user
        ChangePassword //form for change password
    },
    computed: {
        ...mapState('accountModule',[
            'userName'
        ]),
        ...mapState('likeModule',[
            'isLikeFromMainPage' //press link in main page
        ]),
    },
    methods: {
        ...mapActions('likeModule',[
            'checkLoadLike'
        ]),
        ...mapActions('orderModule',[
            'getOrders'
        ]),
        ...mapMutations('accountModule',[
            'setToken',
            'setUserName',
            'setUser',
            'setDayList',
            'setMonthList',
            'setYearList',
            'setRegionList'
        ]),
        ...mapMutations('likeModule',[
            'setLikeProducts',
            'setIsChangeLiked',
            'setIsLikeFromMainPage'
        ]),
        ...mapMutations('orderModule',[
            'setOrder',
            'setOrders'
        ]),
        logout(){
            axios.post('/api/logout')
                .then(res => {
                    localStorage.removeItem('x_xsrf_token');
                    this.setToken(null);
                    this.setLikeProducts([]);
                    this.setIsChangeLiked(false);
                    this.setIsLikeFromMainPage(false);
                    this.setUserName(null);
                    this.setUser(null);
                    this.setDayList([]);
                    this.setMonthList([]);
                    this.setYearList([]);
                    this.setRegionList([]);
                    this.setOrders([]);
                    this.setOrder(null);
                    this.$router.push({name: 'products.index'});
                });
        },  
    }
}
</script>

<style scoped>


</style>
