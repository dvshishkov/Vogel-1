angular.module('vogelApp').controller('compareController', ['$scope', 'twitter', 'toaster', ($scope, twitter, toaster) ->
  $scope.user1 = ''
  $scope.user2 = ''
  $scope.loaded = false
  $scope.commonFollowers = []

  $scope.compareUsers = (user1, user2) ->
    twitter.compare(user1, user2).then((res) ->
      $scope.loaded = true
      toaster.pop 'success', 'Comparing', 'Compared those two users'
      $scope.commonFollowers = res
    , ->
      toaster.pop 'error', 'Comparing', 'Something went wrong'
    )
])