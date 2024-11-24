<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Реєстр Угоди</title>
    <#include "../include/dependencies.ftl">
    <#import "../component/navbar.ftl" as navbar>
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div id="app">
    <div class="container col-8">
        <h1 class="text-center my-4 mb-5">Заповніть угоду</h1>
        <form id="agreementForm" action="/admin/agreements" method="post" enctype="multipart/form-data">

            <div class="row align-items-center pb-3">
                <label for="numeration" class="col-2 p-0">Номер угоди:</label>
                <div class="col p-0">
                    <input type="text" class="form-control" id="numeration" name="numeration" required
                           placeholder="Формат: 06-09/06/10-07/hh-nn"
                           :value="numeration"
                           @input="isNumerationExists"
                           pattern="\d{2}-\d{2}\/\d{2}\/\d{2}-\d{2}\/\d{2}-(?!00$)(?!0\d\d)\d{2,}"
                    >
                    <div v-if="isNumExists" class="text-danger">
                        <small>Угода з таким номеров вже існує!</small>
                    </div>
                </div>
            </div>

            <div class="row align-items-center">
                <label for="companyName" class="col-2 p-0">База практики:</label>
                <div class="col p-0">
                    <div v-if="companies.length == 0">
                        <a href="${.globals.baseUrl!}/admin/companies/create" class="nav-link text-primary">Додайти компанію</a>
                    </div>
                    <select v-else class="form-select" id="companyName" name="companyId" required>
                        <option v-for="company in companies" :key="company.id"
                                :value="company.id">{{ company.name }}
                        </option>
                    </select>
                </div>
            </div>

            <div class="row align-items-center py-3">
                <label for="basis" class="col-2 p-0">Підстава:</label>
                <div class="col p-0 d-grid align-items-center" style="grid-template-columns: 4fr 1fr">
                    <div class="">
                        <select v-if="optionState === true" class="form-select" id="basis" name="basis">
                            <option value="Статут">Статут</option>
                            <option value="Доручення">Доручення</option>
                            <option value="Виписка з ЄДР">Виписка з ЄДР</option>
                        </select>
                        <input v-else class="w-100 form-control" type="text" id="basis" name="basis"
                               placeholder="Введіть..." required>
                    </div>
                    <div class="text-center">
                        <i @click="changeState" class="fa-solid fa-rotate fa-lg" style="cursor: pointer"></i>
                    </div>
                </div>
            </div>
            <div class="row align-items-center">
                <label for="practiceType" class="col-2 p-0">Вид практики:</label>
                <div class="col p-0">
                    <select class="form-select" id="practiceType" name="practiceType">
                        <option value="STUDY">Навчальна</option>
                        <option value="MANUFACTURE">Виробнича</option>
                        <option value="TECHNOLOGICAL">Навчально-технологічна</option>
                        <option value="PRE_DIPLOMA">Переддипломна</option>
                    </select>
                </div>
            </div>

            <div class="row py-4">
                <div class="col me-5">
                    <div class="row align-items-center pb-2">
                        <label for="companyAgreementDate" class="col p-0">Дата угоди компанії:</label>
                        <div class="col p-0">
                            <input type="date" class="form-control" id="companyAgreementDate"
                                   name="companyAgreementDate" required>
                        </div>
                    </div>
                    <div class="row align-items-center pt-2">
                        <label for="agreementDate" class="col p-0">Дата оформлення угоди:</label>
                        <div class="col p-0">
                            <input type="date" class="form-control" id="agreementDate" name="agreementDate" required>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="row align-items-center pb-2">
                        <label for="startDate" class="col">Дата початку:</label>
                        <div class="col p-0">
                            <input type="date" class="form-control" id="startDate" name="startDate" required>
                        </div>
                    </div>
                    <div class="row align-items-center pt-2">
                        <label for="endDate" class="col">Дата завершення:</label>
                        <div class="col p-0">
                            <input type="date" class="form-control" id="endDate" name="endDate" required>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row py-2">
                <div class="col-6 me-5 row align-items-center">
                    <label for="studentInitials" class="col-3 p-0">Ініціали студента:</label>
                    <div class="col p-0">
                        <input type="text" class="form-control" id="studentInitials" name="studentInitials" required>
                    </div>
                </div>
                <div class="col row align-items-center">
                    <label for="files" class="col-4 p-0">Пдф угоди:</label>
                    <div class="col p-0">
                        <input type="file" class="form-control" id="files" name="files" accept="application/pdf" multiple required>
                    </div>
                </div>
            </div>

            <div class="row align-items-center py-3">
                <label for="year" class="col-2 p-0">Курс:</label>
                <div class="col p-0">
                    <select class="form-select" id="year" name="year">
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
            </div>

            <div class="row align-items-center">
                <label for="speciality" class="col-2 p-0">Спеціальність:</label>
                <div class="col p-0">
                    <select class="form-select" id="speciality" name="speciality">
                        <option value="121">121 - Інженерія Програмного Забезпечення</option>
                    </select>
                </div>
            </div>

            <div v-if="companies.length == 0">
                <div class="text-center my-3" data-bs-toggle="tooltip" title="Створіть компанію">
                    <button type="submit" class="btn btn-primary disabled">Додати</button>
                </div>
            </div>
            <div v-else class="text-center my-3">
                <button :disabled="isNumExists ? '' : disabled" type="submit" class="btn btn-primary">Додати</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
    </div>
</div>
<input type="hidden" id="baseUrl" value="${.globals.baseUrl!}">
<script type="module" src="/js/agreementCreateForm.js"></script>
</body>
</html>
