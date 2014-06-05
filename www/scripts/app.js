(function() {
  'use strict';
  angular.module('leLabApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ngRoute', 'ngAnimate', 'restangular', 'ui.bootstrap', 'ui.router', 'cgBusy', 'xeditable', 'fx.animations', 'confirmClick']).config(function($routeProvider, RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider) {
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

  angular.module('your_app').value('cgBusyDefaults', {
    message: 'Loading Stuff',
    backdrop: false,
    templateUrl: 'my_custom_template.html',
    delay: 300,
    minDuration: 700
  });

}).call(this);

//# sourceMappingURL=app.js.map
