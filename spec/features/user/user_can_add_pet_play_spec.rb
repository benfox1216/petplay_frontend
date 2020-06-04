require 'rails_helper'

RSpec.describe 'As a User' do
  it "can add a petplay" do
    user_1 = create(:user, zipcode: '80202')
    user_2 = create(:user, zipcode: '80202')
    pet_1 = create(:pet, user_id: user_1.id)
    pet_2 = create(:pet, user_id: user_2.id)
    pet_3 = create(:pet, user_id: user_2.id)
    petplay_1 = create(:petplay, title: 'Smallpups', pet_players: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ba-bamail.com%2Fcontent.aspx%3Femailid%3D22163&psig=AOvVaw0U1kVPt5PeukVQqP3H3IWF&ust=1591379683222000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDGnMLd6OkCFQAAAAAdAAAAABAD", user_id: user_1.id, date: '10/02/2020', time: '12:00 pm', location: '80202')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

    visit "/petplays"

    within "#pet-play-1" do
      expect(page).to have_content('Smallpups')
    end
    
    click_button 'Create PetPlay'

    expect(current_path).to eq('/petplays/new')
    
    within ".new_petplay" do
      fill_in 'petplay_title', with: 'BigPups'
      fill_in 'petplay_date', with: '10/02/2020'
      fill_in 'petplay_time', with: '10:00 AM'
      within "#pet-#{pet_2.id}" do
        check("pet_ids[]", allow_label_click: true)
      end
    end

    click_button ('Add PetPlay')
    
    expect(current_path).to eq('/petplays')

    within "#pet-play-2" do
      expect(page).to have_content('BigPups')
    end
  end
end
