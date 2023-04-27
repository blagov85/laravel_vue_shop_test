<template>
    <div>
    <main class="overflow-hidden ">
        <!--Start Login Page-->
        <section class="login-page pt-120 pb-120">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-9 fadeInUp animated">
                        <div class="login-register-form"
                            style="background-image: url('/assets/images/inner-pages/login-bg.png');">
                            <div class="top-title text-center ">
                                <h2>Новый пароль</h2>
                            </div>
                            <form class="common-form">
                                <div class="form-group">
                                    <input type="email" v-model="email" class="form-control" placeholder="Your Email">
                                </div>
                                <div class="form-group eye">
                                    <div class="icon icon-1"> <i class="flaticon-hidden"></i></div> 
                                    <input type="password" v-model="password" id="password-field" class="form-control" placeholder="Password">
                                    <div class="icon icon-2 "><i class="flaticon-visibility"></i> </div>
                                </div>
                                <div class="form-group eye">
                                    <div class="icon icon-1"> <i class="flaticon-hidden"></i></div> 
                                    <input type="password" v-model="password_confirmation" id="password-field-confirm" class="form-control" placeholder="Password">
                                    <div class="icon icon-2 "><i class="flaticon-visibility"></i> </div>
                                </div>
                                <div class="error" v-if="errors.length > 0">
                                    <ul v-for="(value, key) in errors" :key="key">
                                        <li>{{ value }}</li>
                                    </ul>
                                </div>
                                <button type="submit" @click.prevent="resetPassword()" class="btn--primary style2">Reset Password </button>
                            </form>
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
export default {
    name: "ResetPassword",
    mounted(){
        this.getMail()
    },
    data() {
        return {
            email: '',
            password: '',
            password_confirmation: '',
            token: '',
            errors: []
        }
    },
    methods: {
        getMail(){
            this.email = this.$route.query.email ? this.$route.query.email : null;
            console.log("mail - " + this.$route.query.email)
        },
        resetPassword(){
            this.errors = [];
            this.errors = this.formError();
            if (this.errors.length > 0){
                return false;
            }
            axios.get('/sanctum/csrf-cookie')
                .then(response => {
                    this.axios.post('/api/reset/password', {
                            email: this.email, 
                            password: this.password, 
                            password_confirmation: this.password_confirmation,
                            token: this.$route.params.token
                        })
                        .then(res => {
                            localStorage.setItem('x_xsrf_token', res.config.headers['X-XSRF-TOKEN']);
                            this.$router.push({name: 'products.index'});
                        })
                        .catch(error => {
                            console.log(error);
                            this.errors = [];
                            this.errors.push(serverError(error));
                        })
                        .finally(x => {

                        });
            })
        },
        formError(){
            let clientErrors = [];
            if (this.email == '' || this.password == '' || this.password_confirmation == ''){
                clientErrors.push("Все поля должны быть заполнены");
            }else{
                if (!this.validateEmail(this.email)){
                    clientErrors.push("Поле email должно содержать название єлектронной почты");
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
