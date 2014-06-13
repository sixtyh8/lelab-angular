'use strict'

angular.module('leLabApp').controller 'UsersCtrl', ($scope, User) ->

    $scope.usersPromise = User.list().then (data) ->
        $scope.userList = data