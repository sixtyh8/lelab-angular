(function() {
  'use strict';
  angular.module('leLabApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ngRoute', 'ngAnimate', 'restangular', 'ui.bootstrap', 'ui.router', 'cgBusy', 'xeditable', 'fx.animations']).config(function($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) {
    RestangularProvider.setBaseUrl('http://api.lelab.local/');
    return RestangularProvider.setRestangularFields({
      id: "_id"
    });
  }).run(function($rootScope, $state, editableOptions) {
    $rootScope.$state = $state;
    return editableOptions.theme = 'bs3';
  });

}).call(this);

//# sourceMappingURL=app.js.map
