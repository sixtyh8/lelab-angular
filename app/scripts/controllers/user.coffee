'use strict'

angular.module('leLabApp').controller 'UsersCtrl', ($scope, $filter, User) ->

    setUser = ->
        $scope.newUser =
            username: ''
            email: ''
            password: ''
            admin: 'placeholder'

    $scope.statuses = [
        {value: 'Y', text: 'Admin'}
        {value: 'N', text: 'Editor'}
    ]

    $scope.showStatus = (user) ->

        selected = []

        if user.admin?
          selected = $filter('filter')($scope.statuses, {value: user.admin})

        if selected.length
            return selected[0].text
        else
            return 'Not set'

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

    $scope.saveUser = (data, id) ->
        User.update(id, data).then (data) ->
            return true

    setUser()
