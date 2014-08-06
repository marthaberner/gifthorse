require 'spec_helper'

feature 'Friendships' do
  scenario 'User can add friends' do
    user1 = create_user
    create_user(first_name: 'Joe', last_name: 'Schmoe', email: 'joe@joe.com')
    login(user1)

    click_link 'Find Friends'
    expect(page).to have_content('Joe Schmoe')
    click_on 'Add Friend'
    expect(page).to have_content('Your friend request has been sent')
    expect(page).to have_no_content('Joe Schmoe')
  end

  scenario 'Users can confirm friendship requests' do
    sue = create_user(first_name: 'Sue', last_name: 'Summer', email: 'sue@sue.com')
    joe = create_user(first_name: 'Joe', last_name: 'Schmoe', email: 'joe@joe.com')
    Friendship.create(user_id: sue.id, friend_id: joe.id, confirmed: false, pending: true)
    login(joe)

    click_link 'Friend Requests'
    expect(page).to have_content('Sue Summer')
    expect(page).to have_content('Confirm Friendship')
    click_link 'Confirm Friendship'
    expect(page).to have_content('Friendship Confirmed')
    expect(page).to have_no_content('Sue Summer')

  end
end
