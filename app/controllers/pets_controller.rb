class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end
  
  def create
    pet = Pet.create(pet_params)
    
    if tutorial.save
      flash[:success] = 'Your pet was added!'
      redirect_to "/"
    end
  end
  
  private
  
  def pet_params
    params.require(:pet).permit(:name, :species, :age, :breed, :size)
  end
end