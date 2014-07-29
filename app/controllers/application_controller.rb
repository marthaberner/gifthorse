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

  def are_not_friends?(user)
    friend_id = user.id
    friendship = find_friendship(friend_id)
    !friendship.present?
    end

  def find_friendship(friend_id)
    Friendship.where(
      "user_id = :user_id and friend_id = :friend_id OR user_id = :friend_id and friend_id = :user_id",
      user_id: current_user.id,
      friend_id: friend_id
    ).first
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  helper_method :logged_in?, :current_user, :bookmark_belongs_to_user?, :are_not_friends?
end

