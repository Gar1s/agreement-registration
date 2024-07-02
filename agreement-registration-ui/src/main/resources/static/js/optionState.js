
const {createApp} = Vue;
createApp({
    data() {
        return {
            optionState: true
        }
    },
    methods: {
        changeState(){
            this.optionState = !this.optionState;
        }
    }
}).mount('#app')