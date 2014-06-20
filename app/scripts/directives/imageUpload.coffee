'use strict'

angular.module('leLabApp').directive 'imageUpload', ($upload, $timeout, Images) ->
    scope: {credit: '='}
    restrict: 'AE'
    templateUrl: 'views/directives/imageUpload.html'
    link: (scope, element, attrs) ->

        $timeout( () ->

            if scope.credit.imgName
                scope.imageAlreadyExists = true
            else
                scope.imageAlreadyExists = false

        , 1000)

        jQuery('.file-input').bootstrapFileInput()

        scope.onFileSelect = ($files) ->
            scope.progress = []
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

                # Getting artist and album name from filename
                fileArray = $files[0].name.split('-')
                artist_name = jQuery.trim(fileArray[1])
                album_name = jQuery.trim(fileArray[2].split('.')[0])

                if !scope.credit.album_name?
                    scope.credit.album_name = album_name

                if !scope.credit.artist_name?
                    scope.credit.artist_name = artist_name

        scope.uploadImage = () ->
            fileReader = new FileReader()

            file = scope.selectedFiles[0]

            formData = new FormData()
            formData.append('file', file) # file is an ArrayBuffer read with fileReader.readAsArrayBuffer(file)
            formData.append('name', file.name)

            Images.upload(formData).then (data) ->
                console.log data
