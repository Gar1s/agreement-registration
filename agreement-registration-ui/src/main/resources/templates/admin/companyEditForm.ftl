<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Редагування Угоди</title>
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
<div class="container col-8">
    <h1 class="text-center my-4 mb-5">Внесіть зміни</h1>
    <form action="/admin/companies/${company.id}/edit" method="post">

        <div class="row align-items-center">
            <label for="name" class="col-2 p-0">Назва:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="name" name="name" value="${company.name}">
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="basis" class="col-2 p-0">Підстава:</label>
            <div class="col p-0">
                <select class="form-select" id="basis" name="basis">
                    <option value="${company.basis}">${basisMap[company.basis?string]}</option>
                    <#if company.basis != "STATUTE">
                        <option value="STATUTE">Статут</option>
                    </#if>
                    <#if company.basis != "ORDER">
                        <option value="ORDER">Доручення</option>
                    </#if>
                </select>
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
    </form>
</div>

</body>
</html>
