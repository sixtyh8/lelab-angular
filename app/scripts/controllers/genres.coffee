'use strict'

angular.module('leLabApp').controller 'GenresCtrl', ($scope, Genres) ->

    $scope.genresPromise = Genres.list().then (data) ->
        $scope.genres = data
        #$scope.results = data

    $scope.deleteGenre = (id) ->
        Genres.delete(id).then (data) ->
            console.log data
            # Remove genre from $scope.genres if request was successful
            $scope.genres.splice(id, 1)

    $scope.search = (keyword) ->
        Genres.search(keyword).then (data) ->
            $scope.results = data

    # Add edit function
