class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new, notice: 'invalid email/password'
    end
  end

  def destroy
    session.clear

    redirect_to root_path, notice: 'Logout successful.'
  end

  private

  def decrypted_password(password)
    BCrypt::Password.new(password)
  end
end