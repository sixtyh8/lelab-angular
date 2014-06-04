(function() {
  'use strict';
  angular.module('leLabApp').controller('GenresCtrl', function($scope, Genres) {
    $scope.genresPromise = Genres.list().then(function(data) {
      return $scope.genres = data;
    });
    $scope.deleteGenre = function(id, index) {
      return Genres["delete"](id).then(function(data) {
        return $scope.genres.splice(index, 1);
      });
    };
    $scope.search = function(keyword) {
      return Genres.search(keyword).then(function(data) {
        return $scope.results = data;
      });
    };
    return $scope.saveGenre = function(data, genre_id) {
      return Genres.update(genre_id, data).then(function(data) {
        console.log(data);
        return true;
      });
    };
  });

}).call(this);

//# sourceMappingURL=genres.js.map
