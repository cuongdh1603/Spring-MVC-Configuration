<%-- 
    Document   : SUSSESS.jsp
    Created on : Nov 7, 2023, 3:08:52 PM
    Author     : thanh
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <link rel="icon" href="/resources/img/logolap.png" type="image/gif" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>LapTopShop</title>
        <link rel="stylesheet" type="text/css" href="/resources/css/client/bootstrap.css" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
        <link href="/resources/css/client/font-awesome.min.css" rel="stylesheet" />
        <link href="/resources/css/client/style.css" rel="stylesheet" />
        <link href="/resources/css/client/responsive.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <section class="client_section layout_padding-bottom" >
            <div class="container">
                <div class="heading_container" style="margin: 4%">
                    <h2>
                        Thanh toán thành công  <i class="fa fa-check-circle" aria-hidden="true" style="color: #198754"></i>
                    </h2>
                </div>
                <div id="carouselExample2Controls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <div class="col-md-11 col-lg-10 mx-auto">
                                    <div class="box">

                                        <div class="detail-box">
                                            <div class="name" >
                                                <h6 >
                                                    Thông tin đơn hàng
                                                </h6>
                                            </div>
                                            <p>
                                                Mã đơn hàng : ${bill.id}
                                            </p>
                                            <p >
                                                Ngày Mua hàng:
                                                 <fmt:formatDate pattern = "dd/MM/yyyy" value="${bill.createDate}"/>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel_btn-container">
                                <a href="/user">
                                         <button type="button" class="btn btn-success">Quay về trang chủ</button>   
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
