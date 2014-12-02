angular.module('myApp', ['ui.router', 'templates'])

.config(['$stateProvider', '$urlRouterProvider', '$sceDelegateProvider', function($stateProvider, $urlRouterProvider, $sceDelegateProvider){

  $urlRouterProvider.otherwise('/');


  // DECLARES YOUTUBE.COM AS TRUSTED
  $sceDelegateProvider.resourceUrlWhitelist([
    'self',
    'https://www.youtube.com/**'
  ]);

  // URL ADDRESSES FOR ANGULAR
  $stateProvider
    .state('home', {
      url: '/home/:param',
      templateUrl: 'home.html',
      controller: 'searchCtrl'
    })

    .state('show', {
      url: '/show',
      templateUrl: 'show.html',
      controller: 'searchCtrl'
    });
}])


// START OF CONTROLLER
.controller('searchCtrl', function($scope, api, $state, $stateParams) {
  console.log('working controller');
  console.log($stateParams);
  $scope.test = "test test test TEST";


  $scope.state = $state.current;
  $scope.param = $stateParams.param;

  
  $scope.executeSearch = function() {
    console.log('ng-click working');
    console.log($scope.query);
    $scope.tubes = api.searchYoutube($scope.param, function (data) {
      $scope.youtube =  data.data;
    });
    $scope.tubes.then(function(ydata){
      console.log(ydata);
      $scope.videos = ydata.data.items;
    });
  };

  $scope.getIframeSrc = function(src) {
  console.log(src);
  $scope.youtube_url = 'https://www.youtube.com/embed/' + src + '?rel=0';
  console.log($scope.youtube_url);

  };

  $scope.executeSearch();

})
// END OF CONTROLLER



// START OF SERVICES
.service('api', function($http) {
  return {

    searchYoutube: function(query) {
      console.log('searchYoutube working');
      console.log(query);
      var promise = $http.get('https://www.googleapis.com/youtube/v3/search', {
        params: {
          key: 'AIzaSyDLoUrEVNMmog_PAzs81jFwtEjcXQzO-K4',
          part: 'snippet',
          type: 'video',
          maxResults: '12',
          fields: 'items/id,items/snippet/title,items/snippet/description,items/snippet/thumbnails/default,items/snippet/channelTitle',
          q: query
        }
      })
      .then(function(response) {
        return response;
      });
      console.log(promise);
      return promise;

    }
  };
});
// END OF SERVICES
