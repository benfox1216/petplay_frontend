class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end
  
  def create
    pet = current_user.pets.create(pet_params)
    
    if pet.save
      flash[:success] = 'Your pet was added!'
      redirect_to "/profile/#{pet.user.id}"
    else
      flash[:error] = 'Pet not added. Missing fields or incorrect entry.
      Please try again.'
      redirect_to "/pets/new"
    end
  end
  
  private
  
  def pet_params
    params.require(:pet).permit(:name, :species, :age, :breed, :size, :about_me)
  end
end