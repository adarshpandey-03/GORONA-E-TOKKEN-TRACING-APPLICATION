const URL = 'https://covid19.mathdro.id/api';

var app = angular.module("CovidApp", []);

app.controller("CovidCtrl", ($scope, $http) => {
    //this is controller
    $scope.title = "Stay Home Stay Safe";           //Two way Data-binding feature in Angular

   console.log("App is loaded");


//calling api

$http.get(URL).then( 
    (response)=>{
    //success
    console.log(response.data);
    $scope.all_data = response.data;

    }, 

    (error)=>{
    //error
    console.log(error);    
    } 
    );

//get country data

$scope.get_c_data = () => {
    let country = $scope.c;
    if(country == "") {
      $scope.c_data = undefined;
        return;
    }

    $http.get(`${URL}/countries/${country}`)
    .then((response)=>{
        console.log(response.data);
        $scope.c_data = response.data;
    }, 
    (error)=>{
    
        console.log(error);
    }
    );

};
});

