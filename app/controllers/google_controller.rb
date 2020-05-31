class GoogleController < ApplicationController
  def create
    if auth
      user = User.from_omniauth(auth)
      user.save
      session[:user_id] = user.id
      redirect_to "/profile/#{user.id}", notice: 'Logged in with Google!'
    else
      redirect_to '/', notice: 'Failed to connect to Google'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end