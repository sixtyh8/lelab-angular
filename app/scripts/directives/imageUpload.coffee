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
                fileReader.readAsDataURL($file)
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
            # fileReader = new FileReader()
            file = scope.selectedFiles[0]
            # fileReader.readAsArrayBuffer(file)

            # fileReader.onloadend = (e) ->

            #     console.log e.target.result
            #     console.log file.name

            #     formData = new FormData()
            #     formData.append('file', e.target.result) # file is an ArrayBuffer read with fileReader.readAsArrayBuffer(file)
            #     formData.append('name', file.name)

            #     Images.upload(formData).then (data) ->
            #         console.log data

            $upload.upload({
                url: 'http://api.lelab.local/images/upload',
                file: file
            })

            .progress( (evt) ->
                console.log 'percent: ' + parseInt(100.0 * evt.loaded / evt.total)
            )

            .success( (data, status, headers, config) ->
                # file is uploaded successfully
                console.log "success"
                console.log data
            )

            .error( (data, status, headers, config) ->
                console.log "error"
                console.log data
            )