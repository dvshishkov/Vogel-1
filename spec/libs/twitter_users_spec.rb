require 'rails_helper'


describe TwitterUser do
  let(:user) {TwitterUser.new('tgriff3')}

  it 'has some info' do
    expect(user.user_info).to_not be_nil
  end
end