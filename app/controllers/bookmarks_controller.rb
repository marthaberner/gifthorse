class BookmarksController < ApplicationController

  def create
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