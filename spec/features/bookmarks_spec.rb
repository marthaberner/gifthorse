require 'spec_helper'

feature 'User Bookmarks' do
  scenario 'Only a user\'s bookmarks display in their account' do
    user = create_user(email: 'sue@sue.com')
    user2 = create_user(email: 'joe@joe.com')
    create_bookmark(user.id, title: 'Some Awesome Thing')
    create_bookmark(user2.id, title: 'Some Other Awesome Thing')

    visit '/'

    within('.login-home') do
    fill_in 'Email', with: 'sue@sue.com'
    fill_in 'Password', with: 'password1'
    click_on 'Login'
    end

    expect(page).to have_content 'Hello, sue@sue.com'
    expect(page).to have_no_content 'Some Other Awesome Thing'
  end
end

