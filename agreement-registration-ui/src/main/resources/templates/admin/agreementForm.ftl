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
<div class="container col-8">
    <h1 class="text-center my-4 mb-5">Заповніть угоду</h1>
    <form action="/admin/agreements" method="post" enctype="multipart/form-data">

        <div class="row align-items-center">
            <label for="companyName" class="col-2 p-0">База практики:</label>
            <div class="col p-0">
                <select class="form-select" id="companyName" name="companyId" required>
                    <option value="2">ТзОВ «ДЕВБРИДЖ»</option>
                </select>
            </div>
        </div>

        <div class="row align-items-center py-3">
            <label for="basis" class="col-2 p-0">Підстава:</label>
            <div class="col p-0">
                <select class="form-select" id="basis" name="basis">
                    <option value="STATUTE">Статут</option>
                    <option value="ORDER">Доручення</option>
                </select>
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
                    <label for="agreementDate" class="col p-0">Дата угоди:</label>
                    <div class="col p-0">
                        <input type="date" class="form-control" id="agreementDate" name="agreementDate">
                    </div>
                </div>
                <div class="row align-items-center pt-2">
                    <label for="file" class="col p-0">Пдф угода:</label>
                    <div class="col p-0">
                        <input type="file" class="form-control" id="file" name="file" required>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="row align-items-center pb-2">
                    <label for="startDate" class="col">Дата початку:</label>
                    <div class="col p-0">
                        <input type="date" class="form-control" id="startDate" name="startDate">
                    </div>
                </div>
                <div class="row align-items-center pt-2">
                    <label for="endDate" class="col">Дата завершення:</label>
                    <div class="col p-0">
                        <input type="date" class="form-control" id="endDate" name="endDate">
                    </div>
                </div>
            </div>
        </div>

        <div class="row align-items-center">
            <label for="studentInitials" class="col-3 p-0">Ініціали студента:</label>
            <div class="col p-0">
                <input type="text" class="form-control" id="studentInitials" name="studentInitials">
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

        <div class="text-center my-3">
            <button type="submit" class="btn btn-primary">Додати</button>
        </div>
    </form>
</div>

</body>
</html>
