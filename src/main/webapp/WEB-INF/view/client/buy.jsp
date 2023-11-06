<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="/resources/css/client/bootstrap.css" />

        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />

        <!-- font awesome style -->
        <link href="/resources/css/client/font-awesome.min.css" rel="stylesheet" />
        <link href="/resources/css/client/style.css" rel="stylesheet" />
        <link href="/resources/css/client/responsive.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>LapTopShop</title>
    </head>
    <body>
        <div class="hero_area">
            <header class="header_section long_section px-0">
                <nav class="navbar navbar-expand-lg custom_nav-container ">
                    <a class="navbar-brand">
                        <span>
                            LapTopShop
                        </span>
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="d-flex mx-auto flex-column flex-lg-row align-items-center">

                        </div>
                        <div class="quote_btn-container">
                            <a href="/login">
                                <span>
                                    Login
                                </span>
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </a>
                            <form class="form-inline">
                                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </nav>
            </header>
            <section class="furniture_section layout_padding">
                <div class="container-fluid">
                    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
                        <form:form action="#" commandName="product" method="POST" enctype="multipart/form-data">
                            <div class="form-group row mb-0">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="row">
                                            <label class="col-sm-3 col-form-label">Tên sản phẩm:</label>
                                            <div class="col-sm-9 my-2">
                                                ${product.name}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-3 col-form-label">Giá thành:</label>
                                            <div class="input-group col-sm-9 my-2">
                                                <input type="number" name="price" id="price"  value="${product.price}" readonly />
                                                <span class="input-group-text">VNĐ</span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-3 col-form-label">Số lượng:</label>
                                            <div class="input-group col-sm-9 my-2">
                                                <input type="number" path="quantity" id="quantity" value="quantity" min="1"  />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-3 col-form-label">Mô tả sản phẩm:</label>
                                            <div class="input-group col-sm-9 my-2">
                                                ${product.description}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-3 col-form-label">Tổng giá:</label>
                                            <div class="input-group col-sm-9 my-2">
                                                <span id="total-price">${product.price} VNĐ</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="preview text-center mb-2">
                                            <img class="img-thumbnail" src="<c:url value="${product.getFilePath()}"/>" id="file-ip-1-preview" width="200px" height="200px">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" >
                                    <input type="submit" class="btn btn-primary btn-col-3" value="Thanh toán" style="margin: 17% 259%;">
                                </div>
                            </div>
                        </form:form>
                    </main>
                </div>
            </section>
        </div>
        <script>
// Get references to the input elements and the total price element
            var quantityInput = document.getElementById("quantity");
            var priceInput = document.getElementById("price");
            var totalPriceElement = document.getElementById("total-price");

// Add an event listener to the quantity input
            quantityInput.addEventListener("input", function () {
                updateTotalPrice();
            });

            function updateTotalPrice() {
                var quantity = parseInt(quantityInput.value);
                var price = parseFloat(priceInput.value);
                var total = quantity * price;
                totalPriceElement.textContent = total + " VNĐ";
            }

// Initial update of the total price
            updateTotalPrice();
        </script>
    </body>
</html>
