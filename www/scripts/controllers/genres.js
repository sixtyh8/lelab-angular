(function() {
  'use strict';
  angular.module('leLabApp').controller('GenresCtrl', function($scope, Genres) {
    $scope.genresPromise = Genres.list().then(function(data) {
      return $scope.genres = data;
    });
    $scope.deleteGenre = function(id) {
      return Genres["delete"](id).then(function(data) {
        console.log(data);
        return $scope.genres.splice(id, 1);
      });
    };
    return $scope.search = function(keyword) {
      return Genres.search(keyword).then(function(data) {
        return $scope.results = data;
      });
    };
  });

}).call(this);

//# sourceMappingURL=genres.js.map
