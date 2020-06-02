require 'rails_helper'

RSpec.describe 'As a User' do
  it "can add a pet_play" do 
    user = create(:user, zipcode: '80202')
    pet_1 = create(:pet, user_id: user.id)
    pet_play = PetPlay.create(user_id: user.id, title: "Smallpups", location:'Confluence Park',Address: '2250 15th St, Denver, CO 80202', Date: '10/02/2020' Time: '12:00 pm')
   
    service = DistanceService.new
    origin = { search_origin: 80202 }
    destination = { search_destination: 80202 }
    location_1 = service.by_location(origin, destination)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/profile/#{user.id}"

    
    within ".pet_play-#{pet_play_1.id}" do
      expect(page).to have_content('Location: Confluence Park')
      expect(page).to have_content('Address: 2250 15th St, Denver, CO 80202')
      expect(page).to have_content('Date: 10/02/2020')
      expect(page).to have_content('Time: 12:00 pm')
    end
    
    click_button 'Add A PetPlay'

    within ".locations-#{location_1.id}" do
      expect(page).to have_content("Location: Commons Park")
      expect(page).to have_content("Address: 2101 15th St, Denver, CO 80202")
    end 
    
    expect(current_path).to eq('/petplays/new')

    fill_in 'Title', with: 'BigPups'
    fill_in 'Date', with: '10/02/2020'
    select 'Time', from: '10:00 am'

    click_on 'Create'

    expect(current_path).to eq('/search')  

    within ".pet_play-#{pet_play.id}" do
      expect(page).to have_content('Title: BigPups')
      expect(page).to have_content('Location: Cheesman Park')
      expect(page).to have_content('Address: Cheesman Park, Denver, CO, USA ')
      expect(page).to have_content('Date: 10/02/2020')
      expect(page).to have_content('Time: 10:00 am')
    end
  end
end

# Test can see Can user_2 can join a pet play. 