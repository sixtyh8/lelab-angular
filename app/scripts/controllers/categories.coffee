'use strict'

angular.module('leLabApp').controller 'CategoriesCtrl', ($scope, Categories) ->

    $scope.categoriesPromise = Categories.list().then (data) ->
        $scope.categories = data

    $scope.deleteGenre = (id) ->
        Categories.delete(id).then (data) ->
            console.log data
            # Remove genre from $scope.categories if request was successful
            $scope.categories.splice(id, 1)

    # Add edit function
