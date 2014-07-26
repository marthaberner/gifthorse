require 'spec_helper'

feature 'Friendship' do
  scenario 'User can see a list of other users' do
    user1 = create_user
    create_user(email: 'joe@joe.com')
    login(user1)

    expect(page).to have_content('Hello, User')
    click_link 'Find Friends'
    expect(page).to have_content('joe@joe.com')
  end
end