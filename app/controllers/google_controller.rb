class GoogleController < ApplicationController
  def create
    @user = User.from_omniauth(auth)
    @user.save
    binding.pry
    session[:user_id] = @user.id
    redirect_to '/'
  end

  private
  def auth
    request.env['omniauth.auth']
  end


end