(function() {
  'use strict';
  angular.module('leLabApp').controller('CreditsCtrl', function($scope, $filter) {
    return $scope.currentYear = new Date().getFullYear();
  });

  angular.module('leLabApp').controller('CreditsCtrl.List', function($scope, $state, Credits) {
    $scope.creditsPromise = Credits.list().then(function(data) {
      return $scope.credits = {
        list: data
      };
    });
    return $scope.deleteCredit = function(creditID) {
      return Credits["delete"](creditID).then(function(data) {
        return $state.go('credits');
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

  angular.module('leLabApp').controller('CreditsCtrl.New', function($scope, $state, Credits, Engineers, Genres) {
    $scope.credit = {
      genreName: [
        {
          name: ""
        }
      ],
      year: $scope.currentYear,
      engineer_id: "1"
    };
    $scope.selectedGenre = $scope.credit.genreName[0];
    return $scope.saveCredit = function() {
      $scope.credit.genreName[0] = $scope.credit.selectedGenre;
      return Credits.save($scope.credit).then(function(data) {
        console.log(data);
        return $state.go('credits');
      });
    };
  });

}).call(this);

//# sourceMappingURL=credits.js.map
