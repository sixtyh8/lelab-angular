'use strict'

angular.module('leLabApp').controller 'UsersCtrl', ($scope, User) ->

    setUser = ->
        $scope.newUser =
            username: ''
            email: ''
            password: ''
            admin: false

    $scope.usersPromise = User.list().then (data) ->
        $scope.userList = data

    $scope.addUser = ->
        User.create($scope.newUser).then (data) ->
            $scope.userList.push(data)
            setUser()


    # Delete a credit
    $scope.deleteUser = (userId, index) ->
        User.delete(userId).then (data) ->
            $scope.userList.splice(index, 1)

    setUser()
