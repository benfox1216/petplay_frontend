class PetPlaysController < ApplicationController
  def index
    @pet_plays = PetPlay.all
  end
end
