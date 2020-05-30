class PetsController < ApplicationController
  def new; end
  
  def create
    pet = Pet.create(pet_params)
  end
  
  private
  
  def pet_params
    params.permit(:type, :name, :age, :breed, :size)
  end
end