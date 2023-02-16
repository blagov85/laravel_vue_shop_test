<template>
    <div>
    <main class="overflow-hidden ">
        <!--Start Breadcrumb Style2-->
        <section class="breadcrumb-area" style="background-image: url(assets/images/inner-pages/breadcum-bg.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-content text-center wow fadeInUp animated">
                            <h2>Register</h2>
                            <div class="breadcrumb-menu">
                                <ul>
                                    <li><a href="index.html"><i class="flaticon-home pe-2"></i>Home</a></li>
                                    <li> <i class="flaticon-next"></i> </li>
                                    <li class="active">Register</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Breadcrumb Style2-->
        <!--Start Login Page-->
        <section class="login-page pt-120 pb-120">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-9 wow fadeInUp animated">
                        <div class="login-register-form"
                            style="background-image: url('/assets/images/inner-pages/login-bg.png');">
                            <div class="top-title text-center ">
                                <h2>Register</h2>
                                <p>Already have an account? 
                                    <router-link :to="{name: 'user.login'}">Log in</router-link>
                                </p>
                            </div>
                            <form class="common-form">
                                <div class="form-group"> 
                                    <input type="text" v-model="name" class="form-control" placeholder="Your Name"> 
                                </div>
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
                                <div class="checkk ">
                                    <div class="form-check p-0 m-0">
                                        <input type="checkbox" id="remember">
                                        <label class="p-0" for="remember"> Accept the Terms and Privacy Policy </label>
                                    </div>
                                </div> 
                                <div class="error" v-if="errors.length > 0">
                                    <ul v-for="(value, key) in errors" :key="key">
                                        <li>{{ value }}</li>
                                    </ul>
                                </div>
                                <button type="submit" @click.prevent="store()" class="btn--primary style2">Register </button>
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
    name: "Registration",
    mounted(){
        $(document).trigger('changed_')
        this.$emit('set-search-empty')
    },
    data() {
        return {
            name: '',
            email: '',
            password: '',
            password_confirmation: '',
            user: null,
            errors: []
        }
    },
    methods: {
        store(){
            this.errors = [];
            this.errors = this.formError();
            if (this.errors.length > 0){
                return false;
            }
            axios.get('/sanctum/csrf-cookie')
                .then(response => {
                    this.axios.post('/api/regist', {
                            name: this.name, 
                            email: this.email, 
                            password: this.password, 
                            password_confirmation: this.password_confirmation,
                            role_id: 5
                        })
                        .then(res => {
                            localStorage.setItem('x_xsrf_token', res.config.headers['X-XSRF-TOKEN']);
                            this.$router.push({name: 'products.index'});
                        })
                        .catch(error => {
                            this.errors = [];
                            console.log(error.status);
                            this.errors = this.serverError(error);
                        })
                        .finally(x => {
                            $(document).trigger('changed_')
                        });
            })
            
            
        },
        formError(){
            let clientErrors = [];
            if (this.name == '' || this.email == '' || this.password == '' || this.password_confirmation == ''){
                clientErrors.push("Все поля должны быть заполнены");
            }else{
                if (!this.validateEmail(this.email)){
                    clientErrors.push("Поле email должно содержать название єлектронной почты");
                }
                if (this.name.length < 3){
                    clientErrors.push("Поле name должно иметь длину не меньше 3 символов");
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
