<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agreements List</title>
    <#include "../include/dependencies.ftl">
    <#import "../component/navbar.ftl" as navbar>
    <#assign basisMap = {
    "STATUTE": "Статут",
    "ORDER": "Доручення",
    "COMMISSION": "Розпорядження"
    } />
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div class="container col-10">
    <h1 class="text-center my-4">Всі компанії</h1>
    <table class="table text-center m-0">
        <thead>
        <tr class="fs-6">
            <th scope="col" class="py-4">#</th>
            <th scope="col" class="py-4">Назва</th>
            <th scope="col" class="py-4">Підстава</th>
            <th scope="col" class="py-4">Посада</th>
            <th scope="col" class="py-4">Ініціали</th>
            <th scope="col" class="py-4">Адреса</th>
            <th scope="col" class="py-4"></th>
        </tr>
        </thead>
        <tbody>
        <#list list as company>
            <tr class="align-middle">
                <th scope="row">${company_index + 1}</th>
                <td>${company.name}</td>
                <td>${basisMap[company.basis?string]}</td>
                <td>${company.position}</td>
                <td>${company.initials}</td>
                <td>м. ${company.city}, вул. ${company.street}, ${company.index}</td>
                <td>
                    <a href="/admin/companies/${company.id}" class="navbar-brand m-0">
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