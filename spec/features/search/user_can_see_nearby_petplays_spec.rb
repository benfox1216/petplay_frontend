require 'rails_helper'

RSpec.describe 'As a user' do
  it 'can see nearby PetPlays when I visit /search' do

    user = User.create(name: 'Bob', email: 'bob@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80202')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    petplayer1A = User.create(name: 'PetPlayer 1A', email: 'petplayer1a@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80012')

    petplayer1B = User.create(name: 'PetPlayer 1B', email: 'petplayer1b@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80012')

    petplayer1C = User.create(name: 'PetPlayer 1C', email: 'petplayer1c@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80012')

    petplay1 = PetPlay.create(title: 'PetPlay Test 1',
                              pet_players: "#{petplayer1A.id}, #{petplayer1B.id}, #{petplayer1C.id}",
                              location: '80202')

    petplayer2A = User.create(name: 'PetPlayer 2A', email: 'petplayer2a@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80202')

    petplayer2B = User.create(name: 'PetPlayer 2B', email: 'petplayer2b@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80202')

    petplayer2C = User.create(name: 'PetPlayer 2C', email: 'petplayer2c@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80202')

    petplay2 = PetPlay.create(title: 'PetPlay Test 2',
                              pet_players: "#{petplayer2A.id}, #{petplayer2B.id}, #{petplayer2C.id}",
                              location: '80202')

    petplayer3A = User.create(name: 'PetPlayer 3A', email: 'petplayer3a@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80012')

    petplayer3B = User.create(name: 'PetPlayer 3B', email: 'petplayer3b@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80012')

    petplayer3C = User.create(name: 'PetPlayer 3C', email: 'petplayer3c@example',
                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png',
                google_token: 'abc123', zipcode: '80012')

    petplay3 = PetPlay.create(title: 'PetPlay Test 3',
                              pet_players: "#{petplayer3A.id}, #{petplayer3B.id}, #{petplayer3C.id}",
                              location: '80202')

    visit '/petplays'
    expect(current_path).to eql('/petplays')
    expect(page).to have_content('There are 3 PetPlays near 80202')

    within "#pet-play-1" do
      expect(page).to have_content('PetPlay Test 1')

      within('.pet-players-wrapper') do
        expect(page).to have_content('PetPlayer 1A')
        expect(page).to have_content('PetPlayer 1B')
        expect(page).to have_content('PetPlayer 1C')
      end
    end

    within('#pet-play-2') do
      expect(page).to have_content('PetPlay Test 2')

      within('.pet-players-wrapper') do
        expect(page).to have_content('PetPlayer 2A')
        expect(page).to have_content('PetPlayer 2B')
        expect(page).to have_content('PetPlayer 2C')
      end
    end

    within('#pet-play-3') do
      expect(page).to have_content('PetPlay Test 3')

      within('.pet-players-wrapper') do
        expect(page).to have_content('PetPlayer 3A')
        expect(page).to have_content('PetPlayer 3B')
        expect(page).to have_content('PetPlayer 3C')
      end
    end
  end
end
