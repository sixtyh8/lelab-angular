'use strict'

angular.module('leLabApp').controller 'SessionCtrl', ($scope, User) ->

    $scope.login = ->
        console.log "Login Called"

        User.login($scope.email, $scope.password).then (data) ->
            console.log data