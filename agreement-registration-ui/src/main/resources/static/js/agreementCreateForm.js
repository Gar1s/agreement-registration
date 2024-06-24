let baseUrl = document.getElementById("baseUrl").value;

const {createApp} = Vue;
createApp({
    data() {
        return {
            companies: []
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
        }
    },
    created() {
        this.fetch();
    }
}).mount('#app')