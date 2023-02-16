const account = ({
    namespaced: true,
    state () {
        return {
            userName: null,
            token: null,
            user: null,
            dayList: [],
            monthList: [],
            yearList: [],
            regionList: []
        }
      },
    mutations: {
        setToken(state, token){
            state.token = token;
        },
        setUserName(state, userName){
            state.userName = userName;
        },
        setUser(state, user){
            state.user = user;
        },
        setDayList(state, dayList){
            state.dayList = dayList;
        },
        setMonthList(state, monthList){
            state.monthList = monthList;
        },
        setYearList(state, yearList){
            state.yearList = yearList;
        },
        setRegionList(state, regionList){
            state.regionList = regionList;
        }
    },
    actions: {
        getToken({ commit }){
            commit('setToken', localStorage.getItem('x_xsrf_token'));
        },
        getUserName({ state, commit }){
            if(state.token){
                axios.get('/api/user/name')
                    .then(res => {
                        commit('setUserName', res.data.data.name);
                    });
            }
        },
        getBirth({ commit }){
            let dayList = [];
            let monthList = [];
            let yearList = [];
            for(let i=1;i<=31;i++){
                dayList.push(i);
            }
            for(let i=1;i<=12;i++){
                monthList.push(i);
            }
            for(let i=1940;i<=2025;i++){
                yearList.push(i);
            }
            commit('setDayList', dayList);
            commit('setMonthList', monthList);
            commit('setYearList', yearList);
        },
        getRegions({ commit }){
            axios.get('/api/regions')
                .then(res => {
                    let regionList = res.data.data;
                    commit('setRegionList', regionList);
                });
        }, 
    }
})

export default account;
