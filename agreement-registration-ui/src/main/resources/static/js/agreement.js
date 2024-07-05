let baseUrl = document.getElementById("baseUrl").value;
const csrfToken = document.querySelector('meta[name="csrf-files-token"]').getAttribute('content');

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
            await fetch(baseUrl + "/admin/files/" + this.fileId, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-Token': csrfToken
                }
            });
            location.reload();
        },
        enableModel(id, name) {
            this.modalDisplay = 'display:flex';
            this.fileId = id;
            this.fileName = name;
        },
        disableModel() {
            this.modalDisplay = 'display:none';
        }
    }
}).mount('#app')