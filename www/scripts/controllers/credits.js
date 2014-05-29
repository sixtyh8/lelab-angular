(function() {
  'use strict';
  angular.module('leLabApp').controller('CreditsCtrl', function($scope, Credits) {});

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

  angular.module('leLabApp').controller('CreditsCtrl.Edit', function($scope, $state, $stateParams, Credits, Engineers) {
    Credits.get($stateParams.creditId).then(function(data) {
      $scope.credit = data;
      return Engineers.list().then(function(data) {
        return $scope.credit.engineers = data;
      });
    });
    return $scope.saveCredit = function() {
      return Credits.update($scope.credit).then(function(data) {
        return $state.go('credits');
      });
    };
  });

  angular.module('leLabApp').controller('CreditsCtrl.New', function($scope, $state, Credits, Engineers) {
    $scope.credit = {
      genreName: [
        {
          name: ""
        }
      ],
      engineer_id: "1"
    };
    Engineers.list().then(function(data) {
      return $scope.credit.engineers = data;
    });
    return $scope.saveCredit = function() {
      return Credits.save($scope.credit).then(function(data) {
        console.log(data);
        return $state.go('credits');
      });
    };
  });

}).call(this);

//# sourceMappingURL=credits.js.map
