'use strict'

angular.module('leLabApp').controller 'CreditsCtrl', ($scope, $filter) ->
    $scope.currentYear = new Date().getFullYear();


angular.module('leLabApp').controller 'CreditsCtrl.List', ($scope, $state, Credits) ->

    $scope.creditsPromise = Credits.list().then (data) ->

        $scope.credits =
            list : data

        $scope.rowCollection = data
        $scope.columnCollection = [
            {label: 'ID', map: 'id'}
            {label: 'Album', map: 'album_name'}
            {label: 'Artist', map: 'artist_name'}
            {label: 'Genre', map: 'genreName[0].name'}
            {label: 'Year', map: 'year'}
            {label: 'Engineer', map: 'engi[0].name'}
            {label: 'credit', map: 'credit'}
        ]


    $scope.globalConfig =
        isPaginationEnabled: true
        itemsByPage: 12
        maxSize: 8



    # Delete a credit
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


angular.module('leLabApp').controller 'CreditsCtrl.New', ($scope, $state, Credits, Engineers, Genres, Images) ->

    $scope.credit =
        genreName : [
            { name : "" }
        ]
        year: $scope.currentYear
        engineer_id: "1"
        credit: "Mastering"

    # $scope.$on 'flow::fileAdded', (event, $flow, flowFile) ->
    #     console.log flowFile

    $scope.saveCredit = ->
        Credits.save($scope.credit).then (data) ->
            $state.go('credits')
