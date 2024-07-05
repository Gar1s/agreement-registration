let baseUrl = document.getElementById("baseUrl").value;

const {createApp} = Vue;
createApp({
    data() {
        return {
            modalDisplay: 'display:none',
            fileName: '',
            fileId: ''
        }
    },
    methods: {
        async deleteById() {
            await fetch(baseUrl + "/admin/files/" + this.fileId, {method: 'DELETE'});
            location.reload();
        },
        enableModel(id, name){
            this.modalDisplay = 'display:flex';
            this.fileId = id;
            this.fileName = name;
        },
        disableModel(){
            this.modalDisplay = 'display:none';
        }
    }
}).mount('#app')