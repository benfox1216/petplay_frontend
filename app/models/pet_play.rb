class PetPlay < ApplicationRecord
  belongs_to :user
  
  # def get_names_from_ids
  #   pp = pet_players.split(", ")
  #
  #   pp.each do
  #   User.find(pet_players)
  # end
end
