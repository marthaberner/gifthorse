require 'spec_helper'

describe Friendship do
  it 'Validates uniqueness of a friendship' do
    user_1 = create_user
    user_2 = create_user(first_name: 'Friend', last_name: 'Name', email: 'friend@friend.com')
    Friendship.create!(user_id: user_1.id, friend_id: user_2.id)
    friend_request = Friendship.new(user_id: user_1.id, friend_id: user_2.id)

    expect(friend_request.valid?).to eq false
  end
end