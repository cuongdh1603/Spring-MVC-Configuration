<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Thêm mới sản phẩm</title>


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
        
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
                    <div
                        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Thông tin nhãn hàng mới</h1>
                    </div>

                    <form:form action="/branch/${branchId}/emp/save" commandName="employee" method="POST">
                        <div class="form-group row mb-0">
                            <div class="row">
                                <div class="col-12">
                                    <c:if test="${usernameError != null}">
                                        <p style="color: red">
                                            <c:out value="${'Tên đăng nhập bị trùng'}" />
                                        </p>
                                    </c:if>
                                    <c:if test="${phoneError != null}">
                                        <p style="color: red">
                                            <c:out value="${'Số điện thoại bị trùng'}" />
                                        </p>
                                    </c:if>
                                    
                                    <div class="row">
                                        <label class="col-sm-3 col-form-label">Tên nhân viên:</label>
                                        <div class="col-sm-9 my-2">
                                            <form:input path="name" id="name" maxlength="45" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-3 col-form-label">Ngày sinh:</label>
                                        <div class="input-group col-sm-9 my-2">
                                            <form:input id="datepicker" path="dob" name="birthday" placeholder="Ngày sinh" required="required"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-3 col-form-label">Số điện thoại:</label>
                                        <div class="input-group col-sm-9 my-2">

                                            <form:input type="text" path="phone" name="phone" placeholder="Số điện thoại" required="required" minlength="9" maxlength="15"/>

                                        </div>
                                    </div>
                                            
                                    <div class="row">
                                        <label class="col-sm-3 col-form-label">Tên đăng nhập:</label>
                                        <div class="input-group col-sm-9 my-2">

                                            <form:input type="text" path="username" name="username" placeholder="Nhập tên đăng ký" minlength="2" maxlength="10" required="required"/>

                                        </div>
                                    </div>
                                            
                                    <div class="row">
                                        <label class="col-sm-3 col-form-label">Mật khẩu:</label>
                                        <div class="input-group col-sm-9 my-2">

                                            <form:input type="password" path="password" name="password" placeholder="Nhập mật khẩu" minlength="5" maxlength="10" required="required"/>

                                        </div>
                                    </div>

                                </div>
                                

                                <div class="row">
                                    <div class="col-3"></div>
                                    <div class="col-6">
                                        <input type="submit" class="btn btn-primary btn-col-3" value="Thêm sản phẩm">
                                        <a class="btn btn-danger btn-col-3" th:href="@{/items}">Hủy</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>

                </main>
            </div>
        </div>
        <%@include file="fragment/footer.jsp" %>
        <script type="text/javascript">
            $(function () {
                $.datepicker.setDefaults({
                    onClose: function (date, inst) {
                        $("#selectedDtaeVal").html(date);
                    }
                });
                $("#datepicker").datepicker();
            });
            function showPreview(event) {
                if (event.target.files.length > 0) {
                    var src = URL.createObjectURL(event.target.files[0]);
                    var preview = document.getElementById("file-ip-1-preview");

                    preview.src = src;
                    preview.style.display = "block";
                }
            }
        </script>
    </body>
</html>
