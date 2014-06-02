(function() {
  'use strict';
  angular.module('leLabApp').config(function($urlRouterProvider, $stateProvider) {
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
    }).state("categories", {
      url: "/categories",
      views: {
        header: {
          templateUrl: "views/partials/header.auth.html"
        },
        main: {
          templateUrl: "views/categories.html"
        }
      }
    }).state("engineers", {
      url: "/engineers",
      views: {
        header: {
          templateUrl: "views/partials/header.auth.html"
        },
        main: {
          templateUrl: "views/engineers.html"
        }
      }
    });
  });

}).call(this);

//# sourceMappingURL=routes.js.map
