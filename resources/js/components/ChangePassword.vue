<template>
    <div class="card-body">
        <h4>Изменить пароль</h4>
        <div class="form-group">
            <label for="exampleInputOldPassword">Старый пароль</label>
            <input type="text" class="form-control" v-model="oldPassword" id="exampleInputOldPassword" placeholder="Введите старый пароль">
        </div>
        <div class="form-group">
            <label for="exampleInputNewPassword">Новый пароль</label>
            <input type="text" class="form-control" v-model="newPassword" id="exampleInputNewPassword" placeholder="Введите новый пароль">
        </div>
        <div class="form-group">
            <label for="exampleInputConfirmPassword">Подтвердите новый пароль</label>
            <input type="text" class="form-control" v-model="confirmNewPassword" id="exampleInputConfirmPassword" placeholder="Подтвердите новый пароль">
        </div>
        <div class="error" v-if="errors.length > 0">
            <ul v-for="(value, key) in errors" :key="key">
                <li>{{ value }}</li>
            </ul>
        </div>
        <div class="form-group">
            <input type="submit" @click.prevent="changePassword()" class="btn btn-primary" value="Изменить пароль"/>
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
                    clientErrors.push("Все поля должны быть заполнены");
                }else{
                    if (this.oldPassword.length < 3 || this.newPassword.length < 3 || this.confirmNewPassword.length < 3){
                        clientErrors.push("Все поля должны иметь длину не меньше 3 символов");
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