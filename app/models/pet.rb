class Pet < ApplicationRecord
  validates_presence_of :name, :species, :age, :breed, :size
  belongs_to :user
end