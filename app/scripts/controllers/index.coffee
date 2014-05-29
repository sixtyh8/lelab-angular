'use strict'

angular.module('leLabApp').controller 'IndexCtrl', ($scope, Credits) ->

	Credits.list().then (data) ->
        $scope.credits =
            list : data