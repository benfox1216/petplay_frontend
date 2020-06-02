class PetPlayController < ApplicationController

  def new
    @petplay =  PetPlay.new
  end 

  def create 
    binding.pry
  end 
end 