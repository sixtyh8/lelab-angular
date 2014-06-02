(function() {
  'use strict';
  angular.module('leLabApp').service('Categories', function(Restangular, $q) {
    return {
      list: function() {
        var deferred;
        deferred = $q.defer();
        Restangular.one("categories").get().then(function(results) {
          return deferred.resolve(results);
        });
        return deferred.promise;
      },
      add: function(name) {
        var deferred;
        deferred = $q.defer();
        Restangular.all("categories").post(name).then(function(results) {
          return deferred.resolve(results);
        });
        return deferred.promise;
      },
      update: function(id, name) {
        var cat, deferred;
        deferred = $q.defer();
        cat = Restangular.one("categories", id);
        cat.name = name;
        cat.put().then(function(data) {
          return deferred.resolve(data);
        });
        return deferred.promise;
      },
      "delete": function(id) {
        var cat, deferred;
        deferred = $q.defer();
        cat = Restangular.one("categories", id);
        return cat.remove().then(function(data) {
          return deferred.resolve(data);
        });
      }
    };
  });

}).call(this);

//# sourceMappingURL=categories.js.map
