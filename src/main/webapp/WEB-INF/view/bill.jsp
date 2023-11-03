<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hóa đơn</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/index_style.css" type="text/css">
</head>
<body style="background-color: #dddddd">
<div class="container">
    <div class="row menu" style="padding: 10px; color: white;background-color: darkblue">
        Menu
    </div>
    <h2>Danh sách đơn hàng</h2>
    <table>
        <tr>
            <td>Số lượng</td><td>Tên sản phẩm</td><td>Tên người mua</td><td>Ngày mua</td><td></td>
        </tr>
        <c:forEach items="${bills}" var="bill">
            <tr>
                <td>${bill.quantity}</td>
                <td>${bill.soldProduct.product.name}</td>
                <td>${bill.client.name}</td>
                <td>${bill.createDate}</td>
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
