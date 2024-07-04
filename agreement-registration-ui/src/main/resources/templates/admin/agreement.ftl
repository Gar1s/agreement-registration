<!DOCTYPE html>
<html lang="en">
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
<div class="container col-9">
    <h1 class="text-center my-4 mb-5">Деталі угоди</h1>

    <div class="row justify-content-between">
        <div class="col-6 border border-secondary border-1 rounded-2 p-3 d-grid align-items-center">
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Номер:</p>
                ${agreement.id}
            </div>
            <div class="my-2 px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Підстава:</p>
                ${agreement.basis}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Вид практики:</p>
                ${practiceTypeMap[agreement.practiceType?string]}
            </div>
        </div>
        <div class="col-5 border border-secondary border-1 rounded-2 p-3">
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Дата угоди компанії:</p>
                ${agreement.companyAgreementDate.format(.globals.dateFormatter)}
            </div>
            <div class="my-2 px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Дата оформлення угоди:</p>
                ${agreement.agreementDate.format(.globals.dateFormatter)}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Початок:</p>
                ${agreement.startDate.format(.globals.dateFormatter)}
            </div>
            <div class="mt-2 px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Кінець:</p>
                ${agreement.endDate.format(.globals.dateFormatter)}
            </div>
        </div>
    </div>

    <div class="row justify-content-between align-items-center mt-4">
        <div class="col-4 border border-secondary border-1 rounded-2 p-3">
            <div class="my-2 px-2">
                <p class="m-0 fw-medium">Документи:</p>
                <div class="" id="app" style="font-size: 14px">
                    <#list agreement.files as file>
                        <div class="py-2 d-flex justify-content-between align-items-center">
                            <a href="/admin/files/${file.id}" target="_blank">${file.name}</a>
                            <span @click="deleteById(${file.id})"
                                  class="text-danger" style="cursor: pointer">X</span>
                        </div>
                    </#list>
                </div>
            </div>
        </div>
        <div class="col-7 border border-secondary border-1 rounded-2 p-3">
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Ініціали студента:</p>
                ${agreement.studentInitials}
            </div>
            <div class="my-2 px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Курс:</p>
                ${agreement.year}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Спеціальність:</p>
                ${agreement.speciality} - Інженерія Програмного Забезпечення
            </div>
        </div>
    </div>

    <h5 class="m-0 p-0 pt-4">Дані компанії:</h5>

    <div class="row justify-content-between align-items-center mt-3 mb-5">
        <div class="col-9 border border-secondary border-1 rounded-2 p-3">
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">База практики:</p>
                <a href="/admin/companies/${agreement.companyDto.id}">${agreement.companyDto.name}</a>
            </div>
            <div class="px-2 my-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Підстава:</p>
                ${agreement.companyDto.basis}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Посада:</p>
                ${agreement.companyDto.position}
            </div>
            <div class="px-2 my-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Ініціали керівника:</p>
                ${agreement.companyDto.initials}
            </div>
            <div class="px-2 mt-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Адреса:</p>
                м. ${agreement.companyDto.city}, вул.
                ${agreement.companyDto.street},
                ${agreement.companyDto.index}
            </div>
        </div>
        <div class="col-3">
            <div class="d-flex flex-column align-items-center">
                <a href="${.globals.baseUrl}/admin/agreements/${agreement.id}/edit" class="my-2">
                    <button type="button" class="btn btn-primary">Редагувати</button>
                </a>
                <form action="${.globals.baseUrl}/admin/agreements/${agreement.id}/delete" method="post" class="my-2">
                    <button type="submit" class="btn btn-danger">Вилучити</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </div>
        </div>
    </div>

</div>
<input type="hidden" id="baseUrl" value="${.globals.baseUrl!}">
<script type="module" src="/js/agreement.js"></script>
</body>
</html>