require 'rails_helper'

describe TwitterHandler do

  let(:client) { TwitterHandler::Client.new('tgriff3') }

  it 'can get a user from twitter' do
    user = client.get_user
    expect(client.user).to_not be_nil
    expect(user).to_not be_nil
  end

  it 'can get the followers of a user' do
    followers = client.get_followers
    expect(client.followers).to_not be_nil
    expect(followers).to_not be_nil
  end


end