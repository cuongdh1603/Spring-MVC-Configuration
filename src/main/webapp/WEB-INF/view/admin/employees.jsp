<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Danh sách nhân viên</title>


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
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Danh sách nhân viên</h1>
                    </div>
                    <a class="btn btn-primary mb-2" href="/branch/${branchId}/emp/add">
                        Thêm nhân viên
                    </a>
                    <!--DEMO BANG DATA TABLE-->
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Mã nhân viên</th>
                                <th>Họ tên</th>
                                <th>Ngày sinh</th>
                                <th>Số điện thoại</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="em" items="${employees}" varStatus="counter">
                                <tr>
                                    <td>
                                        <c:out value="${counter.count}"/>
                                    </td>
                                    <td>
                                        <c:out value="${em.id}"/>
                                    </td>
                                    <td>
                                        <c:out value="${em.name}"/>
                                    </td>
                                    <td>
                                        <%--<c:out value="${em.dob}"/>--%>
                                        <p>
                                            <fmt:formatDate pattern = "dd/MM/yyyy" value = "${em.dob}" />
                                        </p>
                                    </td>
                                    <td>
                                        <c:out value="${em.phone}"/>
                                    </td>

                                    <td>
                                        <a type="button" class="btn btn-primary btn-sm" href="#">
                                            <i class="fas fa-info-circle mx-2"></i>
                                        </a>
                                        <a type="button" class="btn btn-success btn-sm" href="">
                                            <i class="fas fa-edit mx-2"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </main>
            </div>
        </div>
        <%@include file="fragment/footer.jsp" %>
        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    columnDefs: [
                        {orderable: false, targets: 0},
                        {orderable: false, targets: 1},
                        {orderable: false, targets: 2},
                        {orderable: false, targets: 6}
                    ]
                })
            });
        </script>
    </body>
</html>
