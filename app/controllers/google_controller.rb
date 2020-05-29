class GoogleController < ApplicationController
  def create
    user = User.from_omniauth(auth)
    user.save
    session[:user_id] = user.id
    redirect_to "/profile/#{user.id}"
  end

  private
  def auth
    request.env['omniauth.auth']
  end


end