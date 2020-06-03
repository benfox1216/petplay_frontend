require 'rails_helper'

RSpec.describe 'As a user' do
  it 'can see nearby PetPlays when I visit /search' do
    user = create(:user, zipcode: '80202')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    petplayer1A = create(:user, zipcode: '80012')

    petplayer1B = create(:user, zipcode: '80012')

    petplayer1C = create(:user, zipcode: '80012')

    petplay1 = PetPlay.create(title: 'PetPlay Test 1',
                              pet_players: "#{petplayer1A.id}, #{petplayer1B.id}, #{petplayer1C.id}",
                              location: '80202',
                              user_id: petplayer1A.id)

    petplayer2A = create(:user, zipcode: '80202')

    petplayer2B = create(:user, zipcode: '80202')

    petplayer2C = create(:user, zipcode: '80202')

    petplay2 = PetPlay.create(title: 'PetPlay Test 2',
                              pet_players: "#{petplayer2A.id}, #{petplayer2B.id}, #{petplayer2C.id}",
                              location: '80202',
                              user_id: petplayer2A.id)

    petplayer3A = create(:user, zipcode: '80012')

    petplayer3B = create(:user, zipcode: '80012')

    petplayer3C = create(:user, zipcode: '80012')

    petplay3 = PetPlay.create(title: 'PetPlay Test 3',
                              pet_players: "#{petplayer3A.id}, #{petplayer3B.id}, #{petplayer3C.id}",
                              location: '80202',
                              user_id: petplayer3A.id)

    visit '/petplays'

    expect(current_path).to eql('/petplays')
    expect(page).to have_content('There are 3 PetPlays near 80202')
    within "#pet-play-1" do
      expect(page).to have_content("#{petplay1.title}")

      within('.pet-players-wrapper') do
        expect(page).to have_content("#{petplayer1A.name}")
        expect(page).to have_content("#{petplayer1B.name}")
        expect(page).to have_content("#{petplayer1C.name}")
      end
    end

    within('#pet-play-2') do
      expect(page).to have_content("#{petplay2.title}")

      within('.pet-players-wrapper') do
        expect(page).to have_content("#{petplayer2A.name}")
        expect(page).to have_content("#{petplayer2B.name}")
        expect(page).to have_content("#{petplayer2C.name}")
      end
    end

    within('#pet-play-3') do
      expect(page).to have_content("#{petplay3.title}")

      within('.pet-players-wrapper') do
        expect(page).to have_content("#{petplayer3A.name}")
        expect(page).to have_content("#{petplayer3B.name}")
        expect(page).to have_content("#{petplayer3C.name}")
      end
    end
  end
end

