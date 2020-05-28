<%-- 
    Document   : adminpanel
    Created on : Apr 21, 2020, 5:50:10 PM
    Author     : Adarsh
--%>

<%@page import="Entities.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Gorona|Admin Panel</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel='stylesheet' type='text/css' media='screen' href='css/style.css'>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src='js/script.js'></script>
    </head>
    <body ng-app="CovidApp" ng-controller="CovidCtrl">

        <%@include file="normalNavbar.jsp" %>

        <div class="jumbotron py-3">
            <div class="text-center">          <!--image-->
                <img src="img/MaskWoman.jpg" alt="Avatar" style="width:120px; height: 110px; border-radius: 50%;">
            </div> 
            <br/>

            <h1 class="text-center">{{title}}</h1>
            <br/>

            <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh;">      <!--vh(Viewport Height)-->
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 offset-md-4">

                            <div class="card">
                                <div class="card-header primary-background text-white text-center bg-dark">
                                    <span class="fa fa-user-circle fa-2x"></span>
                                    <br>
                                    <p>Login Here</p>                        
                                </div>
                                <%
                                    message m = (message) session.getAttribute("msg");
                                    if (m != null) {
                                %>
                                <div class="alert <%= m.getCssClass()%>" role="alert">
                                  <%= m.getContent() %>
                                </div>

                                <%
                                 session.removeAttribute("msg");
                                 }
                                %>

                                <div class="card-body">
                                    <form action="adminLogin" method="post">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">UserName</label>
                                            <input type="text" class="form-control" name="username" id="exampleInputEmail1" aria-describedby="emailHelp">
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your details with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>


    </body>
</html>
