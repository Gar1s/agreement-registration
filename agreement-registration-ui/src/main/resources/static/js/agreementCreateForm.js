let baseUrl = document.getElementById("baseUrl").value;

const {createApp} = Vue;
createApp({
    data() {
        return {
            companies: [],
            optionState: true
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