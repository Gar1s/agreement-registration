<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Редагування Угоди</title>
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
<div class="container col-8">
    <h1 class="text-center my-4 mb-5">Внесіть зміни</h1>
    <form action="/admin/agreements/${agreement.id}/edit" method="post" enctype="multipart/form-data">

        <div class="row align-items-center">
            <label for="basis" class="col-2 p-0">Підстава:</label>
            <div class="col p-0">
                <select class="form-select" id="basis" name="basis">
                    <option value="${agreement.basis}">${basisMap[agreement.basis?string]}</option>
                    <#if agreement.basis != "STATUTE">
                        <option value="STATUTE">Статут</option>
                    </#if>
                    <#if agreement.basis != "ORDER">
                        <option value="ORDER">Доручення</option>
                    </#if>
                </select>
            </div>
        </div>
        <div class="row align-items-center py-3">
            <label for="practiceType" class="col-2 p-0">Вид практики:</label>
            <div class="col p-0">
                <select class="form-select" id="practiceType" name="practiceType">
                    <option value="${agreement.practiceType}">${practiceTypeMap[agreement.practiceType?string]}</option>
                    <#if agreement.practiceType != "STUDY">
                        <option value="STUDY">Навчальна</option>
                    </#if>
                    <#if agreement.practiceType != "MANUFACTURE">
                        <option value="MANUFACTURE">Виробнича</option>
                    </#if>
                    <#if agreement.practiceType != "TECHNOLOGICAL">
                        <option value="TECHNOLOGICAL">Навчально-технологічна</option>
                    </#if>
                    <#if agreement.practiceType != "PRE_DIPLOMA">
                        <option value="PRE_DIPLOMA">Переддипломна</option>
                    </#if>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col me-5">
                <div class="row align-items-center pb-2">
                    <label for="agreementDate" class="col p-0">Дата угоди:</label>
                    <div class="col p-0">
                        <input type="date" class="form-control" id="agreementDate" name="agreementDate" value="${agreement.agreementDate}">
                    </div>
                </div>
                <div class="row align-items-center pt-2">
                    <label for="file" class="col p-0">Пдф угода:</label>
                    <div class="col p-0">
                        <input type="file" class="form-control" id="file" name="document">
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="row align-items-center pb-2">
                    <label for="startDate" class="col">Дата початку:</label>
                    <div class="col p-0">
                        <input type="date" class="form-control" id="startDate" name="startDate" value="${agreement.startDate}">
                    </div>
                </div>
                <div class="row align-items-center pt-2">
                    <label for="endDate" class="col">Дата завершення:</label>
                    <div class="col p-0">
                        <input type="date" class="form-control" id="endDate" name="endDate" value="${agreement.endDate}">
                    </div>
                </div>
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="studentInitials" class="col-3 p-0">Ініціали студента:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="studentInitials" name="studentInitials" value="${agreement.studentInitials}">
            </div>
        </div>

        <div class="row align-items-center">
            <label for="year" class="col-2 p-0">Курс:</label>
            <div class="col p-0">
                <select class="form-select" id="year" name="year">
                    <option value="${agreement.year}">${agreement.year}</option>
                    <#if agreement.year != 3>
                        <option value="3">3</option>
                    </#if>
                    <#if agreement.year != 4>
                        <option value="4">4</option>
                    </#if>
                    <#if agreement.year != 5>
                        <option value="5">5</option>
                    </#if>
                </select>
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="speciality" class="col-2 p-0">Спеціальність:</label>
            <div class="col p-0">
                <select class="form-select" id="speciality" name="speciality">
                    <option value="121">121 - Інженерія Програмного Забезпечення</option>
                </select>
            </div>
        </div>

        <h5 class="m-0 p-0 pb-4 pt-4">Дані компанії:</h5>

        <div class="row align-items-center">
            <label for="companyName" class="col-2 p-0">База практики:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="companyName" name="companyEditDto.name" value="${agreement.companyViewDto.name}">
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="basis" class="col-2 p-0">Підстава:</label>
            <div class="col p-0">
                <select class="form-select" id="basis" name="companyEditDto.basis">
                    <option value="${agreement.companyViewDto.basis}">${basisMap[agreement.companyViewDto.basis?string]}</option>
                    <#if agreement.basis != "STATUTE">
                        <option value="STATUTE">Статут</option>
                    </#if>
                    <#if agreement.basis != "ORDER">
                        <option value="ORDER">Доручення</option>
                    </#if>
                </select>
            </div>
        </div>

        <div class="row align-items-center">
            <label for="position" class="col-2 p-0">Посада:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="position" name="companyEditDto.position" value="${agreement.companyViewDto.position}">
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="directorInitials" class="col-3 p-0">Ініціали керівника:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="directorInitials" name="companyEditDto.initials" value="${agreement.companyViewDto.initials}">
            </div>
        </div>

        <div class="row align-items-center">
            <label for="agreementDate" class="col-2 p-0">Дата угоди:</label>
            <div class="col p-0">
                <input type="date" class="form-control" id="agreementDate" name="companyEditDto.agreementDate" value="${agreement.companyViewDto.agreementDate}">
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="city" class="col-2 p-0">Місто:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="city" name="companyEditDto.city" value="${agreement.companyViewDto.city}">
            </div>
        </div>
        <div class="row align-items-center">
            <label for="street" class="col-2 p-0">Вулиця:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="street" name="companyEditDto.street" value="${agreement.companyViewDto.street}">
            </div>
        </div>
        <div class="row align-items-center pt-3">
            <label for="index" class="col-2 p-0">Індекс:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="index" name="companyEditDto.index" value="${agreement.companyViewDto.index}">
            </div>
        </div>


        <div class="text-center my-3">
            <a href="/admin/agreements/${agreement.id}" class="navbar-brand m-0">
                <button type="button" class="btn btn-secondary">Скасувати</button>
            </a>
            <button type="submit" class="btn btn-primary">Змінити</button>
        </div>
    </form>
</div>

</body>
</html>
