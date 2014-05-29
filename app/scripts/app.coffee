'use strict'

angular.module('leLabApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'restangular',
  'ui.router',
  'cgBusy'
])
  .config ($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) ->

    #$locationProvider.html5Mode(true)

    #RestangularProvider.setBaseUrl('/api')
    RestangularProvider.setBaseUrl('http://api.lelab.local/')
    RestangularProvider.setRestangularFields({ id: "_id" })

    ###
    Routing
    ###

    # If unmatched URL, redirect to index
    $urlRouterProvider.otherwise "/"

    # Map /credits to /credits/list
    $urlRouterProvider.when("/", "/credits")
    $urlRouterProvider.when("/credits","/credits/list")

    # Index
    # $stateProvider.state("index",
    #     url: "/"
    #     views:
    #         header:
    #             templateUrl: "views/partials/header.auth.html"
    #         main:
    #             templateUrl: "views/index.html"

    # Credits
    $stateProvider.state("credits",
        url: "/credits"
        views:
            header:
                templateUrl: "views/partials/header.auth.html"
            main:
                templateUrl: "views/credits.html"
    ).state("credits.list"
        url: "/list"
        views:
            credits:
                templateUrl: "views/partials/credits.list.html"
    ).state("credits.edit"
        url: "/edit/:creditId"
        views:
            credits:
                templateUrl: "views/partials/credits.edit.html"
    ).state("credits.new"
        url: "/new"
        views:
            credits:
                templateUrl: "views/partials/credits.new.html"

    # Genres
    ).state("genres"
        url: "/genres"
        views:
          header:
            templateUrl: "views/partials/header.auth.html"
          main:
            templateUrl: "views/genres.html"
    )

  .run ($rootScope, $state) ->
    # Assign current state to rootScope to make it available for the menu highlight
    $rootScope.$state = $state
