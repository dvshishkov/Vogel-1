vogelApp = angular.module 'vogelApp', ['ui.router', 'angular-loading-bar', 'ngAnimate', 'toaster']

vogelApp.config ['$stateProvider', '$urlRouterProvider', '$locationProvider',
($stateProvider, $urlRouterProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $urlRouterProvider.otherwise('/')
  $stateProvider.state 'twitterLookup',
    url: '/lookup'
    controller: 'twitterLookupController'
    templateUrl: '/assets/lookup'
  .state 'twitterCompare',
    url: '/compare'
    controller: 'compareController'
    templateUrl: '/assets/compare'
]