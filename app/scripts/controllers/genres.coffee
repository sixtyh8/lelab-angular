'use strict'

angular.module('leLabApp').controller 'GenresCtrl', ($scope, Genres) ->

    $scope.genresPromise = Genres.list().then (data) ->
        $scope.genres = data
        #$scope.results = data

    $scope.deleteGenre = (id, index) ->
        Genres.delete(id).then (data) ->
            $scope.genres.splice(index, 1)

    $scope.search = (keyword) ->
        Genres.search(keyword).then (data) ->
            $scope.results = data

    $scope.saveGenre = (data, genre_id) ->
        Genres.update(genre_id, data).then (data) ->
            console.log data
            return true
