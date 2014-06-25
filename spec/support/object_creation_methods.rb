def create_user
  user = User.create!(
    email: 'user@user.com',
    password: 'password1',
    password_confirmation: 'password1',
  )

  user.save
  user
end

def create_bookmark(user_id)
 bookmark = Bookmark.create!(
   url: 'http://www.url.com',
   user_id: user_id
  )

  bookmark.save
  bookmark
end
