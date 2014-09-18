angular.module('vogelApp').controller 'twitterLookupController', ['$scope', 'twitter', 'toaster', ($scope, twitter, toaster) ->

  $scope.username = ''
  $scope.userLoaded = false
  $scope.user = {username: ""}
  $scope.lastTweetId = undefined
  $scope.lookupUser = ->
    twitter.getUser($scope.username).then(((res) ->
      $scope.user.username = $scope.username
      angular.extend($scope.user, res)
      $scope.userLoaded = true
      if res.tweets.length > 0
        $scope.lastTweetId = _.last(res.tweets).id
        $scope.hasMoreTweets = true
      toaster.pop 'success', 'User', 'Lookup complete'
    ), ->
      toaster.pop 'error', 'User', 'User could not be found'
    )
  $scope.loadMore = ->
    twitter.loadTweets($scope.user.username, {max_id: $scope.lastTweetId}).then (res) ->
      if res.length > 0
        $scope.user.tweets = $scope.user.tweets.concat(res)
        $scope.lastTweetId = _.last(res).id
      else
        toaster.pop 'warning', 'Tweets', "End of Tweets reached"
        $scope.hasMoreTweets = false





]