'use strict'

angular.module('leLabApp').controller 'EngineersCtrl', ($scope, Engineers) ->

    $scope.genresPromise = Engineers.list().then (data) ->
        $scope.engineers = data

    $scope.deleteGenre = (id) ->
        Engineers.delete(id).then (data) ->
            console.log data
            # Remove engineer from $scope.genres if request was successful
            $scope.engineers.splice(id, 1)

    # Add edit function
