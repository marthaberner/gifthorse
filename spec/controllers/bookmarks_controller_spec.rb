require 'spec_helper'

describe BookmarksController do
  it 'Creates a Bookmark' do
    User.create(email: 'joe@joe.com', password: 'password1', password_confirmation: 'password1')
    Bookmark.create(title:'Awesome Thing', url: 'http://www.things.com')
    bookmark = Bookmark.last

    expect(bookmark.title).to eq('Awesome Thing')
    expect(bookmark.url).to eq('http://www.things.com')
  end

  it 'Url cannot be nil' do
    User.create(email: 'joe@joe.com', password: 'password1', password_confirmation: 'password1')
    Bookmark.create(title:'Awesome Thing', url: 'http://www.things.com')
    Bookmark.create(title:'Another Awesome Thing', url: nil)
    bookmark = Bookmark.last

    expect(bookmark.title).to eq('Awesome Thing')
    expect(bookmark.url).to eq('http://www.things.com')
  end
end