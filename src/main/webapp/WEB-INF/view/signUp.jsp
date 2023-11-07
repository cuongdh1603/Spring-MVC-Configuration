<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 11/4/2023
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký</title>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <style>
        body {
            padding: 50px;
        }

        * {
            margin: 0;
            padding: 0;
        }

        .form-tt {
            width: 400px;
            border-radius: 10px;
            overflow: hidden;
            padding: 55px 55px 37px;
            background: #9152f8;
            background: -webkit-linear-gradient(top, #7579ff, #b224ef);
            background: -o-linear-gradient(top, #7579ff, #b224ef);
            background: -moz-linear-gradient(top, #7579ff, #b224ef);
            background: linear-gradient(top, #7579ff, #b224ef);
            text-align: center;
        }

        .form-tt h2 {
            font-size: 30px;
            color: #fff;
            line-height: 1.2;
            text-align: center;
            text-transform: uppercase;
            display: block;
            margin-bottom: 30px;
        }

        .form-tt input[type=text], .form-tt input[type=password] ,.form-tt input[type=date] {
            font-family: Poppins-Regular;
            font-size: 16px;
            color: #fff;
            line-height: 1.2;
            display: block;
            width: calc(100% - 10px);
            height: 45px;
            background: 0 0;
            padding: 10px 0;
            border-bottom: 2px solid rgba(255, 255, 255, .24) !important;
            border: 0;
            outline: 0;
        }

        .form-tt input[type=text]::focus, .form-tt input[type=password]::focus {
            color: red;
        }

        .form-tt input[type=password] {
            margin-bottom: 20px;
        }

        .form-tt input::placeholder {
            color: #fff;
        }

        .checkbox {
            display: block;
        }

        .form-tt input[type=submit] {
            font-size: 16px;
            color: #555;
            line-height: 1.2;
            padding: 0 20px;
            min-width: 120px;
            height: 50px;
            border-radius: 25px;
            background: #fff;
            position: relative;
            z-index: 1;
            border: 0;
            outline: 0;
            display: block;
            margin: 30px auto;
        }
    </style>
    <body>
        <div class="form-tt" style="margin: 0 31%">
            <h2>Đăng ký</h2>
            <c:if test="${phoneFormatError != null}">
                <p style="color: red">
                    <c:out value="${'Sai định dạng số điện thoại'}" />
                </p>
            </c:if>
            <c:if test="${usernameError != null}">
                <p style="color: red">
                    <c:out value="${'Tên tài khoản này đã được sử dụng'}" />
                </p>
            </c:if>
            <c:if test="${phoneError != null}">
                <p style="color: red">
                    <c:out value="${'Số điện thoại này đã được sử dụng'}" />
                </p>
            </c:if>
            <c:if test="${idCreateError != null}">
                <p style="color: red">
                    <c:out value="${'Lỗi quá tải user'}" />
                </p>
            </c:if>
            <form:form action="/post-signup" commandName="client" method="post" name="dang-ky">
                <form:input type="text" path="username" name="username" placeholder="Nhập tên đăng ký" minlength="2" maxlength="10" required="required"/>
                <form:input type="password" path="password" name="password" placeholder="Nhập mật khẩu" minlength="5" maxlength="10" required="required"/>
                <form:input type="text" path="name" name="hoten" placeholder="Họ tên" required="required" maxlength="20"/>
                <form:input type="text" id="datepicker" path="dob" name="birthday" placeholder="Ngày sinh" required="required"/>
                <form:input type="text" path="phone" name="phone" placeholder="Số điện thoại" required="required" minlength="9" maxlength="15"/>
                <input type="submit" value="Đăng Ký"/>
            </form:form>
        </div>
        <script>
            $(function () {
                $.datepicker.setDefaults({
                    onClose: function (date, inst) {
                        $("#selectedDtaeVal").html(date);
                    }
                });
                $("#datepicker").datepicker();
            });
        </script>
    </body>
</html>
