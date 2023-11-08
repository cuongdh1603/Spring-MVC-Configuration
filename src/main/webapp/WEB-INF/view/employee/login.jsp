
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập</title>
        <link rel="stylesheet" type="text/css" href="/resources/css/employee/style_login.css">
        <link rel="stylesheet" type="text/css" href="/resources/css/employee/bootstrap.min.css">
        <style>
            .validationError {
                color: red;
            }
        </style>
    </head>

    <body>
        <div class="container col-lg-6">
            <h1>Đăng Nhập </h1>
            <form:form action="/employ/post-login"  commandName="employee" method="post" onsubmit="return isValidForm();">

                <div class="alert alert-danger">
                    <c:if test="${failedLogin != null}">
                        <p style="color: red">
                            <c:out value="${'Đăng nhập thất bại'}" />
                        </p>
                    </c:if>
                </div>
                <label for="username">Tên người dùng:</label>
                <form:input type="text" id="username" path="username" required="required"/>

                <label for="password">Mật khẩu:</label>
                <form:input type="password" id="password" path="password" required="required"/>

                <input type="submit" class="btn btn-primary btn-col-3" value="Đăng nhập">

                <br>

            </form:form>
        </div>
        <script>
            function isValidForm() {
                const username = document.getElementById('username').value.trim()
                const password = document.getElementById('password').value.trim()
                const errorUsername = document.getElementById('errorUsername')
                const errorPassword = document.getElementById('errorPassword')
                if (username == '') {
                    errorUsername.removeAttribute('hidden')
                    return false
                }

                if (password == '') {
                    console.log(password.length)
                    errorPassword.removeAttribute('hidden')
                    return false
                }
                return true
            }
        </script>
    </body>

</html>