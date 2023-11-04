<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang quản trị</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/index_style.css" type="text/css">
</head>
<style>
    table, th, td {
        border: 1px solid;
    }
</style>
<body style="background-color: #dddddd">
<div class="container">

    <div class="row" style="height: 5px;background-color: #ffffff"></div>
    <div class="row header">
        <div class="col-md-1" style="margin-left: -15px">
            <img src="/resources/img/logo.PNG" style="width: 100%;height: 100%">
        </div>
        <div class="col-md-3 text-end">
            <span>Xin chào: Nguyễn Văn A</span>
            <span>
                [
                <a href="/logout">Đăng xuất</a>
                ]
            </span>
        </div>
    </div>
    <div class="row" style="height: 5px; background-color: #ffffff"></div>
    <div class="row menu" style="padding: 10px; color: white;background-color: darkblue">
        Menu
    </div>
    <h2>Danh sách chi nhánh</h2>
    <table>
        <tr>
            <td>Mã Chi nhánh</td>
            <td>Tên Chi nhánh</td>
            <td>Địa chỉ</td>
        </tr>
        <c:forEach items="${branchs}" var="brand">
            <tr>
                <td>${brand.id}</td>
                <td>${brand.name}</td>
                <td>${brand.address}</td>
            </tr>
        </c:forEach>
    </table>
    <div class="row footer" style="text-align: center;background-color: #000033;color: white">
        <div class="col-md-12">
            Trung tâm code fresher <br>
            Địa chỉ: Số 104 Hoàng Ngân, Trung Hoà, Cầu Giấy, Hà Nội <br>
            Điện thoại: 096.577.6812
        </div>
    </div>
</div>

</body>
</html>