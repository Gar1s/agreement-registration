<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${springMacroRequestContext.getMessage("title.agreement.edit")}</title>
    <#include "../include/dependencies.ftl">
    <#import "../component/navbar.ftl" as navbar>
    <#import "../component/vue/optionState.ftl" as optionState>
    <#import "../component/vue/agreementHelper.ftl" as agreementHelper>
    <#assign practiceTypeMap = {
    "STUDY": "Навчальна",
    "MANUFACTURE": "Виробнича",
    "TECHNOLOGICAL": "Навчально-технологічна",
    "PRE_DIPLOMA":"Переддипломна"
    } />
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div id="editApp" class="container col-8">
    <h1 class="text-center my-4 mb-5">Внесіть зміни</h1>
    <form action="/admin/agreements/${agreement.id}/edit" method="post" enctype="multipart/form-data">

        <div class="row align-items-center pb-3">
            <label for="numeration" class="col-2 p-0">Номер угоди:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="numeration" name="numeration" value="${agreement.numeration}"
                       placeholder="Формат: 06-09/06/10-07/hh-nn"
                       @input="isNumerationExists"
                       pattern="\d{2}-\d{2}\/\d{2}\/\d{2}-\d{2}\/\d{2}-(?!00$)(?!0\d\d)\d{2,}"
                >
                <div v-if="isNumExists" class="text-danger">
                    <small>Угода з таким номеров вже існує!</small>
                </div>
            </div>
        </div>

        <div class="row align-items-center">
            <label for="basis" class="col-2 p-0">Підстава:</label>
            <div class="col p-0 d-grid align-items-center" style="grid-template-columns: 4fr 1fr">
                <div class="">
                    <select v-if="optionState === true" class="form-select" id="basis" name="basis">
                        <option value="${agreement.basis}">${agreement.basis}</option>
                        <#if agreement.basis != "Статут">
                            <option value="Статут">Статут</option>
                        </#if>
                        <#if agreement.basis != "Доручення">
                            <option value="Доручення">Доручення</option>
                        </#if>
                        <#if agreement.basis != "Виписка з ЄДР">
                            <option value="Виписка з ЄДР">Виписка з ЄДР</option>
                        </#if>
                    </select>
                    <input v-else class="w-100 form-control" type="text" id="basis" name="basis" placeholder="Введіть...">
                </div>
                <div class="text-center">
                    <i @click="changeState" class="fa-solid fa-rotate fa-lg" style="cursor: pointer"></i>
                </div>
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
                    <label for="companyAgreementDate" class="col p-0">Дата угоди компанії:</label>
                    <div class="col p-0">
                        <input type="date" class="form-control" id="companyAgreementDate" name="companyAgreementDate" value="${agreement.companyAgreementDate}">
                    </div>
                </div>
                <div class="row align-items-center py-2">
                    <label for="agreementDate" class="col p-0">Дата оформлення угоди:</label>
                    <div class="col p-0">
                        <input type="date" class="form-control" id="agreementDate" name="agreementDate" value="${agreement.agreementDate}">
                    </div>
                </div>
            </div>
            <div class="col-5">
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
        <div class="row align-items-center pt-2">
            <label for="file" class="col-3 p-0">Додати файли:</label>
            <div class="col p-0">
                <input type="file" class="form-control" id="file" name="documents" accept=".pdf, .docx" multiple>
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
                <input type="number" list="years" class="form-control" id="year" name="year"
                       placeholder="Введіть..." value="${agreement.year}" required>
                <datalist id="years">
                    <option value="3">
                    <option value="4">
                    <option value="5">
                </datalist>
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

        <div class="text-center my-3">
            <a href="/admin/agreements/${agreement.id}" class="navbar-brand m-0">
                <button type="button" class="btn btn-secondary">Скасувати</button>
            </a>
            <button :disabled="isNumExists ? '' : disabled" type="submit" class="ms-4 btn btn-primary">Змінити</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>
</div>
<input type="hidden" id="baseUrl" value="${.globals.baseUrl!}">
<@agreementHelper.helper></@agreementHelper.helper>
<@optionState.option></@optionState.option>
<script type="module" src="/js/agreementEditForm.js"></script>
</body>
</html>
