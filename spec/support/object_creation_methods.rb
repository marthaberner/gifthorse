def create_user(attributes={})
  user = new_user(attributes)
  user.save!
  user
end

def new_user(attributes={})
  defaults = {
    first_name: 'User',
    last_name: 'Name',
    email: 'user@user.com',
    password: 'password1',
    password_confirmation: 'password1',
  }

  User.new(defaults.merge(attributes))
end

def create_bookmark(user_id, attributes={})
  bookmark = new_bookmark(user_id, attributes)
  bookmark.save!
  bookmark.update(short_url: "localhost:3000/#{bookmark.id}")
  bookmark
end

def new_bookmark(user_id, attributes = {})
  defaults = {
    user_id: user_id,
    url: 'http://www.url.com',
    title: 'Some Awesome Thing',
    short_url: nil
  }

  Bookmark.new(defaults.merge(attributes))
end

def login(user)
  visit root_path
  within(".login-home") do
    fill_in "Email", with: user.email
    fill_in "Password", with: 'password1'
    click_on "Login"
  end
end
