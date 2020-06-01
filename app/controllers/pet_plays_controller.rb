class PetPlaysController < ApplicationController
  def index
    @pet_plays = PetPlay.where(location: current_user.zipcode)
  end
end
