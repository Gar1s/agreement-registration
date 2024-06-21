<#macro navbar>
    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid px-5">
            <a href="/admin/agreements" class="navbar-brand m-0">Реєстр Угод</a>
            <div class="d-flex flex-row">
                <a href="${.globals.baseUrl}/admin/agreements" class="nav-item m-0 nav-link me-3">Всі угоди</a>
                <a href="${.globals.baseUrl}/admin/agreements/create" class="nav-item m-0 nav-link">Створення угоди</a>
            </div>
        </div>
    </nav>
</#macro>