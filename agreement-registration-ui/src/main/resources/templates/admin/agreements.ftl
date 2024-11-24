<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-files-token" content="${_csrf.token}">
    <title>Agreements List</title>
    <#include "../include/dependencies.ftl">
    <#import "../component/navbar.ftl" as navbar>
    <#assign practiceTypeMap = {
    "STUDY": "Навчальна",
    "MANUFACTURE": "Виробнича",
    "TECHNOLOGICAL": "Навчально-технологічна",
    "PRE_DIPLOMA":"Переддипломна",
    "":"..."
    } />
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div class="container col-11 pb-5">
    <h1 class="text-center my-4">Всі угоди
        <span class="text-success ps-2">
            <i onclick="visibilityChange()" class="fa-solid fa-magnifying-glass fa-fade fa-sm"
               style="--fa-animation-duration: 2s;--fa-beat-scale: 1.1;cursor: pointer"></i>
        </span>
    </h1>
    <div id="toggleDiv">
        <form action="/admin/agreements" method="get">
            <div class="row align-items-center">
                <div class="col">
                    <div class="">
                        <label for="date" class="p-0">Рік(xxxx):</label>
                        <div class="p-0">
                            <input type="text" class="form-control" id="date" name="date"
                                   value="${params['searchDate']}">
                        </div>
                    </div>
                    <div class="py-3">
                        <label for="companyName" class="p-0">Назва компанії:</label>
                        <div class="p-0">
                            <input type="text" class="form-control" id="companyName" name="companyName"
                                   value="${params['searchCompanyName']}">
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="">
                        <label for="studentInitials" class="p-0">Ініціали студента:</label>
                        <div class="p-0">
                            <input type="text" class="form-control" id="studentInitials" name="studentInitials"
                                   value="${params['searchStudentInitials']}">
                        </div>
                    </div>
                    <div class="py-3">
                        <label for="practiceType" class="p-0">Вид практики:</label>
                        <div class="p-0">
                            <select class="form-select" id="practiceType" name="type">
                                <option value="${params['searchPracticeType']}">${practiceTypeMap[params['searchPracticeType']?string]}</option>
                                <#if params['searchPracticeType'] != "STUDY">
                                    <option value="STUDY">Навчальна</option>
                                </#if>
                                <#if params['searchPracticeType'] != "MANUFACTURE">
                                    <option value="MANUFACTURE">Виробнича</option>
                                </#if>
                                <#if params['searchPracticeType'] != "TECHNOLOGICAL">
                                    <option value="TECHNOLOGICAL">Навчально-технологічна</option>
                                </#if>
                                <#if params['searchPracticeType'] != "PRE_DIPLOMA">
                                    <option value="PRE_DIPLOMA">Переддипломна</option>
                                </#if>
                                <#if params['searchPracticeType'] != "">
                                    <option value="">...</option>
                                </#if>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-2 text-center d-grid">
                    <button class="btn btn-outline-primary my-2" type="submit">Пошук</button>
                    <button onclick="generateExcel()" class="btn btn-outline-success my-2" type="button">.xls</button>
                </div>
            </div>
        </form>
    </div>
    <table class="table text-center m-0">
        <thead>
        <tr class="fs-6">
            <th scope="col" class="py-4">#</th>
            <th scope="col" class="py-4">База практики</th>
            <th scope="col" class="py-4">Вид практики</th>
            <th scope="col" class="py-4 px-3">Дата угоди</th>
            <th scope="col" class="py-4 px-3">Термін дії</th>
            <th scope="col" class="py-4">Ініціали cтудента</th>
            <th scope="col" class="py-4"></th>
        </tr>
        </thead>
        <tbody>
        <#list list as agreement>
            <tr class="align-middle">
                <th scope="row">${agreement.numeration}</th>
                <td><a href="/admin/companies/${agreement.companyId}">${agreement.companyName}</a></td>
                <td>${practiceTypeMap[agreement.practiceType?string]}</td>
                <td>${agreement.companyAgreementDate.format(.globals.dateFormatter)}</td>
                <td>
                    ${agreement.startDate.format(.globals.dateFormatter)}<br>
                    ${agreement.endDate.format(.globals.dateFormatter)}
                </td>
                <td>${agreement.studentInitials}</td>
                <td>
                    <a href="/admin/agreements/${agreement.id}" class="navbar-brand m-0">
                        <button type="button" class="btn btn-secondary">Більше</button>
                    </a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
<script>
    let type = "${params['searchPracticeType']}";
    let init = "${params['searchStudentInitials']}";
    let date = "${params['searchDate']}";
    let comName = "${params['searchCompanyName']}";
    const csrfToken = document.querySelector('meta[name="csrf-files-token"]').getAttribute('content');

    if (isEmpty(type, init, date, comName)) {
        document.getElementById("toggleDiv").style.display = "none";
    } else {
        document.getElementById("toggleDiv").style.display = "block";
    }

    function visibilityChange() {
        let x = document.getElementById("toggleDiv");
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }

    function isEmpty(type, init, date, comName) {
        return type === "" && init === "" && date === "" && comName === "";
    }

    function generateExcel() {
        let agreements = [
            <#list list as agreement>
            {
                "id": ${agreement.id},
                "companyName": "${agreement.companyName?json_string}",
                "practiceType": "${agreement.practiceType}",
                "companyAgreementDate": "${agreement.companyAgreementDate}",
                "startDate": "${agreement.startDate}",
                "endDate": "${agreement.endDate}",
                "studentInitials": "${agreement.studentInitials}",
                "numeration": "${agreement.numeration}"
            }<#if agreement?has_next>, </#if>
            </#list>
        ];

        fetch("${.globals.baseUrl}/api/admin/reports/agreementExcel", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
            },
            body: JSON.stringify(agreements)
        })
            .then(response => response.blob())
            .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                a.download = 'угоди.xls';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
            })
            .catch(error => console.error('Download failed:', error));
    }
</script>
</body>
</html>