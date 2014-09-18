angular.module('vogelApp').factory('twitter', ['$http', '$q', ($http, $q) ->
  twitterService = {
    getUser: (userName) ->
      dfd = $q.defer()
      $http.get("/api/twitter/user/#{userName}").success((res) ->
        dfd.resolve(res.user)
      ).error ->
        dfd.reject()
      return dfd.promise
    loadTweets: (username, options = {}) ->
      options.user_name = username
      dfd = $q.defer()
      $http(url: '/api/twitter/tweets', method: 'get', params: options).success((res) ->
        dfd.resolve(res)
      ).error ->
        dfd.reject()
      return dfd.promise
  }

  return twitterService
])