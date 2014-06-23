(function() {
  'use strict';
  angular.module('leLabApp').directive('imageUpload', function($upload, $timeout, Images) {
    return {
      scope: {
        credit: '='
      },
      restrict: 'AE',
      templateUrl: 'views/directives/imageUpload.html',
      link: function(scope, element, attrs) {
        $timeout(function() {
          if (scope.credit.imgName) {
            return scope.imageAlreadyExists = true;
          } else {
            return scope.imageAlreadyExists = false;
          }
        }, 1000);
        jQuery('.file-input').bootstrapFileInput();
        scope.onFileSelect = function($files) {
          var $file, album_name, artist_name, fileArray, fileReader;
          scope.progress = [];
          scope.selectedFiles = $files;
          $file = scope.selectedFiles[0];
          scope.dataUrls = [];
          if (window.FileReader && $file.type.indexOf('image') > -1) {
            fileReader = new FileReader();
            fileReader.readAsDataURL($file);
            fileReader.onload = function(e) {
              return $timeout(function() {
                return scope.dataUrls[0] = e.target.result;
              }, 1);
            };
            fileArray = $files[0].name.split('-');
            artist_name = jQuery.trim(fileArray[1]);
            album_name = jQuery.trim(fileArray[2].split('.')[0]);
            if (scope.credit.album_name == null) {
              scope.credit.album_name = album_name;
            }
            if (scope.credit.artist_name == null) {
              return scope.credit.artist_name = artist_name;
            }
          }
        };
        return scope.uploadImage = function() {
          var file;
          file = scope.selectedFiles[0];
          return $upload.upload({
            url: 'http://api.lelab.local/images/upload',
            file: file
          }).progress(function(evt) {
            return console.log('percent: ' + parseInt(100.0 * evt.loaded / evt.total));
          }).success(function(data, status, headers, config) {
            console.log("success");
            return console.log(data);
          }).error(function(data, status, headers, config) {
            console.log("error");
            return console.log(data);
          });
        };
      }
    };
  });

}).call(this);

//# sourceMappingURL=imageUpload.js.map
