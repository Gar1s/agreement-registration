let baseUrl = document.getElementById("baseUrl").value;
let specialityCode = '06-09/06/10-07';

const {createApp} = Vue;
createApp({
    data() {
        return {
            companies: [],
            optionState: true,
            numeration: `${specialityCode}/${new Date().getFullYear().toString().slice(-2)}-`,
            numerationExisting: false,
            isNumExists: false
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
        },
        async isNumerationExists(e){
            this.numeration = e.target.value;
            const pattern = /\d{2}-\d{2}\/\d{2}\/\d{2}-\d{2}\/\d{2}-\d{2,}/gm;
            try {
                if(pattern.test(this.numeration)){
                    const url = baseUrl + "/api/admin/agreement?numeration=" + this.numeration;
                    const response = (await fetch(url));
                    this.isNumExists = await response.json();
                } else {
                    this.isNumExists = false;
                }
            } catch (error){
                console.error('Numeration error: ', error);
            }
        }
    },
    created() {
        this.fetch();
    }
}).mount('#app')