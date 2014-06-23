'use strict'

angular.module('leLabApp').controller 'CreditsCtrl', ($scope) ->
    $scope.currentYear = new Date().getFullYear();


angular.module('leLabApp').controller 'CreditsCtrl.List', ($scope, $state, $filter, $timeout, Credits) ->

    $scope.limit = 50
    $scope.offset = 0
    $scope.loader =
        busy : false

    $scope.getCredits = ->
        # disable infinite scroll while the http call is done
        $scope.loader.busy = true

        Credits.list($scope.limit, $scope.offset).then (data) ->
            if data.length
                if $scope.creditsList?
                    for credit in data
                        $scope.creditsList.push(credit)
                else
                    $scope.creditsList = data

                $scope.offset = $scope.offset + $scope.limit

                # re-enable the infinite scroll
                $scope.loader.busy = false

            else
                return

    $scope.searchCredits = ->
        $scope.creditsPromise = Credits.search($scope.searchTerm).then (data) ->
            $scope.creditsList = data
            #Add highlight

    # Delete a credit
    $scope.deleteCredit = (creditID, index) ->
        Credits.delete(creditID).then (data) ->
            $scope.creditsList.splice(index, 1)


angular.module('leLabApp').controller 'CreditsCtrl.Edit', ($scope, $state, $stateParams, Credits, Engineers, Genres) ->

    Credits.get($stateParams.creditId).then (data) ->
        $scope.credit = data
        $scope.selectedGenre = $scope.credit.genreName[0]

    $scope.saveCredit = ->
        Credits.update($scope.credit).then (data) ->
            $state.go('credits')


angular.module('leLabApp').controller 'CreditsCtrl.New', ($scope, $state, Credits, Engineers, Genres, Images) ->

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
