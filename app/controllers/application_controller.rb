class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  def logged_in?
    if session[:id].present? && User.find(session[:id])
      true
    end
  end

  def bookmark_belongs_to_user?(bookmark)
    user = User.find(session[:id])
    bookmark.user_id == user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :logged_in?, :current_user, :bookmark_belongs_to_user?
end

