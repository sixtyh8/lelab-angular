'use strict'

angular.module('leLabApp').service 'Categories', (Restangular, $q) ->

    list: ->
        deferred = $q.defer()

        Restangular.one("categories").get().then (results) ->
            deferred.resolve results

        deferred.promise

    add: (name) ->
        deferred = $q.defer()

        Restangular.all("categories").post(name).then (results) ->
            deferred.resolve results

        deferred.promise

    update: (id, name) ->
        deferred = $q.defer()

        cat = Restangular.one("categories", id)
        cat.name = name
        cat.put().then (data) ->
            deferred.resolve data

        deferred.promise

    delete: (id) ->
        deferred = $q.defer()

        cat = Restangular.one("categories", id)
        cat.remove().then (data) ->
            deferred.resolve data