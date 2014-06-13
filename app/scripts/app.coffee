'use strict'

angular.module('leLabApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'restangular',
  'ui.router',
  'cgBusy',
  'xeditable',
  'confirmClick',
  'flow',
  'pasvaz.bindonce',
  'ui.bootstrap',
  'ui.tinymce'
])
  .config ($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) ->

    #$locationProvider.html5Mode(true)

    RestangularProvider.setBaseUrl('http://api.lelab.local/')
    RestangularProvider.setRestangularFields({ id: "_id" })


  .run ($rootScope, $state, editableOptions) ->
    # Assign current state to rootScope to make it available for the menu highlight
    $rootScope.$state = $state

    # # enumerate routes that don't need authentication
    # routesThatDontRequireAuth = ['/login']

    #   # check if current location matches route
    # routeClean = (route) ->
    #     return _.find(routesThatDontRequireAuth,
    #         (noAuthRoute) ->
    #             return _.str.startsWith(route, noAuthRoute)
    #     )

    # # Check if a user is trying to access a route without being authenticated
    # $rootScope.$on "$stateChangeStart", (event, toState, toParams, fromState, fromParams) ->

    #     # if route requires auth and user is not logged in
    #     if not routeClean(toState.url)

    #         # stop the transition
    #         event.preventDefault()

    #         # redirect back to login
    #         $state.go "login"

    # xEditable Theme
    # set to bootstrap3 theme. Can be also 'bs2', 'default'
    editableOptions.theme = 'bs3';

  .value 'cgBusyDefaults',
    templateUrl: 'views/directives/loading.html'
