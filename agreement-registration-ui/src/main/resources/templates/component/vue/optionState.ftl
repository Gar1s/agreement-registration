<#macro option>
<script>
let optionStateApp = {
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
}
</script>
</#macro>