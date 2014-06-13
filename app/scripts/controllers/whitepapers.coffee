'use strict'

angular.module('leLabApp').controller 'WhitepapersCtrl', ($scope, $filter) ->

angular.module('leLabApp').controller 'WhitepapersCtrl.List', ($scope, $state, Whitepapers) ->

    $scope.whitepapersPromise = Whitepapers.list().then (data) ->
        $scope.whitepapers =
            list : data
            config :
                itemsPerPage: 10
                fillLastPage: true


    $scope.deleteWhitepaper = (whitepaperID, index) ->
        Whitepapers.delete(whitepaperID).then (data) ->
            $scope.whitepapers.list.splice(index, 1)


angular.module('leLabApp').controller 'WhitepapersCtrl.Edit', ($scope, $state, $stateParams, Whitepapers, Tags) ->

    Whitepapers.get($stateParams.whitepaperId).then (data) ->
        $scope.whitepaper = data

    $scope.saveWhitepaper = ->
        Whitepapers.update($scope.whitepaper).then (data) ->
            $state.go('whitepapers')


angular.module('leLabApp').controller 'WhitepapersCtrl.New', ($scope, $state, Whitepapers, Tags) ->

    $scope.whitepaper =
        created_at: null


    $scope.saveWhitepaper = ->
        newDate = new Date()
        $scope.now = $filter('date')(newDate, 'shortDate')
        $scope.whitepaper.created_at = $scope.now

        Whitepapers.save($scope.whitepaper).then (data) ->
            console.log "saved!"
            $state.go('whitepapers')
