(function() {
  'use strict';
  angular.module('leLabApp').service('Engineers', function(Restangular, $q) {
    return {
      list: function() {
        var deferred;
        deferred = $q.defer();
        Restangular.one("engineers").get().then(function(results) {
          return deferred.resolve(results);
        });
        return deferred.promise;
      }
    };
  });

}).call(this);

//# sourceMappingURL=engineers.js.map
