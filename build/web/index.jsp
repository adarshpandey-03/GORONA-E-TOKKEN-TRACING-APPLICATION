<%-- 
    Document   : index
    Created on : Apr 15, 2020, 12:43:46 PM
    Author     : Adarsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Corona Update</title>
    
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
            <p class="pt-3">Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.</p>
            <p class="pt-3">Most people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment.  Older people, and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness.</p>
            <p class="pt-3">The best way to prevent and slow down transmission is be well informed about the COVID-19 virus, the disease it causes and how it spreads. Protect yourself and others from infection by washing your hands or using an alcohol based rub frequently and not touching your face. </p>
            <p class="pt-3">The COVID-19 virus spreads primarily through droplets of saliva or discharge from the nose when an infected person coughs or sneezes, so it’s important that you also practice respiratory etiquette (for example, by coughing into a flexed elbow).</p>                
            <p class="pt-3">At this time, there are no specific vaccines or treatments for COVID-19. However, there are many ongoing clinical trials evaluating potential treatments. WHO will continue to provide updated information as soon as clinical findings become available.</p>            
           
           <br/>
            <!--Start of all data-->
            <div class="row text-center mt-3">
                <div class="col-md-4 mt-2">
                    <div class="card bg-warning text-white">
                        <div class="card-body">
                            <h3>Confirmed Cases</h3>
                            <h3>{{all_data.confirmed.value}}</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-2">
                    <div class="card bg-success text-white">
                        <div class="card-body">
                            <h3>Recovered Cases</h3>
                            <h3>{{all_data.recovered.value}}</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-2">
                    <div class="card bg-danger text-white">
                        <div class="card-body">
                            <h3>Death Cases</h3>
                            <h3>{{all_data.deaths.value}}</h3>
                        </div>
                    </div>
                </div>
            </div>
        <!--End of all data-->

        <input type="text" class="form-control mt-5" placeholder="Enter Country Here" 
        ng-model="c"
        ng-change="get_c_data()"
        />
        

        <!--c data-->
        <div class="container-fluid">
        <h1 class="text-center mt-3 text-uppercase">{{c}} status</h1>
        <div class="row text-center mt-4" ng-if="c_data">
            <div class="col-md-4 mt-2">
                <div class="card bg-warning text-white">
                    <div class="card-body">
                        <h3>Confirmed Cases</h3>
                        <h3>{{c_data.confirmed.value}}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mt-2">
                <div class="card bg-success text-white">
                    <div class="card-body">
                        <h3>Recovered Cases</h3>
                        <h3>{{c_data.recovered.value}}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mt-2">
                <div class="card bg-danger text-white">
                    <div class="card-body">
                        <h3>Death Cases</h3>
                        <h3>{{c_data.deaths.value}}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
    </div>    
</body>
</html>