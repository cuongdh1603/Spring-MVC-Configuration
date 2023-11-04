<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Trang chủ quản lý</title>
        <!--<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">-->
        <!--<link rel="stylesheet" href="/resources/css/index_style.css" type="text/css">-->

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
                <main layout:fragment="content" class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
                    <div
                        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Trang chủ</h1>
                    </div>
                    <h1>FPT Shop tặng gói truyền hình hấp dẫn khi mua Tivi Samsung</h1>
                    <p>
                        Theo đó, từ ngày 01/11 - 31/12/2023, khi khách hàng chọn mua các dòng tivi Samsung tại FPT Shop sẽ được tặng thêm ứng dụng giải trí phong phú với đa dạng gói ứng dụng giải trí như: VieOn, FPT Play, TV 360, Clip TV, Apple TV...

                    </p>
                    <div>
                        <img src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/165305/Originals/TIVI%20SAMSUNG.jpg" alt="mdo"
                         width="800" height="460">
                    </div>
                    <div>
                        <i>Từ tháng 11/2023, FPT Shop tặng gói truyền hình cho khách hàng khi mua tivi Samsung.</i>
                    </div>
                    
                    <br>
                    <div id="Content">
                        <p>
                            Sau một thời gian dài xuất hiện dưới dạng tin đồn và hình ảnh rò rỉ, OPPO Find X6 đã được giới thiệu đến
                            người dùng với ngoại hình cực kỳ độc đáo. Về mặt tổng thể, OPPO Find X6 sở hữu mặt lưng được hoàn thiện
                            từ chất liệu kính (bóng hoặc nhám) đi kèm với ba phiên bản màu sắc cực trẻ trung là Vàng, Xanh rêu và
                            Đen.
                        </p>
                        <p>
                            Bên cạnh đó, OPPO Find X6 vẫn giữ nguyên ngôn ngữ thiết kế đặc trưng của dòng OPPO Find X với mặt lưng
                            và các cạnh được làm bo cong mềm mại, kết hợp cùng phần khung viền được hoàn thiện từ chất liệu kim
                            loại. Kiểu thiết kế này không chỉ giúp cho OPPO Find X6 trở nên bền bỉ mà còn giúp cho người dùng có thể
                            sử dụng thiết bị với cảm giác cầm nắm thoải mái hơn.
                        </p>
                        <p>
                            Đặc biệt, OPPO Find X6 sở hữu cụm camera lớn được đặt ở nửa trên của mặt lưng tương tự như Xiaomi 12S
                            Ultra đã từng làm. Kể từ lần đầu tiên hợp tác với Hasselblad trên thế hệ tiền nhiệm OPPO Find X5, nhà
                            sản xuất OPPO đã có những ý tưởng thiết kế táo bạo cho phần camera trên sản phẩm của hãng. Điều này là
                            một minh chứng khẳng định rằng OPPO Find X6 cũng như các thế hệ Find X sau này sẽ mang đến cho người
                            dùng trải nghiệm chụp ảnh tối ưu và thuận theo triết lý 'OPPO - Camera phone' mà OPPO đang hướng tới.
                        </p>
                    </div>
                </main>
            </div>
        </div>
        <%@include file="fragment/footer.jsp" %>
    </body>
</html>
