'use strict'

angular.module('leLabApp').controller 'MainCtrl', ($scope, $state, Session) ->

    $scope.user = Session.info()

    $scope.logout = ->
        Session.remove()
        $state.go "login"