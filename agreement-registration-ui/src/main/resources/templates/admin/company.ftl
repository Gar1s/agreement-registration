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
    <#assign basisMap = {
    "STATUTE": "Статут",
    "ORDER": "Доручення",
    "COMMISSION": "Розпорядження"
    } />
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div class="container col-9">
    <h1 class="text-center my-4 mb-5">Деталі компанії</h1>

    <div class="row justify-content-between">
        <div class="col-5 border border-secondary border-1 rounded-2 p-3 ms-4">
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Назва:</p>
                ${company.name}
            </div>
            <div class="my-2 px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Підстава:</p>
                ${basisMap[company.basis?string]}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Адреса:</p>
                м. ${company.city}, вул. ${company.street}, ${company.index}
            </div>
        </div>
        <div class="col-5 border border-secondary border-1 rounded-2 p-3 me-4 d-grid align-items-center">
            <div class="px-2 mb-1 d-flex justify-content-between">
                <p class="m-0 fw-medium">Посада:</p>
                ${company.position}
            </div>
            <div class="px-2 mt-1 d-flex justify-content-between">
                <p class="m-0 fw-medium">Ініціали керівника:</p>
                ${company.initials}
            </div>
        </div>
    </div>

    <h5 class="mt-5 mb-4">Список угод з компанією:</h5>
    <table class="table text-start m-0 w-25">
        <thead>
        <tr class="fs-6">
            <th scope="col" class="py-2">Номер</th>
        </tr>
        </thead>
        <tbody>
        <#list company.agreementIds as id>
            <tr class="align-start">
                <th scope="row">
                    <a href="/admin/agreements/${id}">${id}</a>
                </th>
            </tr>
        </#list>
        </tbody>
    </table>

    <div class="d-flex justify-content-center align-items-center mt-5">
        <a href="${.globals.baseUrl}/admin/companies/${company.id}/edit" class="me-1">
            <button type="button" class="btn btn-primary">Редагувати</button>
        </a>
        <#if company.agreementIds?size == 0>
            <form action="${.globals.baseUrl}/admin/companies/${company.id}/delete" method="post" class="ms-1">
                <button type="submit" class="btn btn-danger">Вилучити</button>
            </form>
        <#else>
            <form action="${.globals.baseUrl}/admin/companies/${company.id}/delete" method="post" class="ms-1">
                <button type="submit" class="btn btn-secondary disabled">Вилучити</button>
            </form>
        </#if>
    </div>
</div>

</div>

</body>
</html>