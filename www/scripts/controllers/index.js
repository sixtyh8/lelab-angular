(function() {
  'use strict';
  angular.module('leLabApp').controller('IndexCtrl', function($scope, Credits) {
    return Credits.list().then(function(data) {
      return $scope.credits = {
        list: data
      };
    });
  });

}).call(this);

//# sourceMappingURL=index.js.map
