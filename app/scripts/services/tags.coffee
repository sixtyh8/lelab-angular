'use strict'

angular.module('leLabApp').service 'Tags', (Restangular, $q) ->

    list: ->
        deferred = $q.defer()

        Restangular.one("tags").get().then (results) ->
            deferred.resolve results

        deferred.promise

    add: (label) ->
        deferred = $q.defer()

        Restangular.all("tags").post({ 'data': label }).then (results) ->
            deferred.resolve results

        deferred.promise

    update: (id, label) ->
        deferred = $q.defer()

        tag = Restangular.one("tags", id).get().then (results) ->
            results[0].label = label
            results.put().then (data) ->
                deferred.resolve data

        deferred.promise

    delete: (id) ->
        deferred = $q.defer()

        tag = Restangular.one("tags", id)
        tag.remove().then (data) ->
            deferred.resolve data