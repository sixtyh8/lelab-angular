'use strict'

angular.module('leLabApp').directive 'imageUpload', ($upload, $timeout) ->
    scope: {credit: '='}
    restrict: 'AE'
    templateUrl: 'views/directives/imageUpload.html'
    link: (scope, element, attrs) ->

        $timeout( () ->
            console.log scope.credit

            if scope.credit.imgName.length
                scope.imageAlreadyExists = true
            else
                scope.imageAlreadyExists = false

        , 1000)

        jQuery('.file-input').bootstrapFileInput()

        scope.onFileSelect = ($files) ->
            scope.progress = []
            scope.upload = []
            scope.uploadResult = []
            scope.selectedFiles = $files
            $file = scope.selectedFiles[0]
            scope.dataUrls = []

            if (window.FileReader && $file.type.indexOf('image') > -1)
                fileReader = new FileReader()
                fileReader.readAsDataURL($files[0])
                fileReader.onload = (e) ->
                    $timeout( () ->
                        scope.dataUrls[0] = e.target.result
                    , 1)