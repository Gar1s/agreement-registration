
const {createApp} = Vue;
createApp({
    data() {
        return {
            ...agreementHelperApp.data(),
            ...optionStateApp.data()
        }
    },
    methods: {
        ...agreementHelperApp.methods,
        ...optionStateApp.methods
    }
}).mount('#editApp')