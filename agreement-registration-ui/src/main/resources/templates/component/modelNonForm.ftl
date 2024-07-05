<#macro model method name desc>
    <style>
        .buttonM {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }
        .buttonM:hover {
            opacity:1;
        }
        .cancelbtn, .deletebtn {
            float: left;
            width: 50%;
        }
        .cancelbtn {
            background-color: #ccc;
            color: black;
        }
        .deletebtn {
            background-color: #da3545;
        }
        .containerM {
            padding: 35px;
            text-align: center;
        }
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            align-items: center;
            justify-content: center;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(71, 78, 93, 0.7);
        }
        .modal-content {
            background-color: #fefefe;
            border: 1px solid #888;
            width: 50%;
        }
        .close {
            position: absolute;
            right: 35px;
            top: 15px;
            font-size: 40px;
            font-weight: bold;
            color: #f1f1f1;
        }
        .close:hover,
        .close:focus {
            color: #f44336;
            cursor: pointer;
        }
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
    </style>
    <div id="id02" class="modal">
        <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
        <div class="modal-content">
            <div class="containerM">
                <h1>Видалити ${name}</h1>
                <p style="margin: 1rem 0">Ви точно хочете видалити ${name} - ${desc}?</p>
                <div class="clearfix">
                    <button onclick="document.getElementById('id02').style.display='none'"
                            type="button" class="cancelbtn buttonM">Скасувати</button>
                    <button @click="${method}" type="submit" class="deletebtn buttonM">Видалити</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        let modal = document.getElementById('id02');
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</#macro>