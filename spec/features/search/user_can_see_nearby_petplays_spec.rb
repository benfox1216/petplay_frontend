require 'rails_helper'

RSpec.describe 'As a user' do
  it 'can see nearby PetPlays when I visit /search' do
    # user = create(:user, zipcode: 80202)

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user = User.create(name: "Bob", email: "bob@example",
                        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png",
                        google_token: "abc123", zipcode: "80012")

    visit '/petplays'
    expect(current_path).to eql('/petplays')

    within('.content-wrapper') do
      within('.content') do
        expect(page).to have_css('content-head')
        expect(page).to have_content('There are 3 PetPlays near 80202')

        within('#petplay-1') do
          expect(page).to have_content('PetPlay Test 1')

          within('pet-players-wrapper') do
            expect(page).to have_content('PetPlayer 1A')
            expect(page).to have_content('PetPlayer 1B')
            expect(page).to have_content('PetPlayer 1C')
          end
        end

        within('#petplay-2') do
          expect(page).to have_content('PetPlay Test 2')

          within('pet-players-wrapper') do
            expect(page).to have_content('PetPlayer 2A')
            expect(page).to have_content('PetPlayer 2B')
            expect(page).to have_content('PetPlayer 2C')
          end
        end

        within('#petplay-3') do
          expect(page).to have_content('PetPlay Test 3')

          within('pet-players-wrapper') do
            expect(page).to have_content('PetPlayer 3A')
            expect(page).to have_content('PetPlayer 3B')
            expect(page).to have_content('PetPlayer 3C')
          end
        end
      end
    end
  end
end
