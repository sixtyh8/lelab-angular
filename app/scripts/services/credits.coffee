'use strict'

angular.module('leLabApp').service 'Credits', (Restangular, $q, DSCacheFactory) ->

    credits = Restangular.all('credits')

    # Works
    list: (limit, offset) ->
        deferred = $q.defer()

        Restangular.one('credits').get({'limit': limit, 'offset': offset}).then ((results) ->
            #cache.put('credits', results)
            deferred.resolve results
        ), (response) ->
            deferred.reject response

        deferred.promise

    # Works
    get: (id) ->
        deferred = $q.defer()

        Restangular.one('credits', id).get().then (results) ->
            deferred.resolve results

        deferred.promise

    search: (searchTerm) ->
        deferred = $q.defer()

        Restangular.one('credits/search').get({'keyword': searchTerm}).then (results) ->
            deferred.resolve results

        deferred.promise

    # Works
    save: (credit) ->
        deferred = $q.defer()

        credit.genre = credit.genreName[0].name

        credits.post({ 'data': credit }).then (results) ->
            deferred.resolve results

        deferred.promise

    # Works
    update: (obj) ->
        deferred = $q.defer()
        id = obj.id

        credit = Restangular.one('credits', id).get().then (result) ->
            result = obj
            result.put().then (results) ->
                deferred.resolve results

        deferred.promise

    # Works
    delete: (id) ->
        deferred = $q.defer()

        Restangular.one('credits', id).remove().then (results) ->
            deferred.resolve results

        deferred.promise

    # Upload Image
    saveImage: ->
        deferred = $q.defer()


