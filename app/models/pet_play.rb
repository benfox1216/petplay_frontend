class PetPlay < ApplicationRecord
  belongs_to :user
  validates_presence_of :title,
                        :location,
                        :date,
                        :time
  validates :pet_players, presence: false 


end
