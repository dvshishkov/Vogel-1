class TwitterUser
  attr_accessor :user_info, :followers, :tweets, :name, :last_tweet_id

  def initialize(name)
    @name = name
    @tweets = []
    begin
      @user_info = client.user(@name)
    rescue Twitter::Error::NotFound

    end
  end

  def is_valid?
    !@user_info.nil?
  end


  def client
    return @client unless @client.nil?
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_secret
    end
  end

  def load
    begin
      @followers = get_followers
      @tweets << get_tweets
      @tweets.flatten!
    rescue
      return nil
    end
  end

  def get_followers
    client.followers(@name)
  end

  def get_tweets(options = {})
    options[:count] ||= 10
    options[:count] = 200 if options[:count].to_i > 200
    options.compact!
    begin
      loaded_tweets = client.user_timeline(@name, options)
      p loaded_tweets
      return loaded_tweets
    rescue
      return []
    end
  end






end