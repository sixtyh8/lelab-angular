'use strict'

angular.module('leLabApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'restangular',
  'ui.bootstrap',
  'ui.router',
  'cgBusy'
])
  .config ($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) ->

    #$locationProvider.html5Mode(true)

    RestangularProvider.setBaseUrl('http://api.lelab.local/')
    RestangularProvider.setRestangularFields({ id: "_id" })


  .run ($rootScope, $state) ->
    # Assign current state to rootScope to make it available for the menu highlight
    $rootScope.$state = $state
