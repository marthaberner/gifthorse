class FriendsController < ApplicationController

  def index
    @user = User.find(session[:id])
    @users = User.all
  end
end