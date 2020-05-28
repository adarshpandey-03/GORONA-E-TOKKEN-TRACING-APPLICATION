<%-- 
    Document   : precautions
    Created on : Apr 15, 2020, 2:09:44 PM
    Author     : Adarsh
--%>

<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Covid-2019|Precautions</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel='stylesheet' type='text/css' media='screen' href='css/style.css'>


    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
    <script src='js/script.js'></script>
</head>
<body ng-app="CovidApp" ng-controller="CovidCtrl">

    <div class="container-fluid">

        <%@include file="normalNavbar.jsp" %>

        <div class="jumbotron py-3">
            <div class="text-center">          <!--image-->
                <img src="img/MaskWoman.jpg" alt="Avatar" style="width:120px; height: 110px; border-radius: 50%;">
            </div> 
            <br/>

            <h1 class="text-center">{{title}}</h1>

            <br/>
            <!--Start of all data-->
            <div class="text-center mt-3">

                <%
                    String url1 = "https://www.mygov.in/covid-19";
                    Document doc1 = Jsoup.connect(url1).get();

                    // #maincounter-wrap elements
                    Elements element1 = doc1.select(".about_corona");
                    out.print(element1);

                %>  

            </div>
            
            <!--Start of all data-->
            <div class="text-center mt-3">

                <%
                    String url2 = "https://m.timesofindia.com/india/coronavirus-symptoms-and-precautions/articleshow/74451114.cms";
                    Document doc2 = Jsoup.connect(url2).get();

                    //elements
                    Elements element2 = doc2.select(".id-r-component");
                    out.print(element2);

                %>  

            </div>
        </div>
    </div>
</body>
</html>
