<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/index_style.css" type="text/css">
</head>
<body style="background-color: #dddddd">
<div class="container">
	
    <div class="row" style="height: 5px;background-color: #ffffff"></div>
    <div class="row header">
        <div class="col-md-1" style="margin-left: -15px">
            <img src="/resources/img/logo.PNG" style="width: 100%;height: 100%">
        </div>
        <p>Now: ${date}</p>
        <div class="col-md-8 vertical-center-item">
            <h2 class="align-middle">HỆ THỐNG QUẢN LÝ SINH VIÊN</h2>
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
    <c:forEach items="${branchs}" var="pr" varStatus="counter">
    	<div style="color: red"> 
    		<c:out value="count : ${counter.count}"></c:out> 
    	</div>
    	<div>
    		<c:out value="${pr.id}"></c:out>
    	</div>
    	<div>
    		<c:out value="${pr.name}"></c:out>
    	</div>
    	<div>
    		<c:out value="${pr.dob}"></c:out>
    	</div>
    	<div>
    		<c:out value="${pr.branch.address}"></c:out>
    	</div>
    	<br/>
    </c:forEach>
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