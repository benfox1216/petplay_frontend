class Pet < ApplicationRecord
  validates_presence_of :name, :species, :breed, :size, :about_me
  belongs_to :user
  
  # def self.find_
  #
  # end
end