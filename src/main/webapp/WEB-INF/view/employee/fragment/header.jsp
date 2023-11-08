<%-- 
    Document   : header
    Created on : Nov 4, 2023, 4:38:33 PM
    Author     : OS
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <body>
        <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">
                <img src="/resources/img/logo.png" height="40">
            </a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="text-light ms-auto">
                <div class="text-light ms-auto">${loggedEmployee.username}</div>

        </div>
        <div class="dropdown text-end">
            <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="/resources/img/logged_admin.png" alt="mdo" width="32" height="32" class="rounded-circle mx-2">
            </a>
            <ul class="dropdown-menu text-small dropdown-menu-end" aria-labelledby="dropdownUser1">
                <!-- <li><a class="dropdown-item" th:href="@{/admin/infor}"></a>Hồ sơ</a></li> -->
                <li><a class="dropdown-item" href="#">Hồ sơ</a></li>
                <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                <li><hr class="dropdown-divider"></li>
                <!-- <li><a class="dropdown-item" th:href="@{/logout}">Đăng xuất</a></li> -->
                <li><a class="dropdown-item" href="/login">Đăng xuất</a></li>
            </ul>
        </div>
    </header>
</body>
</html>
