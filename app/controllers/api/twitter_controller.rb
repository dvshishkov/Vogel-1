class Api::TwitterController < Api::BaseController
  def show
    check_required_params(:user_name)
    @twitter_user = TwitterUser.new(params[:user_name])
    unless @twitter_user.is_valid?
      render nothing: true, status: 404
    end
    @twitter_user.load
    # p @twitter_user.user_info.location
  end

  def tweets
    check_required_params(:user_name)
    @tweets = []
    twitter_user = TwitterUser.new(params[:user_name])
    @tweets = twitter_user.get_tweets({count: params[:count], max_id: params[:max_id]})
  end

  def compare
    check_required_params(:user1, :user2)
    twitter_user1, twitter_user2 = [TwitterUser.new(params[:user1]), witterUser.new(params[:user2])]
    unless valid1 = twitter_user1.is_valid? || valid2 = twitter_user2.is_valid?
      render json: {user1: valid1, user2: valid2}, status: 400
    end
    twitter_user1.load
    twitter_user2.load
    @overlapping_followers = twitter_user1.followers & twitter_user2.followers
  end


  private

  def check_required_params(*req_params)
    missing_params = {missing: []}
    req_params.each {|p| missing_params[:missing] << p unless params.include? p}
    if missing_params[:missing].any?
      render json: missing_params, status: 400
    end
  end



end