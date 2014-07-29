class FriendshipsController < ApplicationController

  def new
    @user = User.find(session[:id])
    @users = User.all
    @friendship = Friendship.new
  end

  def create
    logged_in_user = current_user
    @friendship = Friendship.new(
      friend_id: params[:user_id],
      user_id: logged_in_user.id,
      confirmed: false,
      pending: true
    )
    if @friendship.save
      flash[:notice] = "Your friend request has been sent"
      redirect_to new_user_friendship_path(logged_in_user)
    else
      render :new
    end
  end

  def friendship_params
    params.require(:friendship).permit(:pending, :confirmed, :user_id).merge(friend_id: params[:user_id])
  end
end