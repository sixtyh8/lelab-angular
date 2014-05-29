(function() {
  'use strict';
  angular.module('leLabApp').directive('creditForm', function() {
    return {
      scope: {
        credit: '='
      },
      restrict: 'AE',
      templateUrl: 'views/directives/creditForm.html',
      link: function(scope, element, attrs) {}
    };
  });

}).call(this);

//# sourceMappingURL=creditForm.js.map
