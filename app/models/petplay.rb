class Petplay < ApplicationRecord
  belongs_to :user
  validates_presence_of :title,
                        :location,
                        :date,
                        :time
  validates :pet_players, presence: false

  def parks
    binding.pry
  end
end
