let baseUrl = document.getElementById("baseUrl").value;
let specialityCode = '06-09/06/10-07';

const {createApp} = Vue;
createApp({
    data() {
        return {
            companies: [],
            optionState: true,
            numeration: `${specialityCode}/${new Date().getFullYear().toString().slice(-2)}-`
        }
    },
    methods: {
        async fetch() {
            try {
                const url = baseUrl + "/api/admin/companies";
                const result = await fetch(url);
                this.companies = await result.json();
            } catch (error) {
                console.error('Error fetching:', error);
            }
        },
        changeState(){
            this.optionState = !this.optionState;
        }
    },
    created() {
        this.fetch();
    }
}).mount('#app')