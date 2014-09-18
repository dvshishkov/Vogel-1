class Api::TwitterController < Api::BaseController

  def show
    check_required_params(:user_name)
    twitter = TwitterService.new
    if twitter.user_exists? params[:user_name]
      @twitter_user = OpenStruct.new(user: twitter.get_info(params[:user_name]), tweets: twitter.get_tweets(params[:user_name]))
    else
      fail(nil, 404)
    end
  end

  def tweets
    check_required_params(:user_name)
    twitter = TwitterService.new
    if twitter.user_exists? params[:user_name]
      @tweets = twitter.get_tweets(params[:user_name], {count: params[:count], max_id: params[:max_id]})
    else
      fail(nil, 404)
    end
  end

  def compare
    check_required_params(:user1, :user2)
    twitter = TwitterService.new
    if user_exist1 = twitter.user_exists?(params[:user1]) && user_exist2 = twitter.user_exists?(params[:user2])
      # @overlapping_followers = twitter.compare_followers(params[:user1], params[:user2])

      # NOTE: DUE TO TWITTER RATE LIMIT, THIS IS HERE FOR EXAMPLE PURPOSES
      @overlapping_followers = [OpenStruct.new(screen_name: 'test1'), OpenStruct.new(screen_name: 'test2')]
    else
      render json: {error: {user1: user_exist1, user2: user_exist2 || false}}, status: 400
    end
  end

  private

  def check_required_params(*req_params)
    missing_params = {missing: []}
    req_params.each {|p| missing_params[:missing] << p unless params.include? p}
    if missing_params[:missing].any?
      render json: missing_params, status: 400
    end
  end

  def fail(message = nil, status)
    render json: message || {}, status: status
  end






end