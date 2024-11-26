
const {createApp} = Vue;
createApp({
    data() {
        return {
            ...optionStateApp.data()
        }
    },
    methods: {
        ...optionStateApp.methods
    }
}).mount('#companyEditApp')