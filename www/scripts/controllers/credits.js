(function() {
  'use strict';
  angular.module('leLabApp').controller('CreditsCtrl', function($scope, $filter) {
    return $scope.currentYear = new Date().getFullYear();
  });

  angular.module('leLabApp').controller('CreditsCtrl.List', function($scope, $state, Credits) {
    $scope.creditsPromise = Credits.list().then(function(data) {
      $scope.credits = {
        list: data
      };
      $scope.rowCollection = data;
      return $scope.columnCollection = [
        {
          label: 'ID',
          map: 'id'
        }, {
          label: 'Album',
          map: 'album_name'
        }, {
          label: 'Artist',
          map: 'artist_name'
        }, {
          label: 'Genre',
          map: 'genreName[0].name'
        }, {
          label: 'Year',
          map: 'year'
        }, {
          label: 'Engineer',
          map: 'engi[0].name'
        }, {
          label: 'credit',
          map: 'credit'
        }
      ];
    });
    $scope.globalConfig = {
      isPaginationEnabled: true,
      itemsByPage: 12,
      maxSize: 8
    };
    return $scope.deleteCredit = function(creditID, index) {
      return Credits["delete"](creditID).then(function(data) {
        return $scope.credits.list.splice(index, 1);
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
