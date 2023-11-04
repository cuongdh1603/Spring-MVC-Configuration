<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
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
    <div class="row menu" style="padding: 10px; color: white;background-color: darkblue">
        Menu
    </div>
    <h2>Danh sách Khách hàng</h2>
    <table>
        <tr>
            <td>Họ tên</td>
            <td>Ngày sinh</td>
            <td>Số điện thoại</td>
            <td>Tài khoản</td>
            <td></td>
        </tr>
        <c:forEach items="${clients}" var="client">
            <tr>
                <td>${client.name}</td>
                <td >${client.dob}</td>
                <td>${client.phone}</td>
                <td>${client.username}</td>
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
