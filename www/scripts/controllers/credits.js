(function() {
  'use strict';
  angular.module('leLabApp').controller('CreditsCtrl', function($scope) {
    return $scope.currentYear = new Date().getFullYear();
  });

  angular.module('leLabApp').controller('CreditsCtrl.List', function($scope, $state, $filter, Credits) {
    $scope.limit = 5;
    $scope.offset = 0;
    $scope.getCredits = function() {
      return Credits.list($scope.limit, $scope.offset).then(function(data) {
        return $scope.creditsList = data;
      });
    };
    $scope.creditsPromise = $scope.getCredits();
    $scope.nextPage = function() {
      $scope.offset = $scope.offset + $scope.limit;
      return $scope.getCredits();
    };
    $scope.previousPage = function() {
      $scope.offset = $scope.offset - $scope.limit;
      return $scope.getCredits();
    };
    $scope.searchCredits = function() {
      return $scope.creditsPromise = Credits.search($scope.searchTerm).then(function(data) {
        return $scope.creditsList = data;
      });
    };
    return $scope.deleteCredit = function(creditID, index) {
      return Credits["delete"](creditID).then(function(data) {
        return $scope.creditsList.splice(index, 1);
      });
    };
  });

  angular.module('leLabApp').controller('CreditsCtrl.Edit', function($scope, $state, $stateParams, Credits, Engineers, Genres) {
    Credits.get($stateParams.creditId).then(function(data) {
      $scope.credit = data;
      return $scope.selectedGenre = $scope.credit.genreName[0];
    });
    return $scope.saveCredit = function() {
      return Credits.update($scope.credit).then(function(data) {
        return $state.go('credits');
      });
    };
  });

  angular.module('leLabApp').controller('CreditsCtrl.New', function($scope, $state, Credits, Engineers, Genres, Images) {
    $scope.credit = {
      genreName: [
        {
          name: ""
        }
      ],
      year: $scope.currentYear,
      engineer_id: "1",
      credit: "Mastering"
    };
    return $scope.saveCredit = function() {
      return Credits.save($scope.credit).then(function(data) {
        return $state.go('credits');
      });
    };
  });

}).call(this);

//# sourceMappingURL=credits.js.map
