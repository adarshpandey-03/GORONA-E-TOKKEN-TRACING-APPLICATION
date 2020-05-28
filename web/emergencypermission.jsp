<%-- 
    Document   : emergencypermission
    Created on : May 2, 2020, 9:06:42 AM
    Author     : Adarsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Emergency Permission</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel='stylesheet' type='text/css' media='screen' href='css/style.css'>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.0.js" integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src='js/script.js'></script>

    </head>
    <body ng-app="CovidApp" ng-controller="CovidCtrl">

        <div class="container-fluid">
            <%@include file="normalNavbar.jsp" %>
            <script>
                        $(document).ready(function () {
                            $('#openingModal').modal('show')

                        });
            </script>
            <div class="jumbotron py-3">

                <div class="text-center">          <!--image-->
                    <img src="img/MaskWoman.jpg" alt="Avatar" style="width:120px; height: 110px; border-radius: 50%;">
                </div> 
                <br/>
                <h1 class="text-center">{{title}}</h1>

                <div id="openingModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">EMERGENCY PRIORITY</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div align="center"><img src="img/technology.png" style="height: 100px; width: 100px;"></div>
                                <hr>
                                <br/>
                                <ul>
                                    <li>Your are allowed to use this permission only when you have medical or any other emergency.</li>
                                    <li>You only need to add your phone number and Name then click on either button.</li>
                                    <li>You automatically get an E-Tokken without any further process.</li>
                                    <li>This E-Tokken Consist of Tokken ID and Permission.</li>                                        
                                </ul>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#formModal" data-dismiss="modal" data-whatever="@mdo">Understood</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Form Modal-->
                <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Emergency Permission Form</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form id="emergencyForm" action="emergencyServlet" method="post">
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Phone Number:</label>
                                        <input type="text" name="phoneNumber" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Adhaar Number:</label>
                                        <input type="text" name="adhaarNumber" class="form-control" id="recipient-name">
                                    </div>

                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Emergency Type:</label><br/><br/>
                                        <input type="radio" id="gender" name="emergency" value="Medical">Medical Emergency &nbsp;&nbsp;
                                        <input type="radio" id="gender" name="emergency" value="Other">Other Emergency                                
                                    </div>


                                    <!-- <div class="form-group">
                                         <label for="message-text" class="col-form-label">Message:</label>
                                         <textarea class="form-control" id="message-text"></textarea>
                                     </div>-->

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <br/>


            </div>
        </div>



        <script>
                    $(document).ready(function () {
                        console.log("loaded...")

                        $('#emergencyForm').on('submit', function (event) {     //On click submit button on registerForm event function call
                            event.preventDefault();         //this statement prevents register form to go on register servlet


                            let form = new FormData(this);      //this will collect all our form data 

                            //send form data to register servlet:

                            $.ajax({
                                url: "emergencyServlet",
                                type: 'POST',
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                    console.log(data)
                                    if (data.trim() === 'done')
                                    {
                                        swal("Your Request is Submitted!", "You get a E-Tokken via text-message", "success")
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
