class UsersController < ApplicationController 

  def show
    @user = User.find(params[:id])
  end

  def zip
    @user = User.find(params[:id])
    @user.update(zipcode: user_params[:zipcode])
    redirect_to "/profile/#{@user.id}"
  end

  def user_params
    params.permit(:name, :email, :image, :zipcode, :github_token)
  end
end 