<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Редагування Угоди</title>
    <#include "../include/dependencies.ftl">
    <#import "../component/navbar.ftl" as navbar>
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div class="container col-8">
    <h1 class="text-center my-4 mb-5">Внесіть зміни</h1>
    <form action="/admin/companies/${company.id}/edit" method="post">

        <div class="row align-items-center">
            <label for="name" class="col-2 p-0">Назва:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="name" name="name" value="${company.name?html}">
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="basis" class="col-2 p-0">Підстава:</label>
            <div id="app" class="col p-0 d-grid align-items-center" style="grid-template-columns: 4fr 1fr">
                <div class="">
                    <select v-if="optionState === true" class="form-select" id="basis" name="basis">
                        <option value="${company.basis}">${company.basis}</option>
                        <#if company.basis != "Статут">
                            <option value="Статут">Статут</option>
                        </#if>
                        <#if company.basis != "Доручення">
                            <option value="Доручення">Доручення</option>
                        </#if>
                        <#if company.basis != "Розпорядження">
                            <option value="Розпорядження">Розпорядження</option>
                        </#if>
                    </select>
                    <input v-else class="w-100 form-control" type="text" id="basis" name="basis" placeholder="Введіть...">
                </div>
                <div class="text-center">
                    <i @click="changeState" class="fa-solid fa-rotate fa-lg" style="cursor: pointer"></i>
                </div>
            </div>
        </div>

        <div class="row align-items-center">
            <label for="position" class="col-2 p-0">Посада:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="position" name="position" value="${company.position}">
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="directorInitials" class="col-3 p-0">Ініціали керівника:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="directorInitials" name="initials" value="${company.initials}">
            </div>
        </div>

        <div class="row align-items-center">
            <label for="city" class="col-2 p-0">Місто:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="city" name="city" value="${company.city}">
            </div>
        </div>
        <div class="row align-items-center py-3">
            <label for="street" class="col-2 p-0">Вулиця:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="street" name="street" value="${company.street}">
            </div>
        </div>
        <div class="row align-items-center">
            <label for="index" class="col-2 p-0">Індекс:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="index" name="index" value="${company.index}">
            </div>
        </div>

        <div class="text-center my-3">
            <a href="/admin/companies/${company.id}" class="navbar-brand m-0">
                <button type="button" class="btn btn-secondary">Скасувати</button>
            </a>
            <button type="submit" class="btn btn-primary">Змінити</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>
</div>
<script type="module" src="/js/optionState.js"></script>
</body>
</html>
