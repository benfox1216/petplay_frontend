class PetplaysController < ApplicationController
  def index
    @petplays = Petplay.where(location: current_user.zipcode)
  end
  
  def show
    @petplay = Petplay.find(params[:id])
  end

  def new
    @petplay =  Petplay.new
  end

  def create
    coords = params["parks"].tr('^0-9-.,', '')
    coords[0] = ''
    latlng = coords
    google = GoogleService.new
    address = google.get_json(latlng)
    petplay = Petplay.new(title: params["petplay"]["title"],
                          date: params["petplay"]["date"],
                          time: params["petplay"]["time"],
                          user_id: current_user.id,
                          location: current_user.zipcode,
                          pet_players: current_user.image,
                          park_address: address)
    petplay.save
    flash[:success] = "You have created a PetPlay!"
    redirect_to '/petplays'
  end

  private
  def pp_params
    params.permit(:title, :location, :date, :time)
  end
end
