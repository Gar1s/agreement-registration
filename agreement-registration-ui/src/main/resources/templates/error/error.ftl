<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Помилка</title>
    <#include "../include/dependencies.ftl">
    <#import "../component/navbar.ftl" as navbar>
</head>
<body>
<@navbar.navbar></@navbar.navbar>
<div class="position-fixed w-100 h-100 text-center d-flex align-items-center justify-content-center">
    <div class="row justify-content-center w-75">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-danger text-white">
                    <h2 class="my-2">Помилка!</h2>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Опис:
                        <span class="card-text text-danger"> ${errorMessage!"Невідома помилка"}</span>
                    </h5>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
