'use strict'

angular.module('leLabApp').directive 'imageUpload', ->
    scope: {credit: '='}
    restrict: 'AE'
    templateUrl: 'views/directives/imageUpload.html'
    link: (scope, element, attrs) ->

        scope.$watch "credit.imgName", (newValue, oldValue) ->
            if newValue
                scope.hasImage = true
            else
                scope.hasImage = false
        , true

        scope.$on 'flow::fileAdded', (event, $flow, flowFile) ->
            console.log flowFile

        scope.test = "Scope Test"