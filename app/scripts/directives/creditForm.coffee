'use strict'

angular.module('leLabApp').directive 'creditForm', ->
    scope: {credit: '='}
    restrict: 'AE'
    templateUrl: 'views/directives/creditForm.html'
    link: (scope, element, attrs) ->
