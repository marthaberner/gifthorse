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
end