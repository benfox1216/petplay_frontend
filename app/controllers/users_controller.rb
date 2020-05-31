class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  #flash message is not working
  def zip
    @user = User.find(params[:id])
    update = @user.update(zipcode: user_params[:zipcode])
    if user_params[:zipcode]
      redirect_to "/profile/#{@user.id}"
    else
      flash[:error] = 'Invalid zipcode, please try again.'
      redirect_to "/profile/#{@user.id}"
    end
  end

  def user_params
    params.permit(:name, :email, :image, :zipcode, :github_token)
  end
end 