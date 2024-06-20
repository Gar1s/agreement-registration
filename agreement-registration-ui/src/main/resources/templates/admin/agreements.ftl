<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agreements List</title>
    <#include "../include/dependencies.ftl">
    <#import "../component/navbar.ftl" as navbar>
    <#assign practiceTypeMap = {
    "STUDY": "Навчальна",
    "MANUFACTURE": "Виробнича",
    "TECHNOLOGICAL": "Навчально-технологічна",
    "PRE_DIPLOMA":"Переддипломна"
    } />
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div class="container col-10">
    <h1 class="text-center my-4">Всі угоди</h1>
    <table class="table text-center m-0">
        <thead>
        <tr class="fs-6">
            <th scope="col" class="py-4">#</th>
            <th scope="col" class="py-4">База практики</th>
            <th scope="col" class="py-4">Вид практики</th>
            <th scope="col" class="py-4">Дата угоди</th>
            <th scope="col" class="py-4">Термін дії</th>
            <th scope="col" class="py-4">Ініціали cтудента</th>
            <th scope="col" class="py-4"></th>
        </tr>
        </thead>
        <tbody>
        <#list list as agreement>
            <tr class="align-middle">
                <th scope="row">${agreement.id}</th>
                <td><a href="/pdf/${agreement.id}">${agreement.companyName}</a></td>
                <td>${practiceTypeMap[agreement.practiceType?string]}</td>
                <td>${agreement.agreementDate.format(.globals.dateFormatter)}</td>
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
</body>
</html>


<#--        <th>PDF Link</th>-->
<#--            <td>-->
<#--                <a href="/pdf/${agreement.id}" target="_blank">Open PDF</a>-->
<#--            </td>-->