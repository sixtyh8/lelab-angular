(function() {
  'use strict';
  angular.module('leLabApp').controller('CategoriesCtrl', function($scope, Categories) {
    $scope.categoriesPromise = Categories.list().then(function(data) {
      return $scope.categories = data;
    });
    return $scope.deleteGenre = function(id) {
      return Categories["delete"](id).then(function(data) {
        console.log(data);
        return $scope.categories.splice(id, 1);
      });
    };
  });

}).call(this);

//# sourceMappingURL=categories.js.map
