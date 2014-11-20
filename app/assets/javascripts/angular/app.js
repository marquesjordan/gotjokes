angular.module('myApp', ['ui.router', 'templates'])

.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider){

  $urlRouterProvider.otherwise('/');

  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home.html',
      controller: 'homeController'
    })

    .state('list', {
      url: '/list',
      templateUrl: 'list.html',
      controller: 'homeController'
    })

    .state('show', {
      url: '/show',
      templateUrl: 'show.html',
      controller: 'homeController'
    });

}])

.controller('homeController', ['$scope', function($scope) {
  console.log("angular console log test");
  $scope.test = "test test test TEST";

  $scope.changeVote = function(vote, flag){
    $scope.vote = vote==flag?'None':flag;
    alert($scope.vote);
  };

}]);


