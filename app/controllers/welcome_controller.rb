class WelcomeController < ApplicationController

  def index
    @user = User.new
  end

  def intro

  end
end