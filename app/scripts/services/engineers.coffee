'use strict'

angular.module('leLabApp').service 'Engineers', (Restangular, $q) ->

    list: ->
    	deferred = $q.defer()

    	Restangular.one("engineers").get().then (results) ->
    		deferred.resolve results

    	deferred.promise
