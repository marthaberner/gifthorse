class FriendshipsController < ApplicationController

  def index
    @my_pending_friendships = Friendship.where(
      friend_id: current_user.id,
      pending: true
    )
    @user = current_user
  end

  def show


  end

  def new
    @user = User.find(session[:id])
    @users = User.all
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(
      friend_id: params[:user_id],
      user_id: current_user.id,
      confirmed: false,
      pending: true
    )
    if @friendship.save
      flash[:notice] = "Your friend request has been sent"
      redirect_to new_user_friendship_path(current_user)
    else
      render :new
    end
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update(
      pending: false,
      confirmed: true
    )

    redirect_to pending_friendships_path(current_user), notice: "Friendship Confirmed!"
  end

  def friendship_params
    params.require(:friendship).permit(:pending, :confirmed, :user_id).merge(friend_id: params[:user_id])
  end
end