<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
    <div class="container-lg my-5 mx-5 shadow-lg">
        <div class="row justify-content-center">
            <div class="col col-md-6 ">
                <h2 style="color: steelblue">Lorem ipsum dolor amet consectetur elit.</h2>
                <h4 style="color: lawngreen">Sit laborum ab, eius fugit doloribus </h4>
                <p style="color: silver">Nulla, placeat. Voluptatem quaerat non architecto ab laudantium
                    modi minima sunt esse temporibus sint culpa, recusandae aliquam numquam
                    totam ratione voluptas quod exercitationem fuga. Possimus quis earum veniam
                    quasi aliquam eligendi, placeat qui corporis!
                </p>
            </div>

        </div>
        <div class="row justify-content-center">
            <div class="col col-md-3 text-light" style=";background-color: #25cff2">
                <h3>Monthly voluptates</h3>
                <p><span style="font-size: 28px">$29</span> per month</p>
                <p>Nulla, placeat. Voluptatem quaerat non architecto ab</p>
                <button class="btn btn-success mx-1">Sign Up</button>
            </div>
            <div class="col col-md-3">

            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    function login(){
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        if(email===''){
            return;
        }else if(password===''){
            return;
        }
        //todo: call back-end login;
        window.href = "require.html";
    }
</script>
</html>