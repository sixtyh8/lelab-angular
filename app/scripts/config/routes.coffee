'use strict'

angular.module('leLabApp').config ($urlRouterProvider, $stateProvider) ->
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

    # Tags
    ).state("tags"
        url: "/tags"
        views:
            header:
                templateUrl: "views/partials/header.auth.html"
            main:
                templateUrl: "views/tags.html"

    # Engineers
    ).state("engineers"
        url: "/engineers"
        views:
            header:
                templateUrl: "views/partials/header.auth.html"
            main:
                templateUrl: "views/engineers.html"
    )
