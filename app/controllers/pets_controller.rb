class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end
  
  def create
    pet = Pet.create(pet_params)
    if pet.save
      flash[:success] = 'Your pet was added!'
      redirect_to "/profile/#{pet.user.id}"
    else
      flash[:error] = 'Pet not added. Missing fields or incorrect entry.
      Please try again.'
    end
  end
  
  private
  
  def pet_params
    params.require(:pet).permit(:name, :species, :age, :breed, :size)
  end
end