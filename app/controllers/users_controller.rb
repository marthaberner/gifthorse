class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @my_friends = Friendship.where(friend_id: current_user.id).map(&:user)
    @my_bookmarks = current_user.bookmarks
    @user = User.find(params[:id])
    session[:id] = @user.id
  end

  def destroy
    session.clear

    redirect_to root_path, notice: 'Logout successful.'
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end