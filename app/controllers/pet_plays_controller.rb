class PetPlaysController < ApplicationController
  def index
    @pet_plays = PetPlay.where(location: current_user.zipcode)
  end
  
  def show
    @pet_play = PetPlay.find(params[:id])
  end

  def new
    @pet_play =  PetPlay.new(pp_params)
  end 

  def create 
    pet_play = PetPlay.new(title: params["pet_play"]["title"], 
                           date: params["pet_play"]["date"],
                           time: params["pet_play"]["time"],
                           user_id: current_user.id,
                           location: current_user.zipcode,
                           pet_players: current_user.image)
    pet_play.save
    flash[:success] = "You have created a PetPlay!"
    redirect_to '/petplays'
  end 

  private 
  def pp_params
    params.permit(:title, :date, :time)
  end
end
