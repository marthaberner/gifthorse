class BookmarksController < ApplicationController

  def create

    # if they are not logged in
    # redirect to the login page

    # Later...
    # sometime in the future.... store the title and url
    # after login, redirect back here

    Bookmark.create!(
      title: params[:title],
      url: params[:url],
      user_id: session[:id]
    )

    redirect_to params[:url]
  end

  def js
    render 'bookmark.js'
  end

end