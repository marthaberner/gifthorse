class UsersController < ApplicationController

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
   @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end