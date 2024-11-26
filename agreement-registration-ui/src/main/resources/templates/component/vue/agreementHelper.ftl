<#macro helper>
<script>
let baseUrl = document.getElementById("baseUrl").value;
let specialityCode = '06-09/06/10-07';

let agreementHelperApp = {
    data() {
        return {
            isNumExists: false,
            numeration: specialityCode + '/' + new Date().getFullYear().toString().slice(-2) + '-'
        }
    },
    methods: {
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
    }
}
</script>
</#macro>