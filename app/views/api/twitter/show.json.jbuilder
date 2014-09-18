json.user do
  json.name @twitter_user.user_info.name
  json.tweet_count @twitter_user.user_info.tweets_count
  # json.partial! 'tweet', collection: @twitter_user.tweets, as: :tweets
  json.tweets @twitter_user.tweets, partial: 'tweet', as: :tweet
  # json.tweets @twitter_user.tweets do |tweet|
  #   json.text tweet.full_text
  #   json.id tweet.id
  # end
end