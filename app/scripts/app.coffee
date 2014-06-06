'use strict'

angular.module('leLabApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'restangular',
  'ui.bootstrap',
  'ui.router',
  'cgBusy',
  'xeditable',
  'confirmClick',
  'flow'
])
  .config ($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) ->

    #$locationProvider.html5Mode(true)

    RestangularProvider.setBaseUrl('http://api.lelab.local/')
    RestangularProvider.setRestangularFields({ id: "_id" })


  .run ($rootScope, $state, editableOptions) ->
    # Assign current state to rootScope to make it available for the menu highlight
    $rootScope.$state = $state

    # xEditable Theme
    # set to bootstrap3 theme. Can be also 'bs2', 'default'
    editableOptions.theme = 'bs3';

  .value 'cgBusyDefaults',
    templateUrl: 'views/directives/loading.html'
