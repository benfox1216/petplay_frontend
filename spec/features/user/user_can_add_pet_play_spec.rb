require 'rails_helper'

RSpec.describe 'As a User' do
  it "can add a petplay" do
    user_1 = create(:user, zipcode: '80202')
    user_2 = create(:user, zipcode: '80202')
    pet_1 = create(:pet, user_id: user_1.id)
    pet_2 = create(:pet, user_id: user_2.id)
    pet_3 = create(:pet, user_id: user_2.id)
    petplay_1 = create(:petplay, title: 'Smallpups', pet_players: "#{user_1.id}", user_id: user_1.id, date: '10/02/2020', time: '12:00 pm', location: '80202')

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
      expect(page).to have_content("#{user_2.name}")
    end
  end
end
