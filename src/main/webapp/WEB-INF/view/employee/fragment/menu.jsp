<%-- 
    Document   : menu
    Created on : Nov 4, 2023, 4:46:49 PM
    Author     : OS
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <body>
        <nav id="sidebarMenu"  class="d-md-block bg-light sidebar collapse pt-5 mt-5">
            <div class="position-relative">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="/employ" aria-current="page">
                            <i class="fas fa-home mr-2"></i>
                            Trang chủ
                        </a>
                    </li>
<!--                    
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-copyright mr-2"></i>
                            Chi nhánh
                        </a>
                    </li>
                    -->
                    <li class="nav-item">
                        <a class="nav-link" href="/employ/soldproduct">
                            <i class="fas fa-gifts mr-2"></i>
                            Kho hàng
                        </a>
                    </li>
<!--                    <li class="nav-item">
                        <a class="nav-link" href="/branch">
                            <i class="fas fa-sharp fa-light fa-cash-register mr-2"></i>
                            Nhân sự
                        </a>
                    </li>-->
                    <li class="nav-item">
                        <a class="nav-link" href="/client">
                            <i class="fas fa-user-tag mr-2"></i>
                            Khách hàng
                        </a>
                    </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/bill">
                            <i class="fas fa-calendar-times mr-2"></i>
                           Hóa đơn
                        </a>
                    </li>
<!--                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-chart-line mr-2"></i>
                            Thống kê
                        </a>
                    </li>-->
                </ul>
            </div>
        </nav>
    </body>
</html>
