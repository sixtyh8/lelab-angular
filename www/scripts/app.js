(function() {
  'use strict';
  angular.module('leLabApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ngRoute', 'restangular', 'ui.router', 'cgBusy']).config(function($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) {
    RestangularProvider.setBaseUrl('http://api.lelab.local/');
    RestangularProvider.setRestangularFields({
      id: "_id"
    });

    /*
    Routing
     */
    $urlRouterProvider.otherwise("/");
    $urlRouterProvider.when("/", "/credits");
    $urlRouterProvider.when("/credits", "/credits/list");
    return $stateProvider.state("credits", {
      url: "/credits",
      views: {
        header: {
          templateUrl: "views/partials/header.auth.html"
        },
        main: {
          templateUrl: "views/credits.html"
        }
      }
    }).state("credits.list", {
      url: "/list",
      views: {
        credits: {
          templateUrl: "views/partials/credits.list.html"
        }
      }
    }).state("credits.edit", {
      url: "/edit/:creditId",
      views: {
        credits: {
          templateUrl: "views/partials/credits.edit.html"
        }
      }
    }).state("credits.new", {
      url: "/new",
      views: {
        credits: {
          templateUrl: "views/partials/credits.new.html"
        }
      }
    }).state("genres", {
      url: "/genres",
      views: {
        header: {
          templateUrl: "views/partials/header.auth.html"
        },
        main: {
          templateUrl: "views/genres.html"
        }
      }
    });
  }).run(function($rootScope, $state) {
    return $rootScope.$state = $state;
  });

}).call(this);

//# sourceMappingURL=app.js.map
