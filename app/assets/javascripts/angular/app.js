var app = angular.module('myApp', ['ui.router', 'templates'])

.config(function($stateProvider, $urlRouterProvider){

  $urlRouterProvider.otherwise('/');

  $stateProvider

    .state('home', {
      url: '/home',
      templateUrl: 'home.html',
      controller: 'homeController'
    });
})

.controller('homeController', function($scope) {
  console.log("angular console log test");
});