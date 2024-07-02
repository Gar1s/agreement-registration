<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Реєстр Компінії</title>
    <#include "../include/dependencies.ftl">
    <#import "../component/navbar.ftl" as navbar>
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div class="container col-8">
    <h1 class="text-center my-4 mb-5">Заповніть компанію</h1>
    <form action="/admin/companies" method="post">

        <div class="row align-items-center">
            <label for="name" class="col-2 p-0">Назва:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="name" name="name">
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="basis" class="col-2 p-0">Підстава:</label>
            <div class="col p-0">
                <select class="form-select" id="basis" name="basis">
                    <option value="Статут">Статут</option>
                    <option value="Доручення">Доручення</option>
                    <option value="Розпорядження">Розпорядження</option>
                </select>
            </div>
        </div>

        <div class="row align-items-center">
            <label for="position" class="col-3 p-0">Посада:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="position" name="position">
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="initials" class="col-3 p-0">Ініціали керівника:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="initials" name="initials">
            </div>
        </div>

        <div class="row align-items-center">
            <label for="city" class="col-2 p-0">Місто:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="city" name="city">
            </div>
        </div>
        <div class="row align-items-center py-3">
            <label for="street" class="col-2 p-0">Вулиця:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="street" name="street">
            </div>
        </div>
        <div class="row align-items-center">
            <label for="index" class="col-2 p-0">Індекс:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="index" name="index">
            </div>
        </div>

        <div class="text-center my-3">
            <button type="submit" class="btn btn-primary">Додати</button>
        </div>
    </form>
</div>

</body>
</html>
