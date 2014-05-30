(function() {
  'use strict';
  angular.module('leLabApp').service('Credits', function(Restangular, $q) {
    var credits;
    credits = Restangular.all("credits");
    return {
      list: function() {
        var deferred;
        deferred = $q.defer();
        credits.getList().then((function(results) {
          return deferred.resolve(results);
        }), function(response) {
          console.log(response);
          return deferred.reject(response);
        });
        return deferred.promise;
      },
      get: function(id) {
        var deferred;
        deferred = $q.defer();
        Restangular.one('credits', id).get().then(function(results) {
          return deferred.resolve(results);
        });
        return deferred.promise;
      },
      save: function(credit) {
        var deferred;
        deferred = $q.defer();
        credit.genre = credit.genreName[0].name;
        credits.post({
          'data': credit
        }).then(function(results) {
          return deferred.resolve(results);
        });
        return deferred.promise;
      },
      update: function(obj) {
        var credit, deferred, id;
        deferred = $q.defer();
        id = obj.id;
        credit = Restangular.one('credits', id).get().then(function(result) {
          result = obj;
          result.put();
          return deferred.resolve;
        });
        return deferred.promise;
      },
      "delete": function(id) {
        var deferred;
        deferred = $q.defer();
        Restangular.one('credits', id).remove().then(function(results) {
          return deferred.resolve(results);
        });
        return deferred.promise;
      }
    };
  });

}).call(this);

//# sourceMappingURL=credits.js.map
