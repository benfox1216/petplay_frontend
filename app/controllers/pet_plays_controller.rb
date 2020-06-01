class PetPlaysController < ApplicationController
  def index
    @pet_plays = PetPlay.where(location: current_user.zipcode)
  end
  
  def show
    @pet_play = PetPlay.find(params[:id])
  end
end
