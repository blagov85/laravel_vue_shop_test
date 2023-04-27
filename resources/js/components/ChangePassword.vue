<template>
    <div class="card-body">
        <h4>Змінити пароль</h4>
        <div class="form-group">
            <label for="exampleInputOldPassword">Старий пароль</label>
            <input type="text" class="form-control" v-model="oldPassword" id="exampleInputOldPassword">
        </div>
        <div class="form-group">
            <label for="exampleInputNewPassword">Новий пароль</label>
            <input type="text" class="form-control" v-model="newPassword" id="exampleInputNewPassword">
        </div>
        <div class="form-group">
            <label for="exampleInputConfirmPassword">Подтвердіть новий пароль</label>
            <input type="text" class="form-control" v-model="confirmNewPassword" id="exampleInputConfirmPassword">
        </div>
        <div class="error" v-if="errors.length > 0">
            <ul v-for="(value, key) in errors" :key="key">
                <li>{{ value }}</li>
            </ul>
        </div>
        <div class="form-group">
            <input type="submit" @click.prevent="changePassword()" class="btn btn-primary" value="Змінити пароль"/>
        </div>
        <h6 v-if="changePasswordText != ''">{{ this.changePasswordText }}</h6>
    </div>
</template>

<script>
    export default {
        name: "ChangePassword",

        data(){
            return{
                oldPassword: '',
                newPassword: '',
                confirmNewPassword: '',
                changePasswordText: '',
                errors: []
            }
        },
        methods: {
            changePassword(){
                this.errors = [];
                this.errors = this.formError();
                if (this.errors.length > 0){
                    return false;
                }
                axios.post('/api/change-password', {
                    old_password: this.oldPassword, 
                    new_password: this.newPassword,
                    new_password_confirmation: this.confirmNewPassword
                })
                .then(res => {
                    this.oldPassword = null;
                    this.newPassword = null;
                    this.confirmNewPassword = null;
                    if(res.data.message){
                        this.changePasswordText = res.data.message;
                        setTimeout(() => this.changePasswordText = '', 2000);
                    }
                    if(res.data.error){
                        this.errors = [];
                        this.errors = this.serverError(res);
                        setTimeout(() => this.errors = [], 2000);
                    }
                })
                .catch(error => {
                    this.errors = [];
                    this.errors = this.serverError(error);
                })
                .finally(x => {

                });
            },
            formError(){
                let clientErrors = [];
                if (this.oldPassword == '' || this.newPassword == '' || this.confirmNewPassword == ''){
                    clientErrors.push("Всі поля мають буди заповнені");
                }else{
                    if (this.oldPassword.length < 3 || this.newPassword.length < 3 || this.confirmNewPassword.length < 3){
                        clientErrors.push("Все поля повинні мати не менше 3 символів");
                    }
                }
                return clientErrors;
            },
            serverError(response){
                let serverErrors = [];
                if(response.data.errors){
                    for (let ind in response.data.errors){
                        serverErrors.push(response.data.errors[ind][0]);
                    }
                }
                if(response.data.error){
                    serverErrors.push(response.data.error);
                }
                return serverErrors;
            }
        }
    }
</script>
    
<style scoped>
 .btn{
    width:35%;
}
.form-group{
        margin-bottom: 10px;
    }
.error{
    color:red;
    margin-bottom: 20px;
}   
</style>