require 'spec_helper'

feature 'User Registratoin' do
  scenario 'User can create an account' do
    visit '/'

    fill_in 'user[email]', with: 'joe@joe.com'
    fill_in 'user[password]', with: 'password1'
    fill_in 'user[password_confirmation]', with: 'password1'
    click_on 'Create An Account'

    expect(page).to have_content 'Welcome, joe@joe.com'
  end

  scenario 'User sees an error message if they register with an invalid email' do
    visit '/'

    fill_in 'user[email]', with: 'invaliduser@example,com'
    fill_in 'user[password]', with: 'password1'
    fill_in 'user[password_confirmation]', with: 'password1'
    click_on 'Create An Account'

    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email is invalid'
  end
end