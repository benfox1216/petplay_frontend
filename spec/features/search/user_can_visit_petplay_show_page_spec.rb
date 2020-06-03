require 'rails_helper'

describe "As a user" do
  describe "when I visit the PetPlay show page" do
    it "I can see all the info for that PetPlay" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      pet_play = create(:pet_play, user_id: user.id)

      visit "/petplays/#{pet_play.id}"

      expect(page).to have_content("PetPlay: #{pet_play.title}")
      expect(page).to have_content("Created By: #{user.name}")
      expect(page).to have_content('Location: Burberry Park')
      expect(page).to have_content('Attending:')
    end
  end
  
  it "I see the correct PetPlay on the show page, and only that PetPlay" do
    user_1 = create(:user)
    user_2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    pet_play_1 = create(:pet_play, user_id: user_1.id)
    pet_play_2 = create(:pet_play, user_id: user_1.id)
    pet_play_3 = create(:pet_play, user_id: user_2.id)

    visit "/petplays/#{pet_play_2.id}"

    expect(page).to have_content("PetPlay: #{pet_play_2.title}")
    expect(page).to have_content("Created By: #{user_1.name}")
    expect(page).to have_content('Location: Burberry Park')
    expect(page).to have_content('Attending:')
  end
end
