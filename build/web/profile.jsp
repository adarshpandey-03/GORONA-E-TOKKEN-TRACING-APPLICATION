<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Servlets.permissionServlet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataAccessObject.permissionDetailsFetch"%>
<%@page import="DataAccessObject.User_Dao"%>
<%@page import="ConnectionPackage.dbms_Connection"%>
<%@page import="Entities.permissionForm_entities"%>
<%@page import="Entities.adminLogin_entities"%>
<%@page errorPage="error_page.jsp" %>

<%
    adminLogin_entities ad = (adminLogin_entities) session.getAttribute("currentUser");
    if (ad == null) {
        response.sendRedirect("adminpanel.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Admin | Profile</title>

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

        <!--Admin Navbar Start -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.html"><span><img src="img/GoronaLogo.png"></span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Live Update</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="precautions.jsp">Precautions</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Latest News</a>
                    </li>               

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Granted Permission
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="permissionForm.jsp">Ask for Permission</a>
                            <a class="dropdown-item" href="suggestionForm.jsp">Suggestions</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Emergency Permission</a>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" tabindex="-1" aria-disabled="true">
                            <span class="fa fa-user-circle" style="font-size: 20px; margin-right: 5px;"></span><%=ad.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet" tabindex="-1" aria-disabled="true">
                            <span class="fa"></span>Logout</a>
                    </li>             
                </ul>
            </div>
        </nav>
        <!--Admin Navbar Ends -->



        <div class="jumbotron py-3">
            <script lang="javascript">
                function statusUpdate(id){
                    var f = document.form;
                    f.method = "post";
                    f.action = "update.jsp?id="+id;
                    f.submit();
                }
                
                </script>
                <script lang="javascript">
                function statusUpdateNotAllowed(id){
                    var f = document.form;
                    f.method = "post";
                    f.action = "notallowedupdate.jsp?id="+id;
                    f.submit();
                }
                
                </script>
           <!-- <script>
                        $(document).ready(function () {
                            $("#allowedBtn").click(function () {
                                $("#status").html("Allowed").css("color", "green");
                            })
                            $("#notallowedBtn").click(function () {
                                $("#status").html("Not Allowed").css("color", "red");
                            })
                        })
            </script>-->

            <form id="updateForm" method="post" name="form">
                
                
            <%
                try { 
                /*     permissionDetailsFetch pdf = new permissionDetailsFetch(dbms_Connection.getConnection());
                 ArrayList<permissionForm_entities> list = pdf.getAllPermissionList();
                 for (permissionForm_entities c : list) {*/
                Connection con = dbms_Connection.getConnection();
                String query = "select * from permissiondetails";
                Statement stmt = con.createStatement();
                ResultSet set = stmt.executeQuery(query);

                while (set.next()) {
            %>

            <div class="card mt-4">
                <h5 class="card-header"><span style="font-weight: bold">PermissionID:- </span><%= set.getInt("PermissionID")%></h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h5 class="card-title">Reason</h5>
                            <p class="card-text"><%= set.getString("Reason")%></p>
                            <br/>

                        </div>

                        <div class="col-md-4">
                            <h5 class="card-title">Location to Go</h5>   
                            <p class="card-text"><%= set.getString("wentLocation")%></p>
                        </div>
                        <div class="col-md-2">
                            <h5 id="status"><%= set.getString("Status")%></h5>
                        </div>
                    </div>
                    <button id="allowedBtn" class="btn btn-success" name="update" value="Allowed" onclick="statusUpdate(<%=set.getInt("PermissionID")%>)">Allowed</button>
                    <button id="notallowedBtn" class="ml-2 btn btn-danger" name="updateNotAllowed" value="Not Allowed" onclick="statusUpdateNotAllowed(<%=set.getInt("PermissionID")%>)">Not Allowed</button>

                </div>
                <div class="card-footer text-muted">
                    <div class="row">
                        <div class="col-md-2"><span style="font-weight: bold">Name:- </span> <%= set.getString("FirstName")%> <%= set.getString("LastName")%></div>
                        <div class="col-md-6"><span style="font-weight: bold">Phone Number:- </span><%= set.getString("PhoneNumber")%></div>
                       

                    </div>
                </div>
            </div>
            <%
                }
            }
            catch(Exception e)
                    {
                    e.printStackTrace();
                    }
            %>

            </form> 
    </div>

            
<script>
                $(document).ready(function () {
                    console.log("loaded...")

                    $('#updateForm').on('submit', function (event) {     //On click submit button on registerForm event function call
                        event.preventDefault();         //this statement prevents register form to go on register servlet


                        let form = new FormData(this);      //this will collect all our form data 

                        //send form data to register servlet:

                        $.ajax({
                            url: "permissionServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data)
                                if (data.trim() === 'done')
                                {
                                    swal("Your Request is Submitted!", "You get response in 15 minutes through text-message", "success")
                                            .then((value) => {
                                                window.location = "index.jsp"
                                            });
                                } else
                                {
                                    swal(data)
                                }


                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR)
                                        .then((value) => {
                                            window.location = "error_page.jsp"
                                        });
                            },
                            processData: false,
                            contentType: false
                        })

                    })
                })
    </script>
       
</body>
</html>
