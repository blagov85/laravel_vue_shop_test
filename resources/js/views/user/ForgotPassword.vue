<template>
    <div>
    <main class="overflow-hidden ">       
        <!--Start Login Page-->
        <section class="login-page pt-120 pb-120 fadeInUp">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-9">
                        <div class="login-register-form"
                            style="background-image: url('/assets/images/inner-pages/login-bg.png');">
                            <div class="top-title text-center ">
                                <h2>Забули пароль?</h2>
                            </div>
                            <form class="common-form" @submit.prevent="forgotPassword()">
                                <div class="form-group"> 
                                    <input type="text" v-model="email" class="form-control"> 
                                </div>
                                <div class="error" v-if="errors.length > 0">
                                    <ul v-for="(value, key) in errors" :key="key">
                                        <li>{{ value }}</li>
                                    </ul>
                                </div>
                                <button type="submit" class="btn--primary style2">Продовжити</button>
                            </form>
                            <h6 v-if="errorSendEmail !== ''" class="error-message">{{ errorSendEmail }}</h6>
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
    name: "ForgotPassword",
    mounted(){
        $(document).trigger('changed_')  
    },
    data() {
        return {
            email: '',
            errorSendEmail: '',
            errors: []
        }
    },
    methods: {
        forgotPassword(){
            this.errors = [];
            this.errors = this.formError();
            if (this.errors.length > 0){
                return false;
            }
            axios.post('/api/reset-password', {
                email: this.email
            })
            .then(res => {
                if(res.data.message){
                    this.errors = [];
                    this.errors.push(res.data.message);
                }
            })
            .catch(error => {
                this.errors = [];
                this.errors = this.serverError(error);
            });
        },
        formError(){
            let clientErrors = [];
            if (this.email == ''){
                clientErrors.push("Всі поля мають буди заповнені");
            }else if (!this.validateEmail(this.email)){
                clientErrors.push("Поле email повинно містити адресу електронної пошти");
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
h6 {
    margin-top:10px;
    color:red;
}
.error{
    color:red;
    margin-bottom: 20px;
}
</style>
