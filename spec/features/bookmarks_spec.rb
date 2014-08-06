require 'spec_helper'

feature 'User Bookmarks' do
  scenario 'Only a user\'s bookmarks display in their account' do
    user1 = create_user(email: 'sue@sue.com')
    user2 = create_user(email: 'joe@joe.com')
    create_bookmark(user2.id, title: 'Some Other Awesome Thing')
    create_bookmark(user1.id,
                    title: 'Some Very Long Dragging On Name That Goes On Forever Awesome Thing',
                    url: 'http://www.someverylongstupidurlwithlotsof12345.com')

    visit '/'

    click_link "Login"
      fill_in 'Email', with: 'sue@sue.com'
      fill_in 'Password', with: 'password1'
      click_on 'Login'

    # displayed title is shortened
    expect(page).to have_content 'Hello, User'
    expect(page).to have_content 'Some Very Long Dragging On Name That Goes On Forever Awesome...'
    expect(page).to have_no_content 'Some Other Awesome Thing'
  end
end

