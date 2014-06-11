'use strict'

angular.module('leLabApp').directive 'whitepaperForm', (Tags) ->
    scope: {credit: '='}
    restrict: 'AE'
    templateUrl: 'views/directives/whitepaperForm.html'
    link: (scope, element, attrs) ->

        # Get tags
        Tags.list().then (data) ->
            scope.tags = data
