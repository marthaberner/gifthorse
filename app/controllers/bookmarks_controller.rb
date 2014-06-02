class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.create(allowed_params)

    render nothing: true
  end

  def new

  end

  private

  def allowed_params
    params.require(:bookmark).permit(:title, :url, :user_id)
  end
end