<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${springMacroRequestContext.getMessage("title.login")}</title>
    <#include "../include/dependencies.ftl">
</head>
<body>
<div class="mt-5">
    <h2 class="text-center mt-4">Будь-ласка введіть дані:</h2>
    <form action="/login" method="post" class="d-flex flex-column align-items-center">
        <div class="m-3 w-50">
            <div class="mb-4">
                <label for="username" class="form-label">Логін</label>
                <input type="text" class="form-control" id="username" name="username">
            </div>
            <div class="mb-4">
                <label for=password" class="form-label">Пароль</label>
                <input type="password" class="form-control" id="password" aria-describedby="passwordHelp" name="password">
                <#if (error)??>
                    <div id="passwordHelp" class="form-text text-danger">Неправильний логін або пароль.</div>
                </#if>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Ввійти</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>