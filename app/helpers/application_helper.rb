module ApplicationHelper
  def list_pet_players(pet_players)
    players_array = pet_players.split(", ")
    players_array.map do |player|
      User.find_by(id: player).name
    end
  end
end
