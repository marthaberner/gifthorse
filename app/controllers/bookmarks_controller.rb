class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(
      title: params[:title],
      url: params[:url],
      user_id: session[:id],
    )
    if @bookmark.save
      @bookmark.update(short_url: "#{request.host_with_port}/#{@bookmark.id}")
      redirect_to params[:url]
    else
      redirect_to root_url
    end
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

  private

  def is_session?
    if session[:id].present? && User.find(session[:id])
      true
    end
  end
end
