class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.create!(
      title: params[:title],
      url: params[:url],
      user_id: session[:id]
    )

    redirect_to params[:url]
  end

  def destroy
    @user = User.find(session[:id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete

    redirect_to user_path(@user.id)
  end

  def js
    render 'bookmark.js'
  end

  def is_session?
    if session[:id].present? && User.find(session[:id])
      true
    end
  end
end
