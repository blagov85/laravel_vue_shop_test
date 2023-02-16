<template>
    <div>
    <main class="overflow-hidden ">
        <!--Start Breadcrumb Style2-->
        <section class="breadcrumb-area" style="background-image: url(assets/images/inner-pages/breadcum-bg.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-content text-center wow fadeInUp animated">
                            <h2>Login</h2>
                            <div class="breadcrumb-menu">
                                <ul>
                                    <li><a href="index.html"><i class="flaticon-home pe-2"></i>Home</a></li>
                                    <li> <i class="flaticon-next"></i> </li>
                                    <li class="active">Login</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Breadcrumb Style2-->
        <!--Start Login Page-->
        <section class="login-page pt-120 pb-120 wow fadeInUp animated">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-9">
                        <div class="login-register-form"
                            style="background-image: url('/assets/images/inner-pages/login-bg.png');">
                            <div class="top-title text-center ">
                                <h2>Login</h2>
                                <p>Don't have an account yet? 
                                    <router-link :to="{name: 'user.registration'}">Sign up for free</router-link>
                                </p>
                            </div>
                            <form class="common-form" @submit.prevent="login()">
                                <div class="form-group"> 
                                    <input type="text" v-model="email" class="form-control" placeholder="Your Email Address"> 
                                </div>
                                <div class="form-group eye">
                                    <div class="icon icon-1"><i class="flaticon-hidden"></i></div> 
                                    <input type="password" v-model="password" id="password-field" class="form-control" placeholder="Password">
                                    <div class="icon icon-2 "><i class="flaticon-visibility"></i></div>
                                </div>
                                <div class="checkk ">
                                    <div class="form-check p-0 m-0"> 
                                        <input type="checkbox" v-model="remember" id="remember"> 
                                        <label class="p-0" for="remember"> Remember Me</label> 
                                    </div>
                                    <router-link :to="{name: 'user.password.request'}" class="forgot">Forgot Password?</router-link> 
                                </div> 
                                <div class="error" v-if="errors.length > 0">
                                    <ul v-for="(value, key) in errors" :key="key">
                                        <li>{{ value }}</li>
                                    </ul>
                                </div>
                                <button type="submit" class="btn--primary style2">Login </button>
                            </form>
                            <div>remember is {{ remember }}</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Login Page-->
    </main>
    </div>
</template>

<script>
import { mapState, mapGetters, mapMutations, mapActions } from 'vuex';
export default {
    name: "Login",
    mounted(){
        $(document).trigger('changed_')
        //this.$emit('set-search-empty')
        
    },
    data() {
        return {
            email: '',
            password: '',
            errors: [],
            remember: false
        }
    },
    methods: {
         ...mapActions('likeModule',[
            'getProductsLike'
        ]),
        ...mapMutations('accountModule',[
            'setToken'
        ]),
        ...mapActions('accountModule',[
            'getUserName'
        ]),
        login(){
            this.errors = [];
            this.errors = this.formError();
            if (this.errors.length > 0){
                return false;
            }
            axios.get('/sanctum/csrf-cookie')
                .then(response => {
                    axios.post('/api/log', {
                        email: this.email, 
                        password: this.password,
                        remember: this.remember
                    })
                    .then(res => {
                        let token = res.config.headers['X-XSRF-TOKEN'];
                        localStorage.setItem('x_xsrf_token', token);
                        this.setToken(token);
                        this.getUserName();
                        this.getProductsLike();
                        if(this.$route.query.pathFrom) {
                            this.$router.push(this.$route.query.pathFrom)
                        }else{
                            this.$router.push({name: 'products.index'});
                        }
                    })
                    .catch(error => {
                        this.errors = [];
                        console.log(error.status);
                        this.errors = this.serverError(error);
                    })
                    .finally(x => {
                        $(document).trigger('changed_')
                    });
            }); 
        },
        formError(){
            let clientErrors = [];
            if (this.email == '' || this.password == ''){
                clientErrors.push("Все поля должны быть заполнены");
            }else{
                if (!this.validateEmail(this.email)){
                    clientErrors.push("Поле email должно содержать название электронной почты");
                }
                if (this.password.length < 3){
                    clientErrors.push("Поле password должно иметь длину не меньше 3 символов");
                }
            }
            return clientErrors;
        },
        serverError(error){
            let serverErrors = [];
            if(error.data.errors){
                for (let ind in error.data.errors){
                    serverErrors.push(error.data.errors[ind][0]);
                }
            }
            if(error.data.error){
                serverErrors.push(error.data.error);
            }
            return serverErrors;
        },
        validateEmail(email) {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
                return true;
            }
            return false;
        }
    }
}
</script>

<style scoped>
.error{
    color:red;
    margin-bottom: 20px;
}
</style>
