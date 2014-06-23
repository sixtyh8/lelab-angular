(function() {
  'use strict';
  angular.module('leLabApp').controller('CreditsCtrl', function($scope) {
    return $scope.currentYear = new Date().getFullYear();
  });

  angular.module('leLabApp').controller('CreditsCtrl.List', function($scope, $state, $filter, $timeout, Credits) {
    $scope.limit = 50;
    $scope.offset = 0;
    $scope.loader = {
      busy: false
    };
    $scope.getCredits = function() {
      $scope.loader.busy = true;
      return Credits.list($scope.limit, $scope.offset).then(function(data) {
        var credit, _i, _len;
        if (data.length) {
          if ($scope.creditsList != null) {
            for (_i = 0, _len = data.length; _i < _len; _i++) {
              credit = data[_i];
              $scope.creditsList.push(credit);
            }
          } else {
            $scope.creditsList = data;
          }
          $scope.offset = $scope.offset + $scope.limit;
          return $scope.loader.busy = false;
        } else {

        }
      });
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
