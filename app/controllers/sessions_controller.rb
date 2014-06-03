class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash.now[:notice] = 'invalid email/password'
      render :new
    end
  end

  def new

  end

  def destroy
    session[:id] = nil

    redirect_to root_path, notice: 'Logout successful.'
  end

  private

  def decrypted_password(password)
    BCrypt::Password.new(password)
  end
end