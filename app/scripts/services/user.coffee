'use strict'

angular.module('leLabApp').service 'User', (Restangular, $q) ->

    login: (username, password) ->
        deferred = $q.defer()

        Restangular.all("auth").post({ 'username': username, 'password': password }).then (results) ->
            deferred.resolve results

        deferred.promise