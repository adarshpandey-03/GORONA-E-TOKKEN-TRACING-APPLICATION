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
            <br/><br/>

            <div class="form-group text-center">
                <div class="form-check">
                    <h2>Have you filled up Form in the last 3 days ?</h2>
                    <button id="yesButton" class="btn btn-primary">Yes</button> <button id="noButton" class="btn btn-primary">No</button>
                </div>
            </div>


            <form id="permissionForm" action="permissionServlet" method="post">
                <div class="form-row was-validated mb-3">
                    <div class="col">
                        <input type="text" class="form-control is-invalid" id="validationText" name="firstName" required placeholder="First name">
                        
                    </div>
                    <div class="col was-validated">
                        <input type="text" class="form-control is-invalid" id="validationText" name="lastName" required placeholder="Last name">
                    </div>
                    
                </div>               

                <div class="form-row">
                    <div class="form-group col">
                        <label for="inputEmail4">Email</label>
                        <input type="email" class="form-control" name="email" placeholder="Email if have">
                    </div>
                    <div class="col mb-3 was-validated">
                        <label for="validationServerUsername">Phone Number</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend3">+91</span>
                            </div>
                            <input type="text" class="form-control is-invalid" name="phoneNumber" id="validationServerUsername" aria-describedby="inputGroupPrepend3" required>
                            <div class="invalid-feedback">
                                Please Enter Your Phone Number.
                            </div>
                        </div>
                    </div>
                </div>                
                <div class="form-row mb-3 was-validated">
                    <label for="validationServerUsername">Adhaar Number</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupPrepend3">+UID</span>
                        </div>
                        <input type="text" class="form-control is-invalid" name="adhaarNumber" id="validationServerUsername" aria-describedby="inputGroupPrepend3" required>
                        <div class="invalid-feedback">
                            Please Enter Your Adhaar Number.
                        </div>
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
                        <select id="inputState" name="state" class="form-control" required>
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
                    <div class="form-group col-md-2 was-validated">
                        <label for="inputZip">Pincode</label>
                        <input type="text" class="form-control is-invalid" name="pincode" id="inputZip validationText" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Location</label>
                    <input type="text" class="form-control is-invalid" id="inputAddress validationText" name="wentLocation" placeholder="Address or Location Where You Want To Go" required>
                </div>

                <div class="mb-4 was-validated">
                    <label for="validationTextarea">Reason for Getting Outside</label>
                    <textarea class="form-control is-invalid" id="validationTextarea" name="reason" placeholder="Please write valid reason for which you asking permission for going outside." required></textarea>
                    <div class="invalid-feedback">
                        Please enter a reason.
                    </div>
                </div>

                <div class="form-group was-validated">
                    <div class="form-check custom-control custom-checkbox">
                        <input class="form-check-input custom-control-input" type="checkbox" name="checkTerms" id="gridCheck customControlValidation1" required="Please accept terms & condition">
                        <label class="form-check-label custom-control-label" for="gridCheck customControlValidation1">
                            Agree with Terms & Conditions
                        </label>
                    </div>
                </div>

                <button id="sendRequest" type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js" integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src='js/script.js'></script>

    <script>
                $(document).ready(function () {
                    $("#permissionForm").hide();
                    $("#noButton").click(function () {
                        $("#permissionForm").show();
                    })
                    $("#yesButton").click(function () {
                        $("#permissionForm").hide();
                        swal("Sorry!", "You are not allowed to go outside!", "warning");
                    })
                })
    </script>


    <script>
                $(document).ready(function () {
                    console.log("loaded..")

                    $('#permissionForm').on('submit', function (event) {     //On click submit button on registerForm event function call
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
