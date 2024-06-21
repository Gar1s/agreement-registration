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
    <h1 class="text-center my-4 mb-5">Деталі угоди</h1>

    <div class="row justify-content-between">
        <div class="col-6 border border-secondary border-1 rounded-2 p-3">
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Номер:</p>
                ${agreement.id}
            </div>
            <div class="my-2 px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Підстава:</p>
                ${basisMap[agreement.basis?string]}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Вид практики:</p>
                ${practiceTypeMap[agreement.practiceType?string]}
            </div>
        </div>
        <div class="col-5 border border-secondary border-1 rounded-2 p-3">
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Дата угоди:</p>
                ${agreement.agreementDate.format(.globals.dateFormatter)}
            </div>
            <div class="my-2 px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Початок:</p>
                ${agreement.startDate.format(.globals.dateFormatter)}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Кінець:</p>
                ${agreement.endDate.format(.globals.dateFormatter)}
            </div>
        </div>
    </div>

    <div class="row justify-content-between align-items-center mt-4">
        <div class="col-4 border border-secondary border-1 rounded-2 p-3">
            <div class="my-2 px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Документ:</p>
                <a href="/admin/files/${agreement.fileId}" target="_blank">${agreement.fileName}</a>
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

    <div class="row justify-content-between align-items-center mt-5 mb-5">
        <div class="col-9 border border-secondary border-1 rounded-2 p-3">
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">База практики:</p>
                <a href="/admin/companies/${agreement.companyViewDto.id}">${agreement.companyViewDto.name}</a>
            </div>
            <div class="px-2 my-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Підстава:</p>
                ${basisMap[agreement.companyViewDto.basis?string]}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Посада:</p>
                ${agreement.companyViewDto.position}
            </div>
            <div class="px-2 my-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Ініціали керівника:</p>
                ${agreement.companyViewDto.initials}
            </div>
            <div class="px-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Дата угоди:</p>
                ${agreement.companyViewDto.agreementDate}
            </div>
            <div class="px-2 mt-2 d-flex justify-content-between">
                <p class="m-0 fw-medium">Адреса:</p>
                м. ${agreement.companyViewDto.city}, вул.
                ${agreement.companyViewDto.street},
                ${agreement.companyViewDto.index}
            </div>
        </div>
        <div class="col-3">
            <div class="d-flex flex-column align-items-center">
                <a href="${.globals.baseUrl}/admin/agreements/${agreement.id}/edit" class="my-2">
                    <button type="button" class="btn btn-primary">Редагувати</button>
                </a>
                <form action="${.globals.baseUrl}/admin/agreements/${agreement.id}/delete" method="post" class="my-2">
                    <button type="submit" class="btn btn-danger">Вилучити</button>
                </form>
            </div>
        </div>
    </div>

</div>

</body>
</html>