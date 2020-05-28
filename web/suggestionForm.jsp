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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

            <form action="suggestionServlet" method="post">
                <div class="form-row">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <select id="inputState inputGroupPrepend3" class="form-control input-group-text" name="salutation" required>
                                    <option selected>Mr.</option>
                                    <option>Ms.</option>
                                    <option>Dr.</option>
                                    <option>Prof.</option>
                                </select>
                            </div>
                            <input type="text" class="form-control is-invalid" id="validationText" required  name="firstName" placeholder="First name">
                            <div class="invalid-feedback">
                                Please Enter Your First Name
                            </div>
                        </div>
                    </div>
                    <div class="col was-validated">
                        <input type="text" class="form-control is-invalid" id="validationText" required name="lastName" placeholder="Last name">
                    </div>
                    <div class="invalid-feedback">
                        Please Enter Your Last Name
                    </div>
                </div>               

                <div class="form-row was-validated">
                    <div class="form-group col">
                        <label for="inputEmail4">Email</label>
                        <input type="email" class="form-control is-invalid" id="validationEmail" name="emailID" placeholder="Email ID" required>
                    </div>
                    <div class="col mb-3 was-validated">
                        <label for="validationServerUsername">Phone Number</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend3">+91</span>
                            </div>
                            <input type="text" class="form-control is-invalid" id="validationServerUsername" name="phoneNumber" aria-describedby="inputGroupPrepend3" required>
                            <div class="invalid-feedback">
                                Please Enter Your Phone Number.
                            </div>
                        </div>
                    </div>
                </div>  
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputState">Qualification</label>
                        <select id="inputState" name="qualification" class="form-control" required>
                            <option selected>Your Qualification...</option>
                            <option>School Student</option>
                            <option>College Student</option>
                            <option>Graduate</option>
                            <option>Doctorate</option>
                            <option>Researcher</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Address</label>
                    <input type="text" class="form-control is-invalid" name="address" id="inputAddress validationText"  placeholder="Complete Address" required>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6 was-validated">
                        <label for="inputCity">City</label>
                        <input type="text" class="form-control is-invalid" name="city" id="inputCity validationText" required="">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="inputState">State</label>
                        <select id="inputState" class="form-control" required>
                            <option selected>Choose State...</option>
                            <option>Rajasthan</option>
                            <option>Uttar Pradesh</option>
                            <option>Maharashtra</option>
                            <option>Madhya Pradesh</option>
                            <option>Tamil Nadu</option>
                            <option>Kerala</option>
                            <option>Punjab</option>
                        </select>
                    </div>                    
                </div>
                <div class="mb-4 was-validated">
                    <label for="validationTextarea">Suggestion Description</label>
                    <textarea class="form-control is-invalid" name="suggestion" id="validationTextarea" placeholder="Briefly describe your suggestion." required></textarea>
                    <div class="invalid-feedback">
                        Your Valid Suggestion
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-group col-md-4 mb-3">
                        <label for="avatar">Upload Documentation</label>
                        <input type="file" id="avatar" name="document" accept="pdf, doc" required="You have to upload document">
                    </div>
                    <div class="input-group col-md-4 mb-3">
                        <label for="avatar">Upload Image (if any)</label>
                        <input type="file" id="avatar" name="image" accept="jpeg, png">
                    </div>
                    <div class="input-group col-md-4 mb-3">
                        <label for="avatar">Upload Video (if any)</label>
                        <input type="file" id="avatar" name="video" accept="mp4">
                    </div>
                </div>


                <div class="form-group was-validated">
                    <div class="form-check custom-control custom-checkbox">
                        <input class="form-check-input custom-control-input" name="checkbox" type="checkbox" id="gridCheck customControlValidation1" required="Please accept terms & condition">
                        <label class="form-check-label custom-control-label" for="gridCheck customControlValidation1">
                            Agree with Terms & Conditions
                        </label>
                    </div>
                </div>

                <button id="sendRequest" type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>

    <script>
                $(document).ready(function () {
                    $("#sendRequest").click(function () {
                        swal("Your Request is Submitted!", "You get response in atmost 1 hour.", "success");
                    })
                })
    </script>
</body>
</html>
