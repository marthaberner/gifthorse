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
    bob = create_user(first_name: 'Bob', last_name: 'Rob', email: 'bob@bob.com')
    zak = create_user(first_name: 'Zak', last_name: 'Attack', email: 'zak@zak.com')
    Friendship.create(user_id: sue.id, friend_id: joe.id, confirmed: false, pending: true)
    login(joe)

    click_link 'Friend Requests'
    expect(page).to have_content('Sue Summer')
    click_on 'Confirm Friendship'
    expect(page).to have_content('Friendship Confirmed')
    expect(page).to have_no_content('Sue Summer')

    #user can view current friends on account page, not pending
    Friendship.create(user_id: joe.id, friend_id: bob.id, confirmed: true, pending: false)
    Friendship.create(user_id: joe.id, friend_id: zak.id, confirmed: false, pending: true)
    click_link 'My Account'
    expect(page).to have_content('Sue Summer')
    expect(page).to have_content('Bob Rob')
    expect(page).to have_no_content('Zak Attack')
  end
end
