(function() {
  'use strict';
  angular.module('leLabApp').directive('imageUpload', function() {
    return {
      scope: {
        credit: '='
      },
      restrict: 'AE',
      templateUrl: 'views/directives/imageUpload.html',
      link: function(scope, element, attrs) {
        scope.$watch("credit.imgName", function(newValue, oldValue) {
          if (newValue) {
            return scope.hasImage = true;
          } else {
            return scope.hasImage = false;
          }
        }, true);
        scope.$on('flow::fileAdded', function(event, $flow, flowFile) {
          return console.log(flowFile);
        });
        return scope.test = "Scope Test";
      }
    };
  });

}).call(this);

//# sourceMappingURL=imageUpload.js.map
