'use strict'

angular.module('leLabApp').service 'Images', (Restangular, $q) ->

    upload: (image) ->
        deferred = $q.defer()

        Restangular.all('/images').post(image, {}, {'Content-Type': undefined}).then (data) ->
            console.log data