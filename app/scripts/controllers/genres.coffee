'use strict'

angular.module('leLabApp').controller 'GenresCtrl', ($scope, Genres) ->

    $scope.genresPromise = Genres.list().then (data) ->
        $scope.genres = data
