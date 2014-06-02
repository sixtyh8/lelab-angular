(function() {
  'use strict';
  angular.module('leLabApp').controller('EngineersCtrl', function($scope, Engineers) {
    $scope.genresPromise = Engineers.list().then(function(data) {
      return $scope.engineers = data;
    });
    return $scope.deleteGenre = function(id) {
      return Engineers["delete"](id).then(function(data) {
        console.log(data);
        return $scope.engineers.splice(id, 1);
      });
    };
  });

}).call(this);

//# sourceMappingURL=engineers.js.map
