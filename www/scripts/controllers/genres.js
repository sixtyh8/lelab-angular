(function() {
  'use strict';
  angular.module('leLabApp').controller('GenresCtrl', function($scope, Genres) {
    $scope.genresPromise = Genres.list().then(function(data) {
      return $scope.genres = data;
    });
    return $scope.search = function() {
      return Genres.search($scope.keyword).then(function(data) {
        return $scope.results = data;
      });
    };
  });

}).call(this);

//# sourceMappingURL=genres.js.map
