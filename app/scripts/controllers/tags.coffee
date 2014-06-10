'use strict'

angular.module('leLabApp').controller 'TagsCtrl', ($scope, Tags) ->

    $scope.newTag = {}

    $scope.tagsPromise = Tags.list().then (data) ->
        $scope.tags = data

    $scope.deleteTag = (id, index) ->
        Tags.delete(id).then (data) ->
            # Remove genre from $scope.tags if request was successful
            $scope.tags.splice(index, 1)

    $scope.addTag = ->
        if $scope.newTag.label?
            Tags.add($scope.newTag.label).then (data) ->
                console.log data
                $scope.newTag.label = null
                $scope.tags.push(data)

    $scope.saveTag = (data, tag_id) ->
        Tags.update(tag_id, data).then (data) ->
            return true
