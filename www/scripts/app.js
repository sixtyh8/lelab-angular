(function() {
  'use strict';
  angular.module('leLabApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ngRoute', 'restangular', 'ui.router', 'cgBusy', 'xeditable', 'confirmClick', 'flow', 'pasvaz.bindonce', 'ui.bootstrap', 'ui.tinymce']).config(function($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) {
    RestangularProvider.setBaseUrl('http://api.lelab.local/');
    return RestangularProvider.setRestangularFields({
      id: "_id"
    });
  }).run(function($rootScope, $state, editableOptions) {
    $rootScope.$state = $state;
    return editableOptions.theme = 'bs3';
  }).value('cgBusyDefaults', {
    templateUrl: 'views/directives/loading.html'
  });

}).call(this);

//# sourceMappingURL=app.js.map
