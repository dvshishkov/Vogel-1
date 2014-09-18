class TwitterService
  def initialize

  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_secret
    end
  end

  def user_exists?(username)
    begin
      client.user(username)
      true
    rescue Twitter::Error::NotFound
      false
    rescue Twitter::Error::TooManyRequests
      nil
    end
  end

  def get_info(username)
    begin
      client.user(username)
    rescue Twitter::Error::TooManyRequests
      return nil
    end
  end

  def get_followers(username)
    begin
      client.followers(username).to_a
    rescue Twitter::Error::TooManyRequests
      return nil
    end
  end

  def get_tweets(username, options = {})
    options[:count] ||= 10
    options[:count] = 200 if options[:count].to_i > 200
    options.compact!
    begin
      loaded_tweets = client.user_timeline(username, options)
      return loaded_tweets
    rescue Twitter::Error::TooManyRequests
      return nil
    end
  end

  def compare_followers(*users)
    begin
      common_followers = []
      users.each do |user|
        followers = client.followers(user).to_a
        common_followers = followers & common_followers
      end
      common_followers
    rescue Twitter::Error::TooManyRequests
      return nil
    end
  end

end