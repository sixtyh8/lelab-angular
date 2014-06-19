(function() {
  'use strict';
  angular.module('leLabApp').directive('imageUpload', function($upload, $timeout) {
    return {
      scope: {
        credit: '='
      },
      restrict: 'AE',
      templateUrl: 'views/directives/imageUpload.html',
      link: function(scope, element, attrs) {
        $timeout(function() {
          console.log(scope.credit);
          if (scope.credit.imgName.length) {
            return scope.imageAlreadyExists = true;
          } else {
            return scope.imageAlreadyExists = false;
          }
        }, 1000);
        jQuery('.file-input').bootstrapFileInput();
        return scope.onFileSelect = function($files) {
          var $file, fileReader;
          scope.progress = [];
          scope.upload = [];
          scope.uploadResult = [];
          scope.selectedFiles = $files;
          $file = scope.selectedFiles[0];
          scope.dataUrls = [];
          if (window.FileReader && $file.type.indexOf('image') > -1) {
            fileReader = new FileReader();
            fileReader.readAsDataURL($files[0]);
            return fileReader.onload = function(e) {
              return $timeout(function() {
                return scope.dataUrls[0] = e.target.result;
              }, 1);
            };
          }
        };
      }
    };
  });

}).call(this);

//# sourceMappingURL=imageUpload.js.map
