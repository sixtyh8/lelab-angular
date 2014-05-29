'use strict'

angular.module('leLabApp').controller 'CreditsCtrl', ($scope, Credits) ->



angular.module('leLabApp').controller 'CreditsCtrl.List', ($scope, $state, Credits) ->

    $scope.creditsPromise = Credits.list().then (data) ->
        $scope.credits =
            list : data

    $scope.deleteCredit = (creditID) ->
        Credits.delete(creditID).then (data) ->
                $state.go('credits')


angular.module('leLabApp').controller 'CreditsCtrl.Edit', ($scope, $state, $stateParams, Credits, Engineers) ->

    Credits.get($stateParams.creditId).then (data) ->
        $scope.credit = data

        Engineers.list().then (data) ->
            $scope.credit.engineers = data

    $scope.saveCredit = ->
        Credits.update($scope.credit).then (data) ->
            $state.go('credits')


angular.module('leLabApp').controller 'CreditsCtrl.New', ($scope, $state, Credits, Engineers) ->


    $scope.credit =
        genreName : [
            { name : "" }
        ]
        engineer_id: "1"

    Engineers.list().then (data) ->
        $scope.credit.engineers = data

    $scope.saveCredit = ->
        Credits.save($scope.credit).then (data) ->
            console.log data
            $state.go('credits')
