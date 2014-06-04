'use strict'

angular.module('leLabApp').controller 'CreditsCtrl', ($scope, $filter) ->
    $scope.currentYear = new Date().getFullYear();


angular.module('leLabApp').controller 'CreditsCtrl.List', ($scope, $state, Credits) ->

    $scope.creditsPromise = Credits.list().then (data) ->
        $scope.credits =
            list : data
            config :
                itemsPerPage: 10
                fillLastPage: true


    $scope.deleteCredit = (creditID, index) ->
        Credits.delete(creditID).then (data) ->
            $scope.credits.list.splice(index, 1)


angular.module('leLabApp').controller 'CreditsCtrl.Edit', ($scope, $state, $stateParams, Credits, Engineers, Genres) ->

    Credits.get($stateParams.creditId).then (data) ->
        $scope.credit = data
        $scope.selectedGenre = $scope.credit.genreName[0]

    $scope.saveCredit = ->
        Credits.update($scope.credit).then (data) ->
            $state.go('credits')


angular.module('leLabApp').controller 'CreditsCtrl.New', ($scope, $state, Credits, Engineers, Genres) ->

    $scope.credit =
        genreName : [
            { name : "" }
        ]
        year: $scope.currentYear
        engineer_id: "1"
        credit: "Mastering"

    $scope.saveCredit = ->
        Credits.save($scope.credit).then (data) ->
            $state.go('credits')
