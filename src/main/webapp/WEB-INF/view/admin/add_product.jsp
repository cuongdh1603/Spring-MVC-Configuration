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

                    <form:form action="/admin/save/product" commandName="product" method="POST" enctype="multipart/form-data">
                        <div class="form-group row mb-0">
                            <div class="row">
                                <div class="col-8">
                                    <c:if test="${errorName != null}">
                                        <p style="color: red">
                                            <c:out value="${'Tên sản phẩm bị trùng'}" />
                                        </p>
                                    </c:if>
                                    <div class="row">
                                        <label class="col-sm-3 col-form-label">Tên sản phẩm:</label>
                                        <div class="col-sm-9 my-2">
                                            <form:input path="name" id="name" maxlength="45" />

                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-3 col-form-label">Giá thành:</label>
                                        <div class="input-group col-sm-9 my-2">
                                            <form:input type="number" path="price" id="price" maxlength="8" />
                                            <span class="input-group-text">VNĐ</span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-3 col-form-label">Mô tả sản phẩm:</label>
                                        <div class="input-group col-sm-9 my-2">

                                            <form:textarea path="description" id="description" cols="40" rows="3" maxlength="250" />

                                        </div>
                                    </div>

                                </div>
                                <div class="col-4">
                                    <div class="preview text-center mb-2">
                                        <img class="img-thumbnail" id="file-ip-1-preview" width="200px" height="200px">
                                    </div>
                                    <div class="col-9">
                                        <form:input path="image" class="form-control form-control-sm" id="file-ip-1" type="file"
                                               accept="image/*" onchange="showPreview(event);"/>


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
            $("input[data-type='currency']").on({
//            $("#price").on({
                keyup: function () {
                    formatCurrency($(this));
                },
                blur: function () {
                    formatCurrency($(this), "blur");
                }
            });
            function formatNumber(n) {
                // format number 1000000 to 1,234,567
                return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }
            function formatCurrency(input, blur) {
                var input_val = input.val();
                if (input_val === "") {
                    return;
                }
                var original_len = input_val.length;
                var caret_pos = input.prop("selectionStart");
                if (input_val.indexOf(".") >= 0) {
                    var decimal_pos = input_val.indexOf(".");
                    // split number by decimal point
                    var left_side = input_val.substring(0, decimal_pos);
                    var right_side = input_val.substring(decimal_pos);
                    // add commas to left side of number
                    left_side = formatNumber(left_side);
                    // validate right side
                    right_side = formatNumber(right_side);
                    // On blur make sure 2 numbers after decimal
                } else {
                    input_val = formatNumber(input_val);
                    input_val = input_val;
                }
                // send updated string to input
                input.val(input_val);
                // put caret back in the right position
                var updated_len = input_val.length;
                caret_pos = updated_len - original_len + caret_pos;
                input[0].setSelectionRange(caret_pos, caret_pos);
            }
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
