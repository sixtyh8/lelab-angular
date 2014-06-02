(function() {
  'use strict';
  angular.module('leLabApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ngRoute', 'restangular', 'ui.bootstrap', 'ui.router', 'cgBusy']).config(function($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) {
    RestangularProvider.setBaseUrl('http://api.lelab.local/');
    return RestangularProvider.setRestangularFields({
      id: "_id"
    });
  }).run(function($rootScope, $state) {
    return $rootScope.$state = $state;
  });

}).call(this);

//# sourceMappingURL=app.js.map
