<template>
    <div>
        <div class="card-body" v-if="user">
            <h4>Дані користувача</h4>
            <div class="form-group">
                <h5>Email: {{ this.user.email }}</h5>
            </div>
            <div class="form-group">
                <h5>Ім'я: {{ this.user.name }}</h5>
            </div>
            <div class="form-group">
                <label for="exampleInputPatronymic">По-батькові</label>
                <input type="text" class="form-control" v-model="user.patronymic" id="exampleInputPatronymic">
            </div>
            <div class="form-group">
                <label for="exampleInputSurname">Прізвище</label>
                <input type="text" class="form-control" v-model="user.surname" id="exampleInputSurname">
            </div>
            <div class="form-group single-sidebar-box pb-0 border-bottom-0">
                <h5>Пол</h5>
                <div class="checkbox-item">
                    <form>
                        <div class="form-group radio-male"> 
                            <input type="radio" value="1" v-model="user.gender" id="sex-male"> 
                            <label for="sex-male">Чоловік</label> 
                        </div>
                        <div class="form-group"> 
                            <input type="radio" value="2" v-model="user.gender" id="sex-female"> 
                            <label for="sex-female">Жінка</label> 
                        </div>
                    </form>
                </div>
            </div>
            <div class="form-group">
                <h5>Дата народження</h5>
                <div class="birth">
                    <select v-model="user.birth.day" class="birth_margin">
                        <option v-for="itemDay in dayList" v-bind:key="itemDay" 
                            :value="itemDay" >{{ itemDay }}</option>
                    </select>
                    <select v-model="user.birth.month" class="birth_margin">
                        <option v-for="itemMonth in monthList" v-bind:key="itemMonth" :value="itemMonth">{{ itemMonth }}</option>
                    </select>
                    <select v-model="user.birth.year">
                        <option v-for="itemYear in yearList" v-bind:key="itemYear" :value="itemYear">{{ itemYear }}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="phone">Телефон</label>
                <input @keyUp="getLength()" type="text" class="form-control" id="phone"  v-model="user.phone">
                <span v-if="phoneError != ''">{{ this.phoneError }}</span>
            </div>
            <div class="form-group">
                <label for="region">Область</label><br>
                <select v-model="user.region_id" id="region" class="w-100">
                    <option value="0">Виберіть область</option>
                    <option v-for="region in regionList" v-bind:key="region.id" :value="region.id">{{ region.title }}</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputSettlement">Населений пункт</label>
                <textarea class="form-control" v-model="user.settlement" id="exampleInputSettlement"></textarea>
            </div>
            <div class="form-group">
                <input type="submit" @click.prevent="updateData()" class="btn btn-primary" value="Змінити дані"/>
            </div>
            <h6 v-if="changeDataUser != ''">{{ this.changeDataUser }}</h6>
        </div>
        <div v-else>Немає користувача</div>
    </div>
</template>

<script>
    import { mapState, mapMutations, mapActions } from 'vuex';

    export default {
        name: "UserData",
        mounted() {
            this.loadUserData()
        },
        data(){
            return{
                changeDataUser: '',
                phoneError: '',
                errors: [],
            }
        },
        computed: {
            ...mapState('accountModule',[
                'user',
                'dayList',
                'monthList',
                'yearList',
                'regionList'
            ]),
            lenPhone(){
                return this.user.phone.length;
            }
        },

        methods: {
            ...mapMutations('accountModule',[
                'setUser'
            ]),
            ...mapActions('accountModule',[
                'getBirth',
                'getRegions'
            ]),
            loadUserData(){//get user data,  birthday list , region list
                if(!this.user){
                    this.getUser();
                    this.getBirth();
                    this.getRegions();
                }
            },
            getUser(){
                this.axios.get('/api/user')
                    .then(res => {
                        let user = res.data.data;
                        this.setUser(user);
                        if(this.user.region_id == null){
                            this.user.region_id = "0";
                        }
                    })
                    .finally(x => {
                        if(this.user){
                            this.maskPhone();
                        }  
                        $(document).trigger('changed_')
                    });
            },
            
            updateData(){
                if(this.user.phone){
                    if(this.user.phone.length <= 5){
                        this.user.phone = null;
                    } else if(this.user.phone.length < 19){
                        this.phoneError = 'Введіть номер телефону';
                        setTimeout(() => this.phoneError = '', 2000);
                        return null;
                    }
                }
                
                let birthDate = `${this.user.birth.year}-${this.user.birth.month}-${this.user.birth.day}`;
                let region_id = this.user.region_id;
                if(region_id == 0){
                    region_id = null;
                }
                this.axios.post('/api/user/update', {
                    patronymic: this.user.patronymic,
                    surname: this.user.surname,
                    birth_date: birthDate,
                    gender: this.user.gender,
                    phone: this.user.phone,
                    region_id: region_id,
                    settlement: this.user.settlement
                })
                .then(res => {
                    this.changeDataUser = res.data;
                    setTimeout(() => this.changeDataUser = '', 2000);
                })
            },
            maskPhone(){
                var phoneInput = document.getElementById('phone');
                let keyCode;
                function mask(event) {
                    event.keyCode && (keyCode = event.keyCode);
                    let pos = this.selectionStart;
                    if (pos < 3) event.preventDefault();
                    let matrix = "+380 (__) ___-__-__",
                        i = 0,
                        def = matrix.replace(/\D/g, ""),
                        val = this.value.replace(/\D/g, ""),
                        newValue = matrix.replace(/[_\d]/g, function (a) {
                            return i < val.length ? val.charAt(i++) || def.charAt(i) : a;
                        });
                    i = newValue.indexOf("_");
                    if (i != -1) {
                        i < 5 && (i = 3);
                        newValue = newValue.slice(0, i);
                    }
                    let reg = matrix.substr(0, this.value.length).replace(/_+/g,
                        function (a) {
                            return "\\d{1," + a.length + "}";
                        }).replace(/[+()]/g, "\\$&");
                    reg = new RegExp("^" + reg + "$");
                    if (!reg.test(this.value) || this.value.length < 5 || keyCode > 47 && keyCode < 58) this.value = newValue;
                    if (event.type == "blur" && this.value.length < 5) this.value = "";
                }

                phoneInput.addEventListener("input", mask, false);
                phoneInput.addEventListener("focus", mask, false);
                phoneInput.addEventListener("blur", mask, false);
                phoneInput.addEventListener("keydown", mask, false);
            }
        }
    }
</script>
    
<style scoped>
    .single-sidebar-box .checkbox-item .form-group input:checked + label:after {
        background: #0366C0;
    }
    .single-sidebar-box .checkbox-item .form-group label:before{
        border: 1px solid #0366C0;
    }
    .form-group{
        margin-bottom: 10px;
    }
    .form-group.radio-male{
        margin-bottom: 3px;
    }
    .birth{
        width: 100%;
        display: flex;
    }
    .birth_margin{
        margin-right:10px;
    }
    .error{
        color:red;
        margin-bottom: 20px;
    }
</style>
