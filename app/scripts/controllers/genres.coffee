'use strict'

angular.module('leLabApp').controller 'GenresCtrl', ($scope, Genres) ->

    $scope.genresPromise = Genres.list().then (data) ->
        $scope.genres = data

    $scope.search = ->
        Genres.search($scope.keyword).then (data) ->
            $scope.results = data
