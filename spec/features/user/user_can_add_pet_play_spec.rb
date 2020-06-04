require 'rails_helper'

RSpec.describe 'As a User' do
  xit "can add a pet_play" do
    user_1 = create(:user, zipcode: '80202')
    user_2 = create(:user, zipcode: '80202')
    pet_1 = create(:pet, user_id: user_1.id)
    pet_2 = create(:pet, user_id: user_2.id)
    pet_3 = create(:pet, user_id: user_2.id)
    petplay_1 = create(:pet_play, title: 'Smallpups', pet_players: "#{user_1.id}", user_id: user_1.id, date: '10/02/2020', time: '12:00 pm', location: '80202')
   
    # service = DistanceService.new
    # origin = { search_origin: 80202 }
    # destination = { search_destination: 80202 }
    # location_1 = service.by_location(origin, destination)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

    visit "/petplays"

    within "#pet-play-1" do
      expect(page).to have_content('Smallpups')
    end
    
    click_button 'Create PetPlay'
    # save_and_open_page

    expect(current_path).to eq('/pet_plays/new')

    # within ".locations-#{location_1.id}" do
    #   expect(page).to have_content("Location: Commons Park")
    #   expect(page).to have_content("Address: 2101 15th St, Denver, CO 80202")
    # end
    
    within ".new_pet_play" do
      fill_in 'pet_play_title', with: 'BigPups'
      fill_in 'pet_play_date', with: '10/02/2020'
      fill_in 'pet_play_time', with: '10:00 AM'
      check("#{pet_2.id}", allow_label_click: true)
      # select "#{pet_2.id}", from: 'pet'
    end

    # <tr id=pet-<%="#{pet.id}" %>>
    click_button ('Add PetPlay')
    
    expect(current_path).to eq('/search')

    within ".pet_play-#{pet_play.id}" do
      expect(page).to have_content('Title: BigPups')
      expect(page).to have_content("Location: Commons Park")
      expect(page).to have_content('Address: 2101 15th St, Denver, CO 80202 ')
      expect(page).to have_content('Date: 10/02/2020')
      expect(page).to have_content('Time: 10:00 am')
      expect(page).to have_content("Attendees, #{user_2.name} ")
    end
  end
end

# Test can see Can user_2 can join a pet play.
# <%= f.label :Time %>
# <%= f.time_field("time", min: Time.now.to_i) %><br>