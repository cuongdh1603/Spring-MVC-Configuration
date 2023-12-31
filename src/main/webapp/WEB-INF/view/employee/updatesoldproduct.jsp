<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <!-- Bootstrap core CSS -->
        <link href="/resources/css/admin/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="/resources/css/admin/dashboard.css" rel="stylesheet">
        <!--Table-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
        <link href="/resources/css/admin/dataTables.bootstrap4.min.css" rel="stylesheet">
        <script src="/resources/js/jquery-3.5.1.js"></script>
        <script src="/resources/js/jquery.dataTables.min.js"></script>
        <script src="/resources/js/dataTables.bootstrap4.min.js"></script>
        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png" sizes="180x180">
        <script src="/resources/js/bootstrap.bundle.min.js"></script>
        <meta name="theme-color" content="#7952b3">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }
            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
            .nav-link:hover{
                color: #0a53be;
            }
        </style>

    </head>
    <body>
        <%@include file="fragment/header.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-auto">
                    <%@include file="fragment/menu.jsp" %> 
                </div>
            </div>
        </div>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
            <div
                class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Cập nhật số lượng sản phẩm chi nhánh</h1>
            </div>
            <form:form action="/employ/${productId}/updateqt" commandName="soldproduct" method="POST" enctype="multipart/form-data">
                <div class="form-group row mb-0">
                    <div class="row">
                        <div class="col-8">
                            <div class="row">
                                <label class="col-sm-3 col-form-label">Mã sản phẩm:</label>
                                <div class="col-sm-9 my-2">
                                    <form:hidden path="id" />
                                    <c:out value="${soldproduct.id}" />
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-3 col-form-label">Tên sản phẩm:</label>
                                <div class="col-sm-9 my-2">
                                    ${soldproduct.product.name}
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-3 col-form-label">Giá thành:</label>
                                <div class="input-group col-sm-9 my-2">
                                    ${soldproduct.product.price} VNĐ
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-3 col-form-label">Số lượng:</label>
                                <div class="input-group col-sm-9 my-2">
                                    <form:input  type="number" path="quantity" id="quantity" width="100%" min="1" maxlength="45" required="required" />
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-3 col-form-label">Mô tả sản phẩm:</label>
                                <div class="input-group col-sm-9 my-2">
                                    ${soldproduct.product.description}
                                </div>
                            </div>

                        </div>
                        <div class="col-4">
                            <div class="preview text-center mb-2">
                                <img class="img-thumbnail" src="<c:url value="${soldproduct.product.getImagePath()}"/>" id="file-ip-1-preview" width="400px" height="400px">
                            </div>                    
                        </div>

                        <div class="row">
                            <div class="col-3"></div>
                            <div class="col-6">
                                <input type="submit" class="btn btn-primary btn-col-3" value="Cập nhật số lượng" onclick="myFunction()" >
                                <a class="btn btn-danger btn-col-3" th:href="@{/items}">Hủy</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </main>
        <script>
            function myFunction() {
                alert("Cập nhật số lượng thành công !");
            }
        </script>
    </body>
</html>
