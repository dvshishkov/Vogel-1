json.user do
  json.name @twitter_user.user.name
  json.tweet_count @twitter_user.user.tweets_count
  json.tweets @twitter_user.tweets, partial: 'tweet', as: :tweet
end