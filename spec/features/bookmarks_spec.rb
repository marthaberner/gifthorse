require 'spec_helper'

feature 'User Bookmarks' do
  scenario 'Only a user\'s bookmarks display in their account' do
    user = create_user
    bookmark = create_bookmark(user.id)

    visit '/'

    within('.login-home') do
    fill_in 'Email', with: 'user@user.com'
    fill_in 'Password', with: 'password1'
    click_on 'Login'
    end

    expect(page).to have_content 'http://www.url.com'
    expect(page).to have_content 'Hello, user@user.com'
  end
end

