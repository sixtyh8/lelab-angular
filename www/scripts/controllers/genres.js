(function() {
  'use strict';
  angular.module('leLabApp').controller('GenresCtrl', function($scope, Genres) {
    return $scope.genresPromise = Genres.list().then(function(data) {
      return $scope.genres = data;
    });
  });

}).call(this);

//# sourceMappingURL=genres.js.map
