let baseUrl = document.getElementById("baseUrl").value;

const {createApp} = Vue;
createApp({
    methods: {
        async deleteById(id) {
            await fetch(baseUrl + "/admin/files/" + id, {method: 'DELETE'});
            location.reload();
        }
    }
}).mount('#app')