module TwitterHandler

  class Client
    attr_accessor :screen_name, :client, :user, :followers

    def initialize(screen_name)
      @screen_name = screen_name
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.application.secrets.twitter_api_key
        config.consumer_secret     = Rails.application.secrets.twitter_api_secret
        config.access_token        = Rails.application.secrets.twitter_access_token
        config.access_token_secret = Rails.application.secrets.twitter_access_secret
      end
    end

    def get_user
      @user = @client.user(@screen_name)
    end

    def get_followers
      @followers = @client.followers(@screen_name)
    end

  end
end