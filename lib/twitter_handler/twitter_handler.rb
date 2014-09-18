module TwitterHandler
  attr_accessor :client
  def client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_secret
    end
  end

  def get_user(name)
    client.user(name)
  end

  def get_followers(name)
    client.followers(name)
  end

  def get_tweets(name, options)
    client
  end

end