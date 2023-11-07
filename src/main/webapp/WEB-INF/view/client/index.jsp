
<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
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
    </head>

    <body>

        <div class="hero_area">
            <!-- header section strats -->
            <header class="header_section long_section px-0">
                <nav class="navbar navbar-expand-lg custom_nav-container ">
                    <a class="navbar-brand" href="index.html">
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
                             <c:if test="${loggedClient.username == null}">
                                <a id="loginLink" href="/login">
                                <span>
                                    Login
                                </span>
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </a>
                           </c:if>  
                      
   <c:if test="${loggedClient.username != null}">
                            <a>
                                Xin chào :
                                <span>
                                    ${username}
                                </span> 
                            </a>
                            <a href="/logout">
                                <span>
                                    Đăng xuất
                                </span>
                            </a>
   </c:if>
                            <form class="form-inline">
                                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </nav>
            </header>
            <!-- end header section -->
            <!-- slider section -->
            <section class="slider_section long_section">
                <div id="customCarousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="detail-box">
                                            <h1>
                                                For All Your <br>
                                                Furniture Needs
                                            </h1>
                                            <p>
                                                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus quidem maiores perspiciatis, illo maxime voluptatem a itaque suscipit.
                                            </p>
                                            <div class="btn-box">
                                                <a href="" class="btn1">
                                                    Contact Us
                                                </a>
                                                <a href="" class="btn2">
                                                    About Us
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="img-box">
                                            <img src="/resources/img/slider-img.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="detail-box">
                                            <h1>
                                                For All Your <br>
                                                Furniture Needs
                                            </h1>
                                            <p>
                                                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus quidem maiores perspiciatis, illo maxime voluptatem a itaque suscipit.
                                            </p>
                                            <div class="btn-box">
                                                <a href="" class="btn1">
                                                    Contact Us
                                                </a>
                                                <a href="" class="btn2">
                                                    About Us
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="img-box">
                                            <img src="/resources/img/slider-img.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="detail-box">
                                            <h1>
                                                For All Your <br>
                                                Furniture Needs
                                            </h1>
                                            <p>
                                                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus quidem maiores perspiciatis, illo maxime voluptatem a itaque suscipit.
                                            </p>
                                            <div class="btn-box">
                                                <a href="" class="btn1">
                                                    Contact Us
                                                </a>
                                                <a href="" class="btn2">
                                                    About Us
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="img-box">
                                            <img src="/resources/img/slider-img.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ol class="carousel-indicators">
                        <li data-target="#customCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#customCarousel" data-slide-to="1"></li>
                        <li data-target="#customCarousel" data-slide-to="2"></li>
                    </ol>
                </div>
            </section>
            <!-- end slider section -->
        </div>

        <!-- furniture section -->

        <section class="furniture_section layout_padding">
            <div class="container">
                <div class="heading_container">
                    <h2>
                        Our Furniture
                    </h2>
                    <p>
                        which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't an
                    </p>
                </div>
                <div class="row">
                    <c:forEach var="soldproducts" items="${soldproducts}">
                        <div class="col-md-6 col-lg-4">
                            <div class="box">
                                <div class="img-box">
                                    <img src="<c:url value='${soldproducts.product.getImagePath()}'/>">
                                </div>
                                <div class="detail-box">
                                    <h5>${soldproducts.product.name}</h5>
                                    <div class="price_box">
                                        <h6 class="price_heading">
                                            ${soldproducts.product.price} <span>đ</span>
                                        </h6>
                                        <a href="/buy/${soldproducts.id}">
                                            Buy Now
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
        </section>

        <section class="about_section layout_padding long_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="img-box">
                            <img src="/resources/img/about-img.png" alt="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="detail-box">
                            <div class="heading_container">
                                <h2>
                                    About Us
                                </h2>
                            </div>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti dolorem eum consequuntur ipsam repellat dolor soluta aliquid laborum, eius odit consectetur vel quasi in quidem, eveniet ab est corporis tempore.
                            </p>
                            <a href="">
                                Read More
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="client_section layout_padding-bottom">
            <div class="container">
                <div class="heading_container">
                    <h2>
                        Testimonial
                    </h2>
                </div>
                <div id="carouselExample2Controls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <div class="col-md-11 col-lg-10 mx-auto">
                                    <div class="box">
                                        <div class="img-box">
                                            <img src="/resources/img/client.jpg" alt="" />
                                        </div>
                                        <div class="detail-box">
                                            <div class="name">
                                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                                <h6>
                                                    Siaalya
                                                </h6>
                                            </div>
                                            <p>
                                                It is a long established fact that a reader will be
                                                distracted by the readable cIt is a long established fact
                                                that a reader will be distracted by the readable c
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-md-11 col-lg-10 mx-auto">
                                    <div class="box">
                                        <div class="img-box">
                                            <img src="/resources/img/client.jpg" alt="" />
                                        </div>
                                        <div class="detail-box">
                                            <div class="name">
                                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                                <h6>
                                                    Siaalya
                                                </h6>
                                            </div>
                                            <p>
                                                It is a long established fact that a reader will be
                                                distracted by the readable cIt is a long established fact
                                                that a reader will be distracted by the readable c
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-md-11 col-lg-10 mx-auto">
                                    <div class="box">
                                        <div class="img-box">
                                            <img src="/resources/img/client.jpg" alt="" />
                                        </div>
                                        <div class="detail-box">
                                            <div class="name">
                                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                                <h6>
                                                    Siaalya
                                                </h6>
                                            </div>
                                            <p>
                                                It is a long established fact that a reader will be
                                                distracted by the readable cIt is a long established fact
                                                that a reader will be distracted by the readable c
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel_btn-container">
                        <a class="carousel-control-prev" href="#carouselExample2Controls" role="button" data-slide="prev">
                            <i class="fa fa-long-arrow-left" aria-hidden="true"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExample2Controls" role="button" data-slide="next">
                            <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!-- end client section -->

        <!-- contact section -->
        <section class="contact_section  long_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form_container">
                            <div class="heading_container">
                                <h2>
                                    Contact Us
                                </h2>
                            </div>
                            <form action="">
                                <div>
                                    <input type="text" placeholder="Your Name" />
                                </div>
                                <div>
                                    <input type="text" placeholder="Phone Number" />
                                </div>
                                <div>
                                    <input type="email" placeholder="Email" />
                                </div>
                                <div>
                                    <input type="text" class="message-box" placeholder="Message" />
                                </div>
                                <div class="btn_box">
                                    <button>
                                        SEND
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="map_container">
                            <div class="map">
                                <div id="googleMap"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end contact section -->

        <!-- info section -->
        <section class="info_section long_section">

            <div class="container">
                <div class="contact_nav">
                    <a href="">
                        <i class="fa fa-phone" aria-hidden="true"></i>
                        <span>
                            Call : +01 123455678990
                        </span>
                    </a>
                    <a href="">
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                        <span>
                            Email : demo@gmail.com
                        </span>
                    </a>
                    <a href="">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <span>
                            Location
                        </span>
                    </a>
                </div>

                <div class="info_top ">
                    <div class="row ">
                        <div class="col-sm-6 col-md-4 col-lg-3">
                            <div class="info_links">
                                <h4>
                                    QUICK LINKS
                                </h4>
                                <div class="info_links_menu">
                                    <a class="" href="index.html">Home <span class="sr-only">(current)</span></a>
                                    <a class="" href="about.html"> About</a>
                                    <a class="" href="furniture.html">Furniture</a>
                                    <a class="" href="blog.html">Blog</a>
                                    <a class="" href="contact.html">Contact Us</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 mx-auto">
                            <div class="info_post">
                                <h5>
                                    INSTAGRAM FEEDS
                                </h5>
                                <div class="post_box">
                                    <div class="img-box">
                                        <img src="/resources/img/f1.png" alt="">
                                    </div>
                                    <div class="img-box">
                                        <img src="/resources/img/f2.png" alt="">
                                    </div>
                                    <div class="img-box">
                                        <img src="/resources/img/f3.png" alt="">
                                    </div>
                                    <div class="img-box">
                                        <img src="/resources/img/f4.png" alt="">
                                    </div>
                                    <div class="img-box">
                                        <img src="/resources/img/f5.png" alt="">
                                    </div>
                                    <div class="img-box">
                                        <img src="/resources/img/f6.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="info_form">
                                <h4>
                                    SIGN UP TO OUR NEWSLETTER
                                </h4>
                                <form action="">
                                    <input type="text" placeholder="Enter Your Email" />
                                    <button type="submit">
                                        Subscribe
                                    </button>
                                </form>
                                <div class="social_box">
                                    <a href="">
                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                    </a>
                                    <a href="">
                                        <i class="fa fa-twitter" aria-hidden="true"></i>
                                    </a>
                                    <a href="">
                                        <i class="fa fa-linkedin" aria-hidden="true"></i>
                                    </a>
                                    <a href="">
                                        <i class="fa fa-instagram" aria-hidden="true"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end info_section -->


        <!-- footer section -->
        <footer class="footer_section">
            <div class="container">
                <p>
                    &copy; <span id="displayYear"></span> All Rights Reserved By
                    <a href="https://html.design/">Free Html Templates</a>
                    Distribution <a href="https://themewagon.com">ThemeWagon</a>
                </p>
            </div>
        </footer>
        <!-- footer section -->
        <script src="/resources/js/jquery-3.4.1.min.js"></script>
        <!-- bootstrap js -->
        <script src="/resources/js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="/resources/js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
    </body>

</html>